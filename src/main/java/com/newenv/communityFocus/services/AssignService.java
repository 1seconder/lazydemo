package com.newenv.communityFocus.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

//import org.apache.commons.lang3.StringUtils;
import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.newenv.communityFocus.base.BaseService;
import com.newenv.communityFocus.base.PageInfo;
import com.newenv.communityFocus.base.RequestParameter;
import com.newenv.communityFocus.base.TableConstants;
import com.newenv.communityFocus.dao.CommonDao;
import com.newenv.communityFocus.dao.DaoHelper;
import com.newenv.communityFocus.security.SecurityUserHolder;
import com.newenv.communityFocus.stastistic.manager.FzManager;
import com.newenv.communityFocus.stastistic.manager.SqManager;
import com.newenv.communityFocus.vo.RangePlateStatistic;

@Component
@Path("/assignService")
/***
 * 分派
 * @author 
 *
 */
public class AssignService extends BaseService {

	@Autowired
	private DaoHelper daoHelper;
	@Autowired
	private CommonDao commonDao;
	
	
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/query")
	public Response query(RequestParameter parameter) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("  SELECT dept1_id,department_name,fullname , a.id  jjrid,    ");
			sql.append("  SUM(CASE WHEN (b.id IS NULL OR b.flag !=1) THEN 0 ELSE 1 END) assnum,COUNT(1) fjtotal,  ");
//			sql.append("  ( select  DATE_FORMAT(MAX(b.operatedate),'%Y-%m-%d %H:%i:%s') from lpjg_operation_log b where operatorid = "+ SecurityUserHolder.getUserId()+ ")  lasttime ");
			sql.append("  DATE_FORMAT(MAX(b.createdate),'%Y-%m-%d %H:%i:%s')  lasttime ");
			sql.append("   FROM    (  ");
			sql.append("  SELECT dept1_id ,dept1_name department_name,v.fullname, v.id  ");
			sql.append("   FROM tbl_user_profile v  , view_alldepartment v2 ,tbl_title ttl  WHERE v.tbl_department_id = v2.dept1_id and v.tbl_Title = ttl.id and (ttl.title_name = '综合经纪人' or ttl.title_name like '%门店经理%') AND v.checked NOT IN (0,2,11) and v2.flag = 1  AND  dept2_id= "+SecurityUserHolder.getDeptId());
			
