package com.gyanpedia.model;

public class ContentReply {
	private int replyId;
	private int userid;
	private int contentId;
	private String createdBy;
	private String replyContent;
	private String createdOn;
	private String createdImage;
	/**
	 * @return the replyId
	 */
	public int getReplyId() {
		return replyId;
	}
	/**
	 * @param replyId the replyId to set
	 */
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
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
	 * @return the replyContent
	 */
	public String getReplyContent() {
		return replyContent;
	}
	/**
	 * @param replyContent the replyContent to set
	 */
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
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
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "ContentReply [replyId=" + replyId + ", userid=" + userid + ", contentId=" + contentId + ", createdBy="
				+ createdBy + ", replyContent=" + replyContent + ", createdOn=" + createdOn + "]";
	}
	public String getCreatedImage() {
		return createdImage;
	}
	public void setCreatedImage(String createdImage) {
		this.createdImage = createdImage;
	}
	
}
