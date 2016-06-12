package com.newenv.communityFocus.vo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.newenv.communityFocus.domain.TblDepartment;
import com.newenv.communityFocus.domain.TblUserLogin;
import com.newenv.communityFocus.domain.TblUserProfile;

/**
 * 登录用户信息。
 * 
 * @author chenky
 *
 */
public class UserLogin {
	private String countryId; // 登录人国家
	private String provinceId; // 登录人省份
	private String cityId; // 登录人城市
	private Integer htype; // 所属项目，三级市场、商业地产...
	private TblUserLogin userLogin;
	private TblUserProfile userProfile;
	private TblDepartment department;
	private String titleName;

	private Map<String, HRPermission> permissions = new HashMap<String, HRPermission>();

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}

	public String getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}

	public String getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}

	public String getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		this.cityId = cityId;
	}

	public Integer getHtype() {
		return htype;
	}

	public void setHtype(Integer htype) {
		this.htype = htype;
	}

	public TblUserLogin getUserLogin() {
		return userLogin;
	}

	public void setUserLogin(TblUserLogin userLogin) {
		this.userLogin = userLogin;
	}

	public TblUserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(TblUserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public TblDepartment getDepartment() {
		return department;
	}

	public void setDepartment(TblDepartment department) {
		this.department = department;
	}

	public void resetPermissions() {
		permissions.clear();
	}

	public void addHRPermissions(List<HRPermission> perms) {
		for (HRPermission p : perms) {
			permissions.put(p.getMenuName(), p);
		}
	}

	public boolean hasPermission(String permissionName) {
		return permissions.get(permissionName) != null;
	}

	public Map<String, HRPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(Map<String, HRPermission> permissions) {
		this.permissions = permissions;
	}

}