			if(parameter.getMdId() != null && !"0".equals(parameter.getMdId())){
				sql.append(" and dept1_id = " + parameter.getMdId());
			}
			if(parameter.getJjrId() != null && !"0".equals(parameter.getJjrId())){
				sql.append(" and v.id  = " + parameter.getJjrId());
			}
			sql.append("  ) a LEFT JOIN lpjg_assignment_room b ON a.id = b.userid   ");
			sql.append(" GROUP BY dept1_id,department_name,fullname  ORDER BY  SUM(CASE WHEN b.id IS NULL THEN 0 ELSE 1 END)  ASC    ");
			PageInfo pageInfo = parameter.getPageInfo();
			if(pageInfo == null){
				pageInfo = new PageInfo();
				pageInfo.setPage(1);
				pageInfo.setRows(10);
			} 
			pageInfo = super.getPagerjdo(sql.toString(), pageInfo);
			String jsonString = JSON.toJSONString(pageInfo);
			return Response.ok().entity(jsonString).build();
		}
		catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
	}
	
	/**
	 * 查询日志
	 * @param parameter
	 * @return
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/queryLog")
	public Response queryLog(RequestParameter parameter) {
		System.out.println("username--"+SecurityUserHolder.getUserName());
		System.out.println("deptid--"+SecurityUserHolder.getDeptId());
		System.out.println("userid--"+SecurityUserHolder.getUserId());
		try {
			String sql = "SELECT id , (SELECT fullname FROM tbl_user_profile WHERE id = l.operatorid )operator ,"
					+ " (SELECT d.department_name FROM tbl_user_profile t,tbl_department d WHERE t.id = l.operatorid  and t.tbl_department_id=d.id)bm , bmid ,message,  "
					+ " DATE_FORMAT(operatedate,'%Y-%m-%d %H:%i:%s') operatedate FROM  lpjg_operation_log l "
					+ " where operatorid=" +SecurityUserHolder.getUserId()
					+ " and type = "+ parameter.getType()
					+ " ORDER BY operatedate DESC ";
			
			PageInfo pageInfo = parameter.getPageInfo();
			if(pageInfo == null){
				pageInfo = new PageInfo();
				pageInfo.setPage(1);
				pageInfo.setRows(10);
			}
			pageInfo = super.getPagerjdo(sql, pageInfo);
			String jsonString = JSON.toJSONString(pageInfo);
			return Response.ok().entity(jsonString).build();
		}
		catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}

	}
	
	/**
	 * 查询已分派的楼盘
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectLp/{cityid}")
	public Response selectLp(@PathParam("cityid") String cityid) {
		List<Record> list = new ArrayList<Record>();
		int sqJlDeptId = SecurityUserHolder.getDeptId(); 
		try {
			list = daoHelper.getRecordList("  SELECT l.id, l.lp_name lpname FROM xhj_lpxx l , lpjg_assignment_loupan p "
					+ "	WHERE p.lpid = l.id  AND  p.mdid = "+ sqJlDeptId );
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
	}
	
	/**
	 * 分派
	 * @typeId : 1:组队盘，人对户；2 ：主营盘分派
	 * 
	 */
	@GET
	@Produces("text/html")
	@Path("/fenpai/{type}")
	public void operRecord(@PathParam("type") int typeId) {
		int loginDeptid  = SecurityUserHolder.getDeptId();
		int cityId = 1;
		if(SecurityUserHolder.getCurrentUserLogin() != null){
			cityId = SecurityUserHolder.getCityId();
		}
		
		StringBuffer buff = new StringBuffer();
		buff.append("SELECT DISTINCT prfl.id,dpt.id loginDeptid, prfl.fullname, prfl.tel,  prfl.join_time, prfl.identityCode ");
		buff.append("	  ,ulogin.username,dpt.department_name, ttl.title_name, prfl.group_phone                  ");
		buff.append("	  FROM tbl_user_profile prfl, tbl_user_login ulogin, tbl_department dpt, tbl_title ttl    ");
		buff.append("	  WHERE ulogin.tbl_User_profile_id=prfl.id                                                ");
		buff.append("	  AND prfl.tbl_department_id=dpt.id AND prfl.tbl_Title=ttl.id      ");
		buff.append("	  AND ulogin.status=1 AND prfl.checked!=0       ");
		buff.append("	  AND prfl.checked!=2 AND dpt.flag=1 ");
		buff.append("  AND dpt.CityID=    "+ cityId);
		StringBuffer appendCnd = new StringBuffer();
		if (typeId == 1) {
			appendCnd.append(" AND title_name LIKE '%门店%'   ");
			appendCnd.delete(0, appendCnd.length());
			appendCnd.append(" AND title_name LIKE '%经纪人%' ");
			List<Record> jjr = daoHelper.getRecordList(buff + appendCnd.toString());
			
			String sql = "  SELECT  dept1_id id ,dept1_name department_name FROM view_alldepartment v WHERE flag=1 and v.dept2_id = "+loginDeptid +"";
			List<Record> rl = daoHelper.getRecordList(sql);
			super.setRequestAttribute("rl", rl);
			super.setRequestAttribute("jjr", jjr);
			super.setRequestAttribute("stat", SqManager.getInstance().statistic(daoHelper, loginDeptid));
			super.forwardTo("/pages/fenpai/fenpai_zuduipan.jsp");
			
		} else if (typeId == 2) {
			appendCnd.append(" AND title_name LIKE '%门店%'   ");
			List<Record> md = daoHelper.getRecordList(buff + appendCnd.toString() );
			super.setRequestAttribute("md", md);
			appendCnd.delete(0, appendCnd.length());
			appendCnd.append(" AND dpt.parent_ID =  "+ loginDeptid);
			List<Record> jl = daoHelper.getRecordList(" SELECT  dept3_id id , dept3_name department_name FROM view_alldepartment  WHERE dept4_id ="+ loginDeptid + " GROUP BY dept3_id ,dept3_name ");
			super.setRequestAttribute("jl", jl);
			List qyList = commonDao.getQuyuByCityId(cityId);
			super.setRequestAttribute("qylist", commonDao.getQuyuByCityId(cityId));
			int qyId = (Integer)((Record)qyList.get(0)).get("id");
			super.setRequestAttribute("sqlist", commonDao.getSqByQyId(qyId));
			
			//按盘分派：
			super.setRequestAttribute("lplist", commonDao.getLpBySqId(qyId));
			super.setRequestAttribute("mdlist", commonDao.getLpBySqId(qyId));
			RangePlateStatistic bean = FzManager.getInstance().statistic(daoHelper,loginDeptid);
			super.setRequestAttribute("stat", bean);
			super.forwardTo("/pages/fenpai/fenpai_zuyinpan.jsp");
		} else if (typeId == 3) {
			buff.append("	  AND title_name = '市场副总经理'   ");
			List<Record> rl = daoHelper.getRecordList(buff.toString());
			// NutMap map = (NutMap) Mapl.maplistToObj(rl, NutMap.class);
			super.setRequestAttribute("rl", rl);
			super.forwardTo("/pages/fenpai/fenpai_zerenpan.jsp");
		}
	}

	
	/**
	 * 分派
	 * @param type
	 * @param jjrid
	 * @param fhid
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/saveFenPai/{type}/{jjrid}/{fhid}/{jjrname}")
	public Response saveFenPai(@PathParam("type") int type,@PathParam("jjrid") int jjrid,@PathParam("fhid") String fhid,@PathParam("jjrname") String jjrname) {
		List<Record> list = new ArrayList<Record>();
		if("-1".equals(fhid)){//删除给经纪人
//			daoHelper.update(" delete from  "+TableConstants.ASSIGIN_FANGHAO2JJR + "  where  userid = " + jjrid);
			daoHelper.update(" update   "+TableConstants.ASSIGIN_FANGHAO2JJR + " set flag =0 , createdate = NOW() where  userid = " + jjrid);
			daoHelper.update(" update  lpjg_precise_update_record  set flag =0  where  creatorid = " + jjrid + " and  fhid in  (select fhid  from lpjg_assignment_room  where userid=" + jjrid + " and flag =0 ) ");

			Record  r2 =  new Record();
			r2.set(".table", TableConstants.ASSIGIN_OPERATION_LOG);
			r2.set("operatorid", SecurityUserHolder.getUserId());
			r2.set("message", "删除该经纪人["+jjrname+"("+jjrid+")]下所有房屋");
			r2.set("bmid", jjrid);
			r2.set("type", 0);
			daoHelper.save(r2);
			return Response.ok().entity(list).build();
		}
		try {
			//商圈分派--经纪人--房号
			String [] fhs = fhid.split("\\,");
			Map<String,Map> fhMap = new HashMap<String,Map>();
			if(fhs.length > 0){
				String s = " SELECT f.id fhid ,dy.id dyid , d.id dzid ,l.id lpid   FROM xhj_lpfanghao f  LEFT JOIN xhj_lpdanyuan dy  ON f.dyid =dy.id  "
							+ " LEFT JOIN xhj_lpdong d  ON  d.id = dy.dzid  "
							+ " LEFT JOIN xhj_lpxx  l  ON l.id = d.lpid  WHERE  f.id IN   (" + fhid + ")";
				List<Map> fhList = daoHelper.getList(s);
				for(Map r : fhList){
					fhMap.put(r.get("fhid")+"", r);
				}
			}
			Map jjrDept = daoHelper.getItem("select tbl_department_id  deptid from view_loginxinxi where tbl_user_profile_id ="+jjrid);
			int bmid = -1; //如果该用户部门id为空 默认设置为-1  否则报空指针异常
			if(null != jjrDept){
				bmid = (Integer) jjrDept.get("deptid");
			}
//			daoHelper.update(" delete from  "+TableConstants.ASSIGIN_FANGHAO2JJR + "  where  userid = " + jjrid);
			daoHelper.update(" update   "+TableConstants.ASSIGIN_FANGHAO2JJR + " set flag =0 , createdate = NOW() where  userid = " + jjrid);
			daoHelper.update(" update  lpjg_precise_update_record  set flag =0  where  creatorid = " + jjrid + " and  fhid in  (select fhid  from lpjg_assignment_room  where userid=" + jjrid + " and flag =0 ) ");			
			
			for(String fh : fhs){
				Map tmp_r = (Map) fhMap.get(fh);
				Record  r =  new Record();
				r.set(".table", TableConstants.ASSIGIN_FANGHAO2JJR);
				r.set("cityid ", SecurityUserHolder.getCityId());
				r.set("userid", jjrid);
				r.set("fhid", fh);
				r.set("flag", 1);
				r.set("bmid", bmid);
				r.set("mdid", SecurityUserHolder.getDeptId());
				r.set("creatorid", SecurityUserHolder.getUserId());
				r.set("lpid", tmp_r.get("lpid") );
				r.set("dzid", tmp_r.get("dzid"));
				r.set("dyid", tmp_r.get("dyid"));
				daoHelper.save(r);
			}
			Record  r2 =  new Record();
			r2.set(".table", TableConstants.ASSIGIN_OPERATION_LOG);
			r2.set("operatorid", SecurityUserHolder.getUserId());
			r2.set("bmid", bmid);
			r2.set("message", "分配房号"+fhid+"给经纪人["+jjrname+"("+jjrid+")]");
			r2.set("type", 0);
			daoHelper.save(r2);
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			e.printStackTrace();
			return Response.status(500).build();
		}
	}

	/**
	 * 刷新组队盘分派的统计信息
	 * @return
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/refreshHeadMessage")
	public Response refreshHeadMessage() {
		int loginDeptid  = SecurityUserHolder.getDeptId();
		HashMap<String,Object> hashMap = new HashMap<String,Object>();
		hashMap.put("headMessage", SqManager.getInstance().statistic(daoHelper, loginDeptid));
		return Response.ok().entity(hashMap).build();
	}

	/**
	 * 查询经纪人下已分派的房屋
	 * @param parameter
	 * @return
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/queryAssignedJjr")
	public Response queryAssignedJjr(RequestParameter parameter) {
		List<Record> list = new ArrayList<Record>(); 
		try {
			list = daoHelper.getRecordList(" SELECT  fhid,f.fanghao,p.lp_name lpname,(SELECT lpd_name FROM xhj_lpdong d WHERE d.id = r.dzid) as lpd_name,(SELECT dy_name FROM xhj_lpdanyuan dy WHERE dy.id = r.dyid) as dy_name  "
					+ " FROM lpjg_assignment_room r , xhj_lpxx  p, xhj_lpfanghao f "
					+ "  WHERE r.fhid = f.id AND p.id = r.lpid and r.flag=1  AND  r.userid  ="+ parameter.getJjrId());
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
}
