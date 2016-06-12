package com.newenv.communityFocus.configuration;

public enum EntryPointEnum {
	//例子：文件上传
		 EXAMPLE_FILE_UPLOAD("/jsp/fileUpload.jsp"),
		//业主精耕
		 MOBLIE_OWNER_FOCUS("ownerFocus"),
		//精耕审核
		 MOBLIE_APPROVAL_FOCUS("approvalFocus"),
		//只能匹配
		 MOBLIE_AUTO_MATCH("autoMatch"),
		//合作共赢
		 MOBLIE_COOPERATION_WINWIN("cooperationWinwin"),
		//托管申请
		 MOBLIE_CUSTODY_APPLICATION("custodyApplication"),
		//私人图库
		 MOBLIE_PERSONAL_GALARY("personalGalary"),
		//精耕统计
		FOCUS_STATISTICS("focusStatistics"),
		//经纪人分派 组队盘 人对户
		 AGENT_DISPATCH("agentDispatch"),
		//责任盘分派
		 RESPONSIBILITY_DISPATCH("repsonsibilityDispatch"),
		//主营盘分派
		 MAJOR_DISPATCH("majorDispatch");
		 private String fu;

			private EntryPointEnum(String s) {
				fu = s;
			}
			
			public String getEntryPoint(){
				
				return fu;
			}
}
