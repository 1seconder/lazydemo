package com.newenv.communityFocus.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommonDao {

	private Log logger = LogFactory.getLog(CommonDao.class);

	@Autowired
	private DaoHelper daoHelper;

	@Autowired
	private UserDao userDao;

	public List<Record> getQuyuByCityId(int id) {
		try {
			String sql = "select * from xhj_jcstress where cityId  =" + id + "";
			return daoHelper.getRecordList(sql.toString());
		} catch (Exception e) {
			logger.error("getQuyuByCityId Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Record> getSqByQyId(int id) {
		try {
			String sql = "select * from xhj_jcsq where qyid  =" + id + "";
			return daoHelper.getRecordList(sql.toString());
		} catch (Exception e) {
			logger.error("getSqByQyId Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Record> getLpBySqId(int id) {
		try {
			List<Record> list = daoHelper.getRecordList(" SELECT id, lp_name lpname FROM xhj_lpxx where id in (select lpid from lpjg_assignment_loupan )");
			return list;
		} catch (Exception e) {
			logger.error("getLpBySqId Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Record> getMdByPq(int id) {
		try {
			List<Record> list = daoHelper.getRecordList(" SELECT id, lp_name lpname FROM xhj_lpxx where id in (select lpid from lpjg_assignment_loupan )");
			return list;
		} catch (Exception e) {
			logger.error("getMdByPq Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Record> getConstantsByName(String name) {
		try {
			List<Record> list = daoHelper.getRecordList(" select id , name from web_syscs_1 where sid= (SELECT id FROM web_syscs WHERE NAME = '" + name + "' limit 1 )");
			return list;
		} catch (Exception e) {
			logger.error("getConstantsByName Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> getFhxx(long id) {
		try {
			StringBuffer fjSql = new StringBuffer();
			fjSql.append("SELECT l.id lpid ,lp_name lpname ,d.id dongid, lpd_name dong,dy.id dyid, dy_name danyuan,f.id fhid ,f.ceng,f.totalfloor, fanghao, shi,ting ,chu,wei,yang, ");
			fjSql.append("(SELECT city_name FROM xhj_jccity WHERE id = l.cityid  ) cityname, ");
			fjSql.append("(SELECT qy_name FROM xhj_jcstress WHERE id = l.stressid  ) qyname, ");
			fjSql.append("(SELECT sq_name FROM xhj_jcsq WHERE id = l.sq_id  ) sqname,cityid ,stressid,sq_id   ");
			fjSql.append("FROM  xhj_lpxx l , xhj_lpdong d, xhj_lpdanyuan dy,xhj_lpfanghao f ");
			fjSql.append(" WHERE ");
			fjSql.append(" l.id = d.lpid ");
			fjSql.append(" AND  d.id = dy.dzid  ");
			fjSql.append(" AND  dy.id = f.dyid  ");
			fjSql.append(" and f.id = " + id);
			return daoHelper.getItem(fjSql.toString());
		} catch (Exception e) {
			logger.error("getFhxx Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	public Integer querySjDeptId(Integer deptId) {
		try {
			String sql = "select parent_id from tbl_department where id=" + deptId;
			Map map = daoHelper.getItem(sql);
			return (Integer) map.get("parent_id");
		} catch (Exception e) {
			logger.error("querySjDeptId Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

	public List<Record> getUnusualFhList(int deptId, int userId) {
		try {
			StringBuffer sb = new StringBuffer();
			sb.append(" SELECT fh.id fhid,fh.fanghao,lp.id lpid , lp.lp_name lpname ");
			sb.append(" FROM xhj_lpxx lp,xhj_lpdong dz , xhj_lpdanyuan dy,lpjg_assignment_loupan lap,xhj_lpfanghao fh,lpjg_assignment_room lar, lpjg_precise_update_record p  ");
			sb.append("  where lp.id=dz.lpid and dz.id = dy.dzid and dy.id=fh.dyid AND fh.id=lar.fhid and lp.id=lap.lpid and fh.statuss =1 and lp.statuss= 1  AND lar.flag =1  ");
			sb.append(" AND fh.id = p.fhid  AND p.statuss = 1 AND p.flag = 1");
			String subSql = "";
			// 登陆控制
			List<Record> organizationName = userDao.getTitle(userId);
			String string = organizationName.toString();
			if (string.indexOf("商圈经理") > -1) {
				sb.append(" and lar.mdid = ").append(deptId);
				subSql = " AND p.mdid=" + deptId;
			}
			if (string.indexOf("门店") > -1) {
				sb.append(" and lar.userid = ").append(userId);
				subSql = " AND p.creatorid=" + userId;
			}
			if (string.indexOf("经纪人") > -1) {
				sb.append(" and lar.userid = ").append(userId);
				subSql = " AND p.creatorid=" + userId;
			}
			sb.append(subSql);
			return daoHelper.getRecordList(sb.toString());
		} catch (Exception e) {
			logger.error("getUnusualFhList Exception:", e);
			e.printStackTrace();
			return null;
		}
	}

}
