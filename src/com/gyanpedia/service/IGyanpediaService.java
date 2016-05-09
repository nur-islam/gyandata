package com.gyanpedia.service;

import java.util.List;

import com.gyanpedia.model.ContentReply;
import com.gyanpedia.model.PostContent;
import com.gyanpedia.model.User;
import com.gyanpedia.util.GyanpediaException;

public interface IGyanpediaService {
	public User getAuthenticatUser(String userName, String password) throws GyanpediaException;

	public boolean saveUser(User user) throws GyanpediaException;

	public boolean savePost(String userId, String content) throws GyanpediaException;

	public boolean savePostReply(String userId, String contentId, String content) throws GyanpediaException;

	public List<ContentReply> getContentReplyDetails(int contentId) throws GyanpediaException;

	public List<PostContent> getContentDetails() throws GyanpediaException;
}
