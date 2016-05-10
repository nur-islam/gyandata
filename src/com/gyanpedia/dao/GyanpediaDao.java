package com.gyanpedia.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.gyanpedia.model.ContentReply;
import com.gyanpedia.model.PostContent;
import com.gyanpedia.model.User;
import com.gyanpedia.util.GyanpediaException;

public class GyanpediaDao extends BaseDao{
	
	private static final Logger LOGGER=Logger.getLogger(GyanpediaDao.class.getName());
	
	private final StringBuffer AUTHENTICATE_USER = new StringBuffer()
			.append("Select * from gyanpedia.user_details ")
			.append("where user_details_email=? ")
			.append("AND user_details_password=?");
	
	private final StringBuffer INSERT_USER = new StringBuffer()
			.append("Insert into gyanpedia.user_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,SYSDATE()) ");
	
	private final StringBuffer INSERT_USER_POST = new StringBuffer()
			.append("Insert into gyanpedia.user_content (user_details_id, user_content_details, user_content_created_on) values(?,?,SYSDATE())");
	
	private final StringBuffer INSERT_USER_POST_REPLY = new StringBuffer()
			.append("Insert into gyanpedia.user_content_reply (user_details_id, user_content_id, user_content_reply_details, user_content_reply_created_on) values(?,?,?,SYSDATE())");
	
	private final StringBuffer USER_CONETNT_DETAILS = new StringBuffer()
			.append("Select * from gyanpedia.user_details u,gyanpedia.user_content uc ")
			.append("where u.user_details_id=uc.user_details_id ")
			.append("order by user_content_created_on desc ");
	
	private final StringBuffer USER_CONETNT_REPLY_DETAILS = new StringBuffer()
			.append("Select * from gyanpedia.user_details u, gyanpedia.user_content uc, gyanpedia.user_content_reply ucr ")
			.append("where u.user_details_id=ucr.user_details_id ")
			.append("AND ucr.user_content_id=uc.user_content_id ")
			.append("AND ucr.user_content_id=? ");
	
	private final StringBuffer USER_CONETNT_REPLY_COUNT = new StringBuffer()
			.append("SELECT COUNT(user_content_reply_id) AS totalCount ").append("FROM gyanpedia.user_content_reply ucr ")
			.append("WHERE  ucr.user_details_id=? ");
	
	private final StringBuffer USER_CONETNT_COUNT = new StringBuffer()
			.append("SELECT COUNT(user_content_id) AS totalCount ").append("FROM gyanpedia.user_content ucr ")
			.append("WHERE  ucr.user_details_id=? ");

