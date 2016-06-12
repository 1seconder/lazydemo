package com.newenv.communityFocus.dao;

import java.util.ArrayList;
import java.util.List;

import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.newenv.communityFocus.dao.DaoHelper;
import com.newenv.communityFocus.domain.TblUserLogin;
import com.newenv.communityFocus.vo.HRPermission;
@Repository
public class TblUserLoginDao{
	
	@Autowired
	private DaoHelper daoHelper;
	/**
	 * @param userName
	 * @param strategy
	 * @return
	 */
	public 	TblUserLogin login(String userName)  {
		TblUserLogin userLogin=null;
		String sqlString=" select id ,username ,tbl_User_profile_id ,password from tbl_user_login where status=1 and username= '"+ userName+"'";
		List<Record> recordList = daoHelper.getRecordList(sqlString);
		if(recordList!=null && recordList.size() >0){
			Record record = recordList.get(0);
			userLogin=new TblUserLogin();
			userLogin.setId(record.getInt("id"));
			userLogin.setUsername(record.getString("username"));
			int tbl_User_profile_id = record.getInt("tbl_User_profile_id");
			userLogin.setTbl_User_profile_id(tbl_User_profile_id);
			userLogin.setPassword(record.getString("password"));
		}
		return userLogin;
	}
	
	public List<HRPermission> getHRPermissions(String sysType,Integer userLoginId){
		 List<HRPermission> list=new ArrayList<HRPermission>();
		
		String sqlString = "SELECT  DISTINCT TBL_PERMISSION_ID  FROM TBL_HR_USER_HAS_TBL_PERMISSION WHERE (TBL_USER_ID = "+userLoginId+" AND SYS_TYPE = '"+sysType+"')";
		List<Record> recordList = daoHelper.getRecordList(sqlString);
		if(null !=recordList && recordList.size()>0){
			String permIds="";
			for(int i=0;i<recordList.size();i++){
				permIds+=",'"+recordList.get(i)+"'";
			}
			
		String sql = "SELECT DISTINCT mn.SYS_TYPE, mn.CATEGORY, perm.PERMISSION_TYPE, perm.ID, mn.MENU_NAME FROM TBL_MENU mn "+
						" INNER JOIN TBL_MENU_RELATION_TBL_PERMISSION rel ON mn.ID = rel.TBL_MENU_ID "+
						" INNER JOIN TBL_PERMISSION perm ON rel.TBL_PERMISSION_ID = perm.ID "+
						" WHERE ((perm.ID IN ("+permIds.substring(1)+"))) ";
			
		List<Record> menuList = daoHelper.getRecordList(sql);
			if(menuList!=null && menuList.size()>0){
				for(int j=0;j<menuList.size();j++){
					HRPermission permission=new HRPermission();
					Record record = menuList.get(j);
					permission.setSysType(record.getString("SYS_TYPE"));
					permission.setCategory(record.getInt("CATEGORY"));
					permission.setPermType(record.getString("PERMISSION_TYPE"));
					permission.setPermId(record.getInt("ID"));
					permission.setMenuName(record.getString("MENU_NAME"));
					list.add(permission);
				}
			}
		}
		return list;
	}
	
	/**
	 * 获取某用户某岗位的权限。
	 * @param userId
	 * @param titleId
	 * @param strategy
	 * @return
	 */
	public List<HRPermission> getUserPermissions(Integer userId, Integer titleId){
		String sql = "select p.id,p.permission_name from tbl_permission p,tbl_hr_user_has_tbl_permission up where p.id=up.tbl_Permission_id and up.tbl_user_id="+userId+" and p.sys_type='LPJG' "
					+ " union ALL " 
					+ " select p.id,p.permission_name from tbl_permission p,tbl_hr_title_has_tbl_permission tp where p.id=tp.tbl_Permission_id and tp.tbl_Title_id= "+titleId+" and p.sys_type='LPJG' "
					+ " union ALL " 
					+ " select p.id,p.permission_name from tbl_permission p,tbl_group_has_tbl_permission gp,tbl_group_has_tbl_user gu,tbl_group g where p.id=gp.tbl_Permission_id and gp.tbl_group_id=gu.tbl_group_id and gu.tbl_group_id=g.id and g.statuss=1 and gu.tbl_user_id="+ userId;
		List<Record> objs = daoHelper.getRecordList(sql);

		List<HRPermission> permissions=new ArrayList<HRPermission>();
		if(objs!=null){
			for(Record record : objs){
				HRPermission permission=new HRPermission();
				permission.setPermId(record.getInt("id"));
				permission.setMenuName(record.getString("permission_name"));
				permissions.add(permission);
			}
		}
		return permissions;
	}
	
	public List<Record> findAllTitleNamesByUsername(String userName){
		String sql = "select cast(CONCAT(city.id,'.',dpt.id,'.',ttl.id) as char(50)) as cityDepId,CONCAT(city.city_name,'.',dpt.department_name,'.',ttl.title_name)  as cityDepName from xhj_jccity city, tbl_department dpt, tbl_title ttl, tbl_position pstn, tbl_user_Login ulogin where pstn.tbl_user_id=ulogin.id and pstn.tbl_title_id=ttl.id and city.id=dpt.CityID and dpt.id=pstn.tbl_department_id and ulogin.status=1 and ulogin.username='"+userName+"'";
		List<Record> objs = daoHelper.getRecordList(sql);
		return objs;
	}
	
	
	public List<Record> getOrganizationName(Integer userid)
	{
			String sql = "select department_name from tbl_organization where id = (";
			sql="select id,department_name,tbl_organization_id from tbl_department where   id= (select tbl_department_id from tbl_user_profile where id  =  "+userid+"))";
			return daoHelper.getRecordList(sql);
	}
}
