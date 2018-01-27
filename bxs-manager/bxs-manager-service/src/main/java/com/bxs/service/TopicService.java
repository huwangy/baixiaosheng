package com.bxs.service;
import java.util.List;
import com.bxs.common.vo.EasyTree;
import com.bxs.pojo.Topic;

public interface TopicService {

	List<EasyTree> getListByPid(String pid);
	
	/**
	 * 
	 * 是否含有子节点
	 * @author: wyc
	 * @createTime: 2018年1月27日 上午11:25:02
	 * @history:
	 * @param pid
	 * @return boolean
	 */
	boolean hasChild(String pid);

	/**
	 * 
	 * 保存栏目
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:07:09
	 * @history:
	 * @param topic void
	 */
	void save(Topic topic);

	
	/**
	 *  
	 * 删除栏目
	 * @author: wyc
	 * @createTime: 2018年1月27日 下午2:48:05
	 * @history:
	 * @param id void
	 */
	void delete(String id);

}