	public User getAuthenticatUser(String userName, String password) throws GyanpediaException {
		User user = new User();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int placeHolder = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, AUTHENTICATE_USER.toString());
			preparedStatement.setString(placeHolder++, userName);
			preparedStatement.setString(placeHolder++, password);
			LOGGER.info(preparedStatement.toString());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				user.setUserid(resultSet.getInt("user_details_id"));
				user.setName(resultSet.getString("user_details_name"));
				user.setOrganization(resultSet.getString("user_details_organization"));
				user.setRole(resultSet.getString("user_details_role"));
				user.setBirthDate(resultSet.getDate("user_details_birthdate"));
				user.setPassword(resultSet.getString("user_details_password"));
				user.setPhone(resultSet.getInt("user_details_phone"));
				user.setStreet(resultSet.getString("user_details_street"));
				user.setCity(resultSet.getString("user_details_city"));
				user.setState(resultSet.getString("user_details_state"));
				user.setPincode(resultSet.getInt("user_details_pincode"));
				user.setEmail(resultSet.getString("user_details_email"));
				user.setCountry(resultSet.getString("user_details_country"));
				user.setStream(resultSet.getString("user_details_stream"));
				user.setNationality(resultSet.getString("user_details_nationality"));
				user.setGender(resultSet.getString("user_details_gender"));
				user.setImage(resultSet.getString("user_details_image"));
			
			}
			//user = populateBean(resultSet, User.class);			
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in getAuthenticatUser" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in getAuthenticatUser" + e);
		} finally {
			closeResultset(resultSet);
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		LOGGER.info(user.toString());
		return user;
	}
	
	public int getContentCount(int userId) throws GyanpediaException {
		int totalCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int placeHolder = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, USER_CONETNT_COUNT.toString());
			preparedStatement.setInt(placeHolder++, userId);
			LOGGER.info(preparedStatement.toString());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				totalCount = resultSet.getInt("totalCount");		
			}
			//user = populateBean(resultSet, User.class);			
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in getAuthenticatUser" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in getAuthenticatUser" + e);
		} finally {
			closeResultset(resultSet);
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		return totalCount;
	}
	
	public int getContentReplyCount(int userId) throws GyanpediaException {
		int totalCount = 0;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int placeHolder = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, USER_CONETNT_REPLY_COUNT.toString());
			preparedStatement.setInt(placeHolder++, userId);
			LOGGER.info(preparedStatement.toString());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				totalCount = resultSet.getInt("totalCount");		
			}
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in getAuthenticatUser" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in getAuthenticatUser" + e);
		} finally {
			closeResultset(resultSet);
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		return totalCount;
	}
	
	public List<PostContent> getContentDetails() throws GyanpediaException {
		List<PostContent> contents = new ArrayList<PostContent>();
		PostContent content = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, USER_CONETNT_DETAILS.toString());
			LOGGER.info(preparedStatement.toString());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				content = new PostContent();
				content.setUserid(resultSet.getInt("user_details_id"));
				content.setContent(resultSet.getString("user_content_details"));
				content.setCreatedOn(resultSet.getString("user_content_created_on"));
				content.setCreatedBy(resultSet.getString("user_details_name"));
				content.setCreatedImage(resultSet.getString("user_details_image"));
				content.setContentId(resultSet.getInt("user_content_id"));
				contents.add(content);
			}
			//user = populateBean(resultSet, User.class);			
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in getUserDetails" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in getUserDetails" + e);
		} finally {
			closeResultset(resultSet);
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		LOGGER.info(contents.toString());
		return contents;
	}
	
	public List<ContentReply> getContentReplyDetails(int contentId) throws GyanpediaException {
		List<ContentReply> replies = new ArrayList<ContentReply>();
		ContentReply reply = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		int parameterIndex = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, USER_CONETNT_REPLY_DETAILS.toString());
			preparedStatement.setInt(parameterIndex++, contentId);
			LOGGER.info(preparedStatement.toString());
			resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {
				reply = new ContentReply();
				reply.setUserid(resultSet.getInt("user_details_id"));
				reply.setReplyId(resultSet.getInt("user_content_reply_id"));
				reply.setContentId(resultSet.getInt("user_content_id"));
				reply.setCreatedOn(resultSet.getString("user_content_reply_created_on"));
				reply.setCreatedBy(resultSet.getString("user_details_name"));
				reply.setCreatedImage(resultSet.getString("user_details_image"));
				reply.setReplyContent(resultSet.getString("user_content_reply_details"));
				replies.add(reply);
			
			}
			//user = populateBean(resultSet, User.class);			
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in getContentReplyDetails" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in getContentReplyDetails" + e);
		} finally {
			closeResultset(resultSet);
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		LOGGER.info(replies.toString());
		return replies;
	}

	public boolean saveUser(User user) throws GyanpediaException {
		boolean isSuccess = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int placeHolder = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, INSERT_USER.toString());
			preparedStatement.setInt(placeHolder++, user.getUserid());
			preparedStatement.setString(placeHolder++, user.getName());
			preparedStatement.setString(placeHolder++, user.getOrganization());
			preparedStatement.setString(placeHolder++, user.getRole());
			preparedStatement.setString(placeHolder++, user.getPassword());
			preparedStatement.setDate(placeHolder++, user.getBirthDate());
			preparedStatement.setInt(placeHolder++, user.getPhone());
			preparedStatement.setString(placeHolder++, user.getStreet());
			preparedStatement.setString(placeHolder++, user.getCity());
			preparedStatement.setString(placeHolder++, user.getState());
			preparedStatement.setInt(placeHolder++, user.getPincode());
			preparedStatement.setString(placeHolder++, user.getEmail());
			preparedStatement.setString(placeHolder++, user.getCountry());
			preparedStatement.setString(placeHolder++, user.getStream());
			preparedStatement.setString(placeHolder++, user.getNationality());
			preparedStatement.setString(placeHolder++, user.getGender());
			preparedStatement.setString(placeHolder++, user.getImage());

			LOGGER.info(preparedStatement.toString());
			isSuccess = preparedStatement.executeUpdate() > 0 ? true : false;
				
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in saveUser" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in saveUser" + e);
		} finally {
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		return isSuccess;
	}

	public boolean saveUserContent(String user_details_id, String content) throws GyanpediaException {
		boolean isSuccess = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int placeHolder = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, INSERT_USER_POST.toString());
			preparedStatement.setString(placeHolder++, user_details_id);
			preparedStatement.setString(placeHolder++, content);			

			LOGGER.info(preparedStatement.toString());
			isSuccess = preparedStatement.executeUpdate() > 0 ? true : false;
				
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in saveUser" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in saveUser" + e);
		} finally {
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		return isSuccess;
	}

	public boolean saveUserContentReply(String userId, String contentId, String content) throws GyanpediaException {
		boolean isSuccess = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int placeHolder = 1;
		try {
			connection = getConnection();
			preparedStatement = getPrepardeStattement(connection, INSERT_USER_POST_REPLY.toString());
			preparedStatement.setInt(placeHolder++, Integer.valueOf(userId));
			preparedStatement.setInt(placeHolder++, Integer.valueOf(contentId));
			preparedStatement.setString(placeHolder++, content);			

			LOGGER.info(preparedStatement.toString());
			isSuccess = preparedStatement.executeUpdate() > 0 ? true : false;
				
		} catch (GyanpediaException e) {
			throw new GyanpediaException("Exception occured in saveUserContentReply" + e);
		} catch (SQLException e) {
			throw new GyanpediaException("Exception occured in saveUserContentReply" + e);
		} finally {
			closePreparedStatement(preparedStatement);
			closeConnection(connection);
		}
		return isSuccess;
	}
}
