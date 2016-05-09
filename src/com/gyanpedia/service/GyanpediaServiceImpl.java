package com.gyanpedia.service;

import java.util.List;

import com.gyanpedia.dao.GyanpediaDao;
import com.gyanpedia.model.ContentReply;
import com.gyanpedia.model.PostContent;
import com.gyanpedia.model.User;
import com.gyanpedia.util.GyanpediaException;

public class GyanpediaServiceImpl implements IGyanpediaService{

	@Override
	public User getAuthenticatUser(String userName, String password) throws GyanpediaException {
		GyanpediaDao dao = new GyanpediaDao();		
		return dao.getAuthenticatUser(userName, password);
	}
	
	@Override
	public List<PostContent> getContentDetails() throws GyanpediaException {
		GyanpediaDao dao = new GyanpediaDao();		
		return dao.getContentDetails();
	}
	
	@Override
	public List<ContentReply> getContentReplyDetails(int contentId) throws GyanpediaException {
		GyanpediaDao dao = new GyanpediaDao();		
		return dao.getContentReplyDetails(contentId);
	}

	@Override
	public boolean saveUser(User user) throws GyanpediaException {
		GyanpediaDao dao = new GyanpediaDao();		
		return dao.saveUser(user);
	}

	@Override
	public boolean savePost(String userId, String content)  throws GyanpediaException {
		GyanpediaDao dao = new GyanpediaDao();		
		return dao.saveUserContent(userId, content);
		
	}
	
	@Override
	public boolean savePostReply(String userId, String contentId, String content)  throws GyanpediaException {
		GyanpediaDao dao = new GyanpediaDao();		
		return dao.saveUserContentReply(userId, contentId, content);
		
	}

}
