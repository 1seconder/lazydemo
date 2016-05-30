package com.newenv.communityFocus.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newenv.communityFocus.base.BaseService;
import com.newenv.communityFocus.base.PageInfo;
import com.newenv.communityFocus.dao.TblUserProfileDao;
import com.newenv.communityFocus.domain.TblUserProfile;

@Service
public class TblUserProfileService   extends BaseService{
	@Autowired
	private TblUserProfileDao tblUserProfileDao;
	
	public TblUserProfile getById(Integer upid){
		return tblUserProfileDao.getObjectById(upid);
	}
	
	public List<TblUserProfile> getUserProfilesByDepartmentId(int departmentId){
		return tblUserProfileDao.getUserProfilesByDepartmentId(departmentId);
	}
	
	public List<TblUserProfile> getUserProfilesByDepartmentIds(List<Integer> departmentIds){
		return null;
	}
	
	public PageInfo searchUserProfiles4Authorization(int seqId, String departmentName, String realname, String badgeCode, String tel, PageInfo paraPager){
		return null;
	}
	
	public List<TblUserProfile> getByDepartmentId(int departmentId){
		return null;
	}
	
	/**
	 * 获取自己上一级领导ids
	 * @param titleId 职位Id
	 * @param departmentId 部门Id
	 * @return
	 */
	public List<Object> getDepartmentManagerIdsByDepartmentAndTitle(Integer titleId ,Integer departmentId){
		return null;
	}
	/**
	 * 获取所有用户
	 * @return
	 */
	public List<String> getAllUserInfos(){
		return null;
	}
	
	public PageInfo searchUserProfiles4AuthorizationWithCityId(int seqId, String departmentName, String fullName, String badgeCode, String tel, Integer choseCityOfficeId, PageInfo pager){
		return null;
	}
	
	/**
	 * 查询用户归属于哪些系统。
	 * @param seqId
	 * @param departmentName
	 * @param fullName
	 * @param badgeCode
	 * @param tel
	 * @param choseCityOfficeId
	 * @param paramPager
	 * @return
	 */
	public PageInfo searchUserProfiles4Systems(int seqId,Integer departmentId,String departmentName, String fullName, String badgeCode,String tel, Integer choseCityOfficeId, Integer htype, PageInfo paramPager){
		return null;
	}
	
	/**
	 * 更改用户归属的系统。
	 * @param userIds
	 * @param htype
	 */
	public void updateUserPositionHType(Integer[] userIds, Integer htype){
		
	}

	public TblUserProfileDao getTblUserProfileDao() {
		return tblUserProfileDao;
	}

	public void setTblUserProfileDao(TblUserProfileDao tblUserProfileDao) {
		this.tblUserProfileDao = tblUserProfileDao;
	}
	
}
