package com.bxs.pojo;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 
 * 职务 实体类
 * @desc: bxs-manager-pojo
 * @author: wyc
 * @createTime: 2018年1月28日 上午10:04:40
 * @history:
 * @version: v1.0
 */
@Entity
@Table(name = "t_post")
public class Post {
	//主键
	private String id;
	//父主键(暂时用不到该字段)
	private String pid;
	//部门ID
	private String deptId;
	//职务编码
	private String postCode;
	//职务名称
	private String postName;
	//职务说明
	private String postDesc;
	// 排序
	private int displayOrder;
	// 数据状态,详情参考 com.bxs.common.dict.DataState
	private String dataState;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getDeptId() {
		return deptId;
	}
	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getPostName() {
		return postName;
	}
	public void setPostName(String postName) {
		this.postName = postName;
	}
	public String getPostDesc() {
		return postDesc;
	}
	public void setPostDesc(String postDesc) {
		this.postDesc = postDesc;
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
	
}
