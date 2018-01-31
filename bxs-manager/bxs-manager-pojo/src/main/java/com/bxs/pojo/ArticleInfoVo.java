package com.bxs.pojo;

import java.util.Date;

public class ArticleInfoVo {
	
		// 主键
		private String id;
		// 栏目Id
		private String topicId;
		// 文章标题
		private String articleTitle;
		// 文章配图地址
		private String articleImageUrl;
		// 文章内容
		private String articleContent;
		// 发布部门ID
		private String publishDeptId;
		// 发布用户ID
		private String publishUserId;
		// 文章审核状态(0:未审核 1:审核通过)
		private String checkState;
		// 推荐值（值越大，越先显示）
		private String topCount;
		// 浏览次数
		private int viewCount;
		// 排序
		private int displayOrder;
		// 数据状态,详情参考 com.bxs.common.dict.DataState
		private String dataState;
		// 创建时间
		private Date createDate;
		// 更新时间
		private Date updateDate;
		//栏目名称
		private String topicName;
		//发布文章部门名称
		private String publishDeptName;
		//发布文章用户姓名
		private String publishUserName;
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getTopicId() {
			return topicId;
		}
		public void setTopicId(String topicId) {
			this.topicId = topicId;
		}
		public String getArticleTitle() {
			return articleTitle;
		}
		public void setArticleTitle(String articleTitle) {
			this.articleTitle = articleTitle;
		}
		public String getArticleImageUrl() {
			return articleImageUrl;
		}
		public void setArticleImageUrl(String articleImageUrl) {
			this.articleImageUrl = articleImageUrl;
		}
		public String getArticleContent() {
			return articleContent;
		}
		public void setArticleContent(String articleContent) {
			this.articleContent = articleContent;
		}
		public String getPublishDeptId() {
			return publishDeptId;
		}
		public void setPublishDeptId(String publishDeptId) {
			this.publishDeptId = publishDeptId;
		}
		public String getPublishUserId() {
			return publishUserId;
		}
		public void setPublishUserId(String publishUserId) {
			this.publishUserId = publishUserId;
		}
		public String getCheckState() {
			return checkState;
		}
		public void setCheckState(String checkState) {
			this.checkState = checkState;
		}
		public String getTopCount() {
			return topCount;
		}
		public void setTopCount(String topCount) {
			this.topCount = topCount;
		}
		public int getViewCount() {
			return viewCount;
		}
		public void setViewCount(int viewCount) {
			this.viewCount = viewCount;
		}
		public int getDisplayOrder() {
			return displayOrder;
		}
		public void setDisplayOrder(int displayOrder) {
			this.displayOrder = displayOrder;
		}
		public String getDataState() {
			return dataState;
		}
		public void setDataState(String dataState) {
			this.dataState = dataState;
		}
		public Date getCreateDate() {
			return createDate;
		}
		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}
		public Date getUpdateDate() {
			return updateDate;
		}
		public void setUpdateDate(Date updateDate) {
			this.updateDate = updateDate;
		}
		public String getTopicName() {
			return topicName;
		}
		public void setTopicName(String topicName) {
			this.topicName = topicName;
		}
		public String getPublishDeptName() {
			return publishDeptName;
		}
		public void setPublishDeptName(String publishDeptName) {
			this.publishDeptName = publishDeptName;
		}
		public String getPublishUserName() {
			return publishUserName;
		}
		public void setPublishUserName(String publishUserName) {
			this.publishUserName = publishUserName;
		}
}