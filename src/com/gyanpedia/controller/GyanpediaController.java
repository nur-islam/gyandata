package com.gyanpedia.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.gyanpedia.model.ContentReply;
import com.gyanpedia.model.PostContent;
import com.gyanpedia.model.User;
import com.gyanpedia.service.GyanpediaServiceImpl;
import com.gyanpedia.service.IGyanpediaService;
import com.gyanpedia.util.Constant;
import com.gyanpedia.util.GyanpediaException;

@WebServlet("/gyanpediacontroller")
public class GyanpediaController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static final Logger LOGGER = Logger.getLogger(GyanpediaController.class.getName());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPerform(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPerform(req, resp);
	}

	protected void doPerform(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter(Constant.ACTION);
		LOGGER.info("action: " + action);
		if (Constant.METHOD_LOGIN.equalsIgnoreCase(action)) {
			performLogin(req, resp);
		} else if (Constant.METHOD_REGISTER.equalsIgnoreCase(action)) {
			checkSessionExists(req, resp);
			performRegister(req, resp);
		} else if (Constant.METHOD_SHOW_USER.equalsIgnoreCase(action)) {
			checkSessionExists(req, resp);
			resp.sendRedirect("home.jsp");
		} else if (Constant.METHOD_POST_CONTENT.equalsIgnoreCase(action)) {
			checkSessionExists(req, resp);
			handlePostContent(req, resp);
		} else if (Constant.METHOD_POST_CONTENT_REPLY.equalsIgnoreCase(action)) {
			checkSessionExists(req, resp);
			handlePostReply(req, resp);
		} else if (Constant.METHOD_LOAD_CONTENT.equalsIgnoreCase(action)) {
			checkSessionExists(req, resp);
			loadContent(req, resp);
		} else {
			resp.sendRedirect("index.jsp");
		}
	}
	
	private void checkSessionExists(HttpServletRequest request, HttpServletResponse resp) throws IOException{
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("authenticatUser");
		if(user == null){
			resp.sendRedirect("index.jsp");
		}
	}

	private void handlePostReply(HttpServletRequest req, HttpServletResponse resp) {
		IGyanpediaService service = new GyanpediaServiceImpl();
		String content = req.getParameter("postContent");
		String userId = req.getParameter("userId");
		String contentId = req.getParameter("contentId");
		try {
			boolean savePostReply = service.savePostReply(userId, contentId, content);
		} catch (GyanpediaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void handlePostContent(HttpServletRequest req, HttpServletResponse resp) {
		IGyanpediaService service = new GyanpediaServiceImpl();
		String content = req.getParameter("postContent");
		String userId = req.getParameter("userId");
		try {
			service.savePost(userId, content);
		} catch (GyanpediaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void performRegister(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		User user = new User();
		user.setName(req.getParameter("name"));
		user.setOrganization(req.getParameter("organisation"));
		user.setPassword(req.getParameter("password"));
		user.setRole(req.getParameter("role"));
		//user.setUserid(Integer.valueOf(req.getParameter("user_details_id")));
		user.setPhone(Integer.valueOf(req.getParameter("phone")));
		user.setStreet(req.getParameter("street"));
		user.setCity(req.getParameter("city"));
		user.setState(req.getParameter("state"));
		user.setPincode(Integer.valueOf(req.getParameter("pincode")));
		user.setEmail(req.getParameter("email"));
		user.setCountry(req.getParameter("country"));
		user.setStream(req.getParameter("stream"));
		user.setNationality(req.getParameter("nationality"));
		user.setGender(req.getParameter("gender"));
		String date = req.getParameter("birthdate");

		DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		Date parse = null;
		try {
			parse = dateFormat.parse(date);
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		java.sql.Date birthDate = new java.sql.Date(parse.getTime());
		user.setBirthDate(birthDate);
		IGyanpediaService service = new GyanpediaServiceImpl();
		HttpSession session = req.getSession();
		boolean isSuccess = false;
		try {
			User existingUser = service.getAuthenticatUser(user.getEmail(), user.getPassword());
			if (existingUser.getUserid() > 0) {
				session.setAttribute("msg", "User Already Exists");
				resp.sendRedirect("Registration.jsp");
			} else {
				isSuccess = service.saveUser(user);
				if (isSuccess) {
					User userDetails = service.getAuthenticatUser(user.getEmail(), user.getPassword());
					session.setAttribute("authenticatUser", userDetails);
					resp.sendRedirect("home.jsp");
				} else {
					resp.sendRedirect("Registration.jsp");
				}
			}
		} catch (GyanpediaException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		System.out.println(isSuccess);
	}
	
	private void loadContent(HttpServletRequest req, HttpServletResponse response) throws IOException{
		Gson gson = new Gson();
		IGyanpediaService service = new GyanpediaServiceImpl();
		List<PostContent> contentDetails = null;
		try {
			contentDetails = service.getContentDetails();
			for (PostContent postContent : contentDetails) {
				List<ContentReply> replyDetails = service.getContentReplyDetails(postContent.getContentId());
				postContent.setContentReplies(replyDetails);
			}
			
		} catch (GyanpediaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.getWriter().print(gson.toJson(contentDetails));
	}

	private void performLogin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		User authenticatUser = null;
		IGyanpediaService service = new GyanpediaServiceImpl();
		String userName = req.getParameter("userName");
		String password = req.getParameter("password");
		HttpSession session = req.getSession();
		try {
			authenticatUser = service.getAuthenticatUser(userName, password);
			session.setAttribute("authenticatUser", authenticatUser);
		} catch (GyanpediaException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (authenticatUser.getUserid() > 0) {
			session.setAttribute("msg", "");
			resp.sendRedirect("home.jsp");
		} else {
			session.setAttribute("msg", "Enter Correct username/password");
			resp.sendRedirect("index.jsp");
		}
	}

}
