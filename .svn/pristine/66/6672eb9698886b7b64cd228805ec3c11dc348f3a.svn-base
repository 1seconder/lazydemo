package com.newenv.communityFocus.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.newenv.communityFocus.vo.HRPermission;

public class SecurityUtil {
	
	public static Map<String, HRPermission> currentAllHRPermissionsMap = new HashMap<String, HRPermission>();
	
	public static void resetHRPermissions(){
		currentAllHRPermissionsMap.clear();
	}
	
	
	public static void addHRPermissions(List<HRPermission> permissions){
		for(HRPermission p : permissions){
			currentAllHRPermissionsMap.put(p.getMenuName(), p);
		}
	}
	
	public static boolean hasHRPermission(String permissionName){
		return currentAllHRPermissionsMap.get(permissionName)!=null;
	}
	
	public static HRPermission getHRPermission(String permissionName){
		return currentAllHRPermissionsMap.get(permissionName);
	}
	
}
