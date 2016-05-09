package com.gyanpedia.model;

import java.sql.Date;
import java.util.List;

public class PostContent {
	private int userid;
	private String content;
	private String createdOn;
	private String createdBy;
	private int contentId;
	private String createdImage;
	private List<ContentReply> contentReplies;
	/**
	 * @return the userid
	 */
	public int getUserid() {
		return userid;
	}
	/**
	 * @param userid the userid to set
	 */
	public void setUserid(int userid) {
		this.userid = userid;
	}
	/**
	 * @return the content
	 */
	public String getContent() {
		return content;
	}
	/**
	 * @param content the content to set
	 */
	public void setContent(String content) {
		this.content = content;
	}
	/**
	 * @return the createdOn
	 */
	public String getCreatedOn() {
		return createdOn;
	}
	/**
	 * @param createdOn the createdOn to set
	 */
	public void setCreatedOn(String createdOn) {
		this.createdOn = createdOn;
	}
	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}
	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	/**
	 * @return the contentId
	 */
	public int getContentId() {
		return contentId;
	}
	/**
	 * @param contentId the contentId to set
	 */
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}
	/**
	 * @return the contentReplies
	 */
	public List<ContentReply> getContentReplies() {
		return contentReplies;
	}
	/**
	 * @param contentReplies the contentReplies to set
	 */
	public void setContentReplies(List<ContentReply> contentReplies) {
		this.contentReplies = contentReplies;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PostContent [userid=" + userid + ", content=" + content + ", createdOn=" + createdOn + ", createdBy="
				+ createdBy + ", contentId=" + contentId + ", contentReplies=" + contentReplies + "]";
	}
	public String getCreatedImage() {
		return createdImage;
	}
	public void setCreatedImage(String createdImage) {
		this.createdImage = createdImage;
	}

	
}
