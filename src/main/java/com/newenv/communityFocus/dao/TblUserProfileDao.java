package com.newenv.communityFocus.dao;

import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.newenv.communityFocus.base.BaseService;
import com.newenv.communityFocus.dao.DaoHelper;
import com.newenv.communityFocus.domain.TblUserProfile;

@Repository
public class TblUserProfileDao{
	
	@Autowired
	private DaoHelper daoHelper;
	
	public TblUserProfile getObjectById(Integer id){
		TblUserProfile userProfile=null;
		String sql=" select id ,fullname ,tbl_department_id, tbl_title from tbl_user_profile where id="+id;
		Record record = daoHelper.getRecord(sql);
		if(null != record){
			userProfile=new TblUserProfile();
			userProfile.setId(record.getInt("id"));
			userProfile.setFullname(record.getString("fullname"));
			userProfile.setTbl_department_id(record.getInt("tbl_department_id"));
			userProfile.setTbl_title(record.getInt("tbl_title"));
		}
		return userProfile;
	}
	
	public List<TblUserProfile> getUserProfilesByDepartmentId(int departmentId) {
		String sql = "select up.id,up.fullname from tbl_user_profile up, tbl_user_login ul ,tbl_position p, tbl_department d where up.id=ul.tbl_user_profile_id and p.tbl_user_id=ul.id and p.tbl_department_id=d.id and d.id="+departmentId;
		 List<Record> recordList = daoHelper.getRecordList(sql);

		
		List<TblUserProfile> users = new ArrayList<TblUserProfile>();
		if(recordList!=null){
			TblUserProfile u = null;
			for(Record record : recordList){
				u = new TblUserProfile();
				u.setId(record.getInt("id"));
				u.setFullname(record.getString("fullname"));
				users.add(u);
			}
		}
		return users;
	}
	
}