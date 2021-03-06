package com.bxs.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxs.common.dict.DataState;
import com.bxs.common.vo.EUITree;
import com.bxs.jdbc.DeptDao;
import com.bxs.pojo.Dept;
import com.bxs.pojo.Topic;
import com.bxs.service.DeptService;

@Service
public class DeptServiceImpl  implements DeptService{
	
	@Autowired
    private DeptDao deptDao;
	
	@Override
	public List<EUITree> getListByPid(String pid) {
		List<EUITree> list=new ArrayList<EUITree>();
		List<Dept> deptList=deptDao.getListByPid(pid);
		for (Dept dept : deptList) {
			EUITree easyTree=new EUITree();
			easyTree.setId(dept.getId());
			easyTree.setText(dept.getDeptName());
			easyTree.setState(hasChild(dept.getId())?"closed":"open");
			Map<String, String> attr=new HashMap<String, String>();
			attr.put("pid", dept.getPid());
			attr.put("deptCode", dept.getDeptCode());
			//部门类型
			attr.put("deptType", dept.getDeptType());
			attr.put("deptDesc", dept.getDeptDesc());
			//是否在用
			attr.put("dataState", dept.getDataState());
			//排序
			attr.put("displayOrder", dept.getDisplayOrder()+"");
			
			easyTree.setAttributes(attr);
			list.add(easyTree);
		}
		return list;
	}

	@Override
	public boolean hasChild(String pid) {
		List<Dept> list=deptDao.getListByPid(pid);
		if(list.isEmpty()){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public void save(Dept dept) {
		dept.setDataState(DataState.Use.getCode());
		// 更新操作
		if (StringUtils.isNotBlank(dept.getId())) {
			deptDao.update(dept);
		} else {
		// 保存操作
			deptDao.save(dept);
		}
	}

	@Override
	public void delete(String id) {
		deptDao.delete(id);
	}

}