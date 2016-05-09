package com.gyanpedia.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.gyanpedia.util.Constant;

@WebServlet("/uploaddownloadcontroller")
public class UploadDownloadFileServlet extends HttpServlet {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7477939525076595215L;
	
	private static final Logger LOGGER = Logger.getLogger(GyanpediaController.class.getName());

	private ServletFileUpload uploader = null;
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPerform(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPerform(req, resp);
	}

	protected void doPerform(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = new File(Constant.FILE_UPLOAD_LOCATION);
		if(!filesDir.exists()){
			filesDir.mkdirs();
		}
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
		
		String action = request.getParameter(Constant.ACTION);
		LOGGER.info("action: " + action);
		if (Constant.METHOD_UPLOAD_FILE.equalsIgnoreCase(action)) {
			uploadFile(request, resp);
		} else if (Constant.METHOD_DOWNLOAD_FILE.equalsIgnoreCase(action)) {
			downloadFile(request, resp);
		} else {
			uploadFile(request, resp);
		}
	}

	private void downloadFile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String fileName = request.getParameter("fileName");
		if(fileName == null || fileName.equals("")){
			throw new ServletException("File Name can't be null or empty");
		}
		File file = new File(Constant.FILE_UPLOAD_LOCATION+File.separator+fileName);
		if(!file.exists()){
			throw new ServletException("File doesn't exists on server.");
		}
		System.out.println("File location on server::"+file.getAbsolutePath());
		ServletContext ctx = getServletContext();
		InputStream fis = new FileInputStream(file);
		String mimeType = ctx.getMimeType(file.getAbsolutePath());
		response.setContentType(mimeType != null? mimeType:"application/octet-stream");
		response.setContentLength((int) file.length());
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");

		ServletOutputStream os       = response.getOutputStream();
		byte[] bufferData = new byte[1024];
		int read=0;
		while((read = fis.read(bufferData))!= -1){
			os.write(bufferData, 0, read);
		}
		os.flush();
		os.close();
		fis.close();
		System.out.println("File downloaded at client successfully");
	}

	private void uploadFile(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		try {
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();
			while(fileItemsIterator.hasNext()){
				FileItem fileItem = fileItemsIterator.next();
				String fileNewName = System.currentTimeMillis()+getFileExtention(fileItem);
				if(fileItem.getName() == null || fileItem.getName().length() == 0){
					continue;
				}
				System.out.println("FieldName="+fileItem.getFieldName());
				System.out.println("FileName="+fileItem.getName());
				System.out.println("ContentType="+fileItem.getContentType());
				System.out.println("Size in bytes="+fileItem.getSize());

				File file = new File(Constant.FILE_UPLOAD_LOCATION+File.separator+fileNewName);
				System.out.println("Absolute Path at server="+file.getAbsolutePath());
				fileItem.write(file);
				request.setAttribute("uploadData", "<a id=\"download-link\" href=\"uploaddownloadcontroller?action=downloadFile&fileName="+fileNewName+"\">Download "+fileItem.getName()+"</a>");
				request.setAttribute("editorId",getOtherData(fileItemsList, "editorId"));
				/*out.write("File "+fileItem.getName()+ " uploaded successfully.");
				out.write("<br>");*/
				if(fileItem.getContentType().contains("image")){
					request.setAttribute("uploadData", "<img src=\"upload/"+file.getName()+"\">");
				} else {
					request.setAttribute("uploadData", "<a id=\"download-link\" href=\"uploaddownloadcontroller?action=downloadFile&fileName="+fileNewName+"\">Download "+fileItem.getName()+"</a>");
				}
				request.getRequestDispatcher("imageEditorPopup.jsp").forward(request, response);
				//response.sendRedirect("imageEditorPopup.jsp");
			}
		} catch (FileUploadException e) {
			out.write("Exception in uploading file."+e);
		} catch (Exception e) {
			out.write("Exception in uploading file."+e);
		}
		out.write("</body></html>");
	}
	
	private String getFileExtention(FileItem item) {
		String format = "none";
		String fileName = item.getName();
		int index = fileName.lastIndexOf(".");
		int lastIndex = Math.max(fileName.lastIndexOf('/'), fileName.lastIndexOf('\\'));
		if (index > lastIndex) {
			format = fileName.substring(index + 1);
			format = format.toLowerCase();
		}
		return "."+format;
	}
	
	private String getMultiPartData(HttpServletRequest request, String parameterName) throws IllegalStateException, IOException, ServletException{
		String parameterValue = "";
		for( Part part : request.getParts() ) {
		    if(parameterName.equals(part.getName()) ) {
		    	parameterValue = part.getInputStream().toString();
		    }
		    
		}
		return parameterValue;
	}
	
	private String getOtherData(List<FileItem> fileItems, String parameterName) {
		String parameterValue = "";
		for(FileItem fileItem : fileItems) {
		    if(parameterName.equals(fileItem.getFieldName()) ) {
		    	parameterValue = fileItem.getString();
		    	break;
		    }
		    
		}
		return parameterValue;
	}
}
