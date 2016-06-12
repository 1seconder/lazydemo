package com.newenv.communityFocus.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.newenv.communityFocus.dao.TblDepartmentDao;
import com.newenv.communityFocus.dao.TblUserLoginDao;
import com.newenv.communityFocus.dao.TblUserProfileDao;
import com.newenv.communityFocus.domain.TblDepartment;
import com.newenv.communityFocus.domain.TblUserLogin;
import com.newenv.communityFocus.domain.TblUserProfile;
import com.newenv.communityFocus.security.SecurityUserHolder;
import com.newenv.communityFocus.vo.HRPermission;
import com.newenv.communityFocus.vo.UserLogin;

@Service
public class UserLoginService {

	private static final Log logger = LogFactory.getLog(UserLoginService.class);

	// hr 权限请求系统类型
	private String sysType;
	// hr 权限请求地址
	private String hrPermissionUrl;
	@Autowired
	private TblUserLoginDao userLoginDao;
	@Autowired
	private TblUserProfileDao userProfileDao;
	@Autowired
	private TblDepartmentDao departmentDao;

	public TblUserLogin login(String userName) {
		try {
			return userLoginDao.login(userName);
		} catch (Exception e) {
			logger.error("login exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public TblDepartment findTblDepartmentById(Integer id) {
		try {
			return departmentDao.getObjectById(id);
		} catch (Exception e) {
			logger.error("findTblDepartmentById exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public TblUserProfile findTblUserProfileById(Integer tblUserProfileId) {
		try {
			return userProfileDao.getObjectById(tblUserProfileId);
		} catch (Exception e) {
			logger.error("findTblUserProfileById Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, HRPermission> getHRPermissions(UserLogin u, TblUserLogin userLogin) {
		try {
			List<HRPermission> permissions = userLoginDao.getHRPermissions(sysType, userLogin.getId());
			if (!CollectionUtils.isEmpty(permissions)) {
				u.resetPermissions();
				u.addHRPermissions(permissions);
			}
		} catch (Exception e) {
			logger.error("getHRPermissions Exception:", e);
			e.printStackTrace();
		}
		return u.getPermissions();
	}

	public void setOrChangeTitle(String title, Integer departmentId, Integer titleId) {
		try {
			TblDepartment department = departmentDao.getObjectById(departmentId);
			UserLogin userLogin = SecurityUserHolder.getCurrentUserLogin();
			userLogin.setDepartment(department);
			userLogin.setCityId(String.valueOf(department.getCityId()));
			userLogin.resetPermissions();
			title = userLogin.getCityId() + "." + departmentId + "." + titleId;
			List<Record> findAllTitleNamesByUsername = userLoginDao.findAllTitleNamesByUsername(userLogin.getUserLogin().getUsername());
			Map<String, UserLogin> userMap = new HashMap<String, UserLogin>();
			for (int i = 0; i < findAllTitleNamesByUsername.size(); i++) {
				Record record = findAllTitleNamesByUsername.get(i);
				String cityDepId = record.getString("cityDepId");
				if (cityDepId.equals(title)) {
					userLogin.setTitleName(record.getString("cityDepName"));
					String username = userLogin.getUserLogin().getUsername();

					Map<String, UserLogin> userMap2 = SecurityUserHolder.getUserMap();
					if (null != userMap2 && null != userMap2.get(username)) {
						SecurityUserHolder.getUserMap().remove(username);
					}
					userMap.put(username, userLogin);
					SecurityUserHolder.setUserMap(userMap);
					break;
				}
			}
			// 获取该用户当前岗位的全部权限
			List<HRPermission> permissions = userLoginDao.getUserPermissions(userLogin.getUserLogin().getId(), titleId);
			userLogin.addHRPermissions(permissions);
		} catch (Exception e) {
			logger.error("setOrChangeTitle Exception:", e);
			e.printStackTrace();
		}
		
	}

	public List<HRPermission> getUserPermissions(UserLogin userLogin) {
		List<HRPermission> result = null;
		try {
			if (null == userLogin) {
				return null;
			}
			Integer titleId = userLogin.getUserProfile().getTbl_title();
			result = userLoginDao.getUserPermissions(userLogin.getUserLogin().getId(), titleId);
		} catch (Exception e) {
			logger.error("getUserPermissions Exception:", e);
			e.printStackTrace();
		}
		return result;

	}

	/**
	 * 查询某个登录名的所有岗位。
	 * 
	 * @param userName
	 * @return
	 */
	public List<Record> findAllTitleNamesByUsername(String userName) {
		List<Record> result = null;
		try {
			result = userLoginDao.findAllTitleNamesByUsername(userName);
		} catch (Exception e) {
			logger.error("findAllTitleNamesByUsername Exception:", e);
			e.printStackTrace();
		}
		return result;
	}

	public String getSysType() {
		return sysType;
	}

	public void setSysType(String sysType) {
		this.sysType = sysType;
	}

	public String getHrPermissionUrl() {
		return hrPermissionUrl;
	}

	public void setHrPermissionUrl(String hrPermissionUrl) {
		this.hrPermissionUrl = hrPermissionUrl;
	}

	public List<Record> getOrganizationName(Integer userid) {
		List<Record> result = null;
		try {
			result = userLoginDao.getOrganizationName(userid);
		} catch (Exception e) {
			logger.error("getOrganizationName Exception:", e);
			e.printStackTrace();
		}
		return result;
	}

}
