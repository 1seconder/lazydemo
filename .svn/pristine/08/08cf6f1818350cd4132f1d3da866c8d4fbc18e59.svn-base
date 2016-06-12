package com.newenv.communityFocus.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SyscsDao {
	private Log logger = LogFactory.getLog(SyscsDao.class);
	@Autowired
	private DaoHelper daoHelper;

	@SuppressWarnings("rawtypes")
	public List getSyscsParamByName(String name) {
		try {
			String sql = "SELECT id,name FROM xhj_syscs_1 where sid = (select  sid from xhj_syscs where name = '" + name + "')";
			return daoHelper.getRecordList(sql.toString());
		} catch (Exception e) {
			logger.error("getSyscsParamByName Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	public List getSyscsParamById(Integer id) {
		try {
			String sql = "SELECT * FROM xhj_syscs_1 where sid =  " + id;
			return daoHelper.getRecordList(sql.toString());
		} catch (Exception e) {
			logger.error("getSyscsParamById Exception:", e);
			e.printStackTrace();
			return null;
		}
	}
}
