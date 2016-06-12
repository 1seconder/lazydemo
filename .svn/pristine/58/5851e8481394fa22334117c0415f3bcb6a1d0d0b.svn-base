package com.newenv.communityFocus.services;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.newenv.communityFocus.base.BaseService;
import com.newenv.communityFocus.base.RequestParameter;
import com.newenv.communityFocus.dao.CommonDao;
import com.newenv.communityFocus.dao.DaoHelper;
import com.newenv.communityFocus.security.SecurityUserHolder;

/**
 * 
 * @author hui.peng
 * @date 2016-03-06
 *
 */
@Component
@Path("/commonService")
public class CommonService extends BaseService {
	
	@Autowired
	private DaoHelper daoHelper;
	
	@Autowired
	private CommonDao commonDao;
	
//	private int loginId = 12;
//	int loginDeptid = 11077;//登陆人所在部门Id; 
//	int sqJlDeptId =3;
	
	/**
	 * 查询商圈
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectSq")
	public Response selectSq(RequestParameter parameter) {
		List<Record> list = new ArrayList<Record>();
//		StringBuffer buff = new StringBuffer();
//		buff.append("SELECT DISTINCT prfl.id,dpt.id deptid, prfl.fullname, prfl.tel,  prfl.join_time, prfl.identityCode ");
//		buff.append("	  ,ulogin.username,dpt.department_name, ttl.title_name, prfl.group_phone                  ");
//		buff.append("	  FROM tbl_user_profile prfl, tbl_user_login ulogin, tbl_department dpt, tbl_title ttl    ");
//		buff.append("	  WHERE ulogin.tbl_User_profile_id=prfl.id                                                ");
//		buff.append("	  AND prfl.tbl_department_id=dpt.id AND prfl.tbl_Title=ttl.id      ");
//		buff.append("	  AND ulogin.status=1 AND prfl.checked!=0       ");
//		buff.append("	  AND prfl.checked!=2 AND dpt.flag=1 AND dpt.CityID=1     ");
//		buff.append(" AND title_name LIKE '%市场副总经理%' ");
		int qyId = Integer.parseInt(parameter.getStressId());
		list = commonDao.getSqByQyId(qyId);
		try {
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	/**
	 * 查询总监
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectZj/{cityId}")
	public Response selectZj(@PathParam("cityId") String cityId) {
		List<Record> list = new ArrayList<Record>();
		StringBuffer buff = new StringBuffer();
		buff.append("SELECT DISTINCT prfl.id,dpt.id deptid, prfl.fullname, prfl.tel,  prfl.join_time, prfl.identityCode ");
		buff.append("	  ,ulogin.username,dpt.department_name, ttl.title_name, prfl.group_phone                  ");
		buff.append("	  FROM tbl_user_profile prfl, tbl_user_login ulogin, tbl_department dpt, tbl_title ttl    ");
		buff.append("	  WHERE ulogin.tbl_User_profile_id=prfl.id                                                ");
		buff.append("	  AND prfl.tbl_department_id=dpt.id AND prfl.tbl_Title=ttl.id      ");
		buff.append("	  AND ulogin.status=1 AND prfl.checked!=0       ");
		buff.append("	  AND prfl.checked!=2 AND dpt.flag=1 AND dpt.CityID="+SecurityUserHolder.getCityId());
		buff.append(" AND title_name LIKE '%市场副总经理%' ");
		try {
			list = daoHelper.getRecordList(buff.toString());
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	/**
	 * 
	 * 查询总监管辖的所有门店
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectMdByZj/{zjId}")
	public Response selectMdByZj(@PathParam("zjId") String zjId) {
		List<Record> list = new ArrayList<Record>();
		   
		String sql = " SELECT DISTINCT dept2_id tbl_department_id,dept2_name department_name FROM view_alldepartment WHERE dept3_id ="+zjId;
		try {
			list = daoHelper.getRecordList(sql);
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	/**
	 * 
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectDzByZj/{zjId}")
	public Response selectDzByZj(@PathParam("zjId") String zjId) {
		List<Record> list = new ArrayList<Record>();
		int loginDeptid = SecurityUserHolder.getDeptId();   
		String sql = "SELECT distinct tbl_department_id,department_name FROM view_loginxinxi WHERE parent_id IN (SELECT tbl_department_id FROM view_loginxinxi WHERE parent_id = "+ loginDeptid+ ")";
		try {
			list = daoHelper.getRecordList(sql);
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
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
			list = daoHelper.getRecordList("  SELECT distinct l.id, l.lp_name lpname FROM xhj_lpxx l , lpjg_assignment_loupan p "
					+ "	WHERE p.lpid = l.id "
					+ " AND  p.mdid IN (SELECT  v.tbl_department_id   FROM view_loginxinxi v WHERE v.parent_id = "+ sqJlDeptId + ")");
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	/**
	 * 根据商圈查楼盘(范围盘)
	 * @param sqid
	 * @return
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectLpBySqId/{sqid}")
	public Response selectLpBySqId(@PathParam("sqid") String sqid) {
		List<Record> list = new ArrayList<Record>();
		int loginDeptid = SecurityUserHolder.getDeptId();
		try {
			String sql = " SELECT DISTINCT l.id,l.lp_name lpname FROM  xhj_lcfz_1 b,xhj_lpxx l ,  view_alldepartment v "
					+ " WHERE b.lpid = l.id AND v.dept1_id = b.bmid AND  v.dept4_id =" + loginDeptid + " and  l.sq_id= "+ sqid +"";
			list = daoHelper.getRecordList(sql);
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	/***
	 * 根据楼盘查楼栋
	 * @param lpid 
	 * @return
	 */
	@POST
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectLd/{lpid}")
	public Response selectBuilding(@PathParam("lpid") String lpid) {
		List<Record> list = new ArrayList<Record>();
		try {
			list = daoHelper.getRecordList("    SELECT id ,lpd_name ldname FROM xhj_lpdong WHERE lpid =  '"+lpid+"'");
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	/**
	 *根据楼栋查单元
	 */
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
//	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectDy/{ldid}")
	public Response selectDanyuan(@PathParam("ldid") String ldid) {
		List<Record> list = new ArrayList<Record>();
		try {
			list = daoHelper.getRecordList("  SELECT id ,dy_name dyname FROM xhj_lpdanyuan  WHERE dzid =  '"+ldid+"'");
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	
	/****
	 * 根据单元查房号
	 * @param dyid
	 * @return
	 */
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
//	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectFh/{dyid}")
	public Response selectFh(@PathParam("dyid") String dyid) {
		List<Record> list = new ArrayList<Record>();
		try {
			list = daoHelper.getRecordList("  SELECT id ,fanghao FROM xhj_lpfanghao WHERE dyid =  '"+dyid+"'");
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}

	
	/**
	 * 根据门店查经纪人	
	 */
	@GET
	@Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
//	@Consumes({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
	@Path("/selectJjr/{mdId}")
	public Response selectJjr(@PathParam("mdId") String mdId) {
		List<Record> list = new ArrayList<Record>();
		try {
			StringBuffer buff = new StringBuffer();
//			buff.append("SELECT DISTINCT prfl.id,dpt.id deptId, prfl.fullname, prfl.tel,  prfl.join_time, prfl.identityCode ");
//			buff.append("	  ,ulogin.username,dpt.department_name, ttl.title_name, prfl.group_phone                  ");
//			buff.append("	  FROM tbl_user_profile prfl, tbl_user_login ulogin, tbl_department dpt, tbl_title ttl    ");
//			buff.append("	  WHERE ulogin.tbl_User_profile_id=prfl.id                                                ");
//			buff.append("	  AND prfl.tbl_department_id=dpt.id AND prfl.tbl_Title=ttl.id      ");
//			buff.append("	  AND ulogin.status=1 AND prfl.checked!=0       ");
//			buff.append("	  AND prfl.checked!=2 AND dpt.flag=1 AND dpt.CityID=1     ");
////			
//			buff.append(" AND title_name LIKE '%经纪人%'");
//			buff.append(" AND dpt.id = " + mdId );
			
			list = daoHelper.getRecordList(" SELECT * FROM tbl_user_profile v,tbl_title ttl  WHERE v.tbl_Title = ttl.id and  tbl_department_id = " + mdId + " and  checked NOT IN (0,2,11) and (ttl.title_name = '综合经纪人' or ttl.title_name like '%门店经理%')");
			return Response.ok().entity(list).build();
		}
		catch (Exception e) {
			return Response.status(500).build();
		}
	}
	
	
	
	/**
	 * 查询栋名称
	 * @param ids  待分配所有房号id
	 * @return
	 *//*
	public String  queryDong()
	{
		String id = this.getRequest().getParameter("id");
//		String ids = this.getRequest().getParameter("ids");
		List<Object[]> lists = personServices.queryDong(id);
		return jsonAjaxResult(JSON.toJSONString(lists));
	}
	
	
	*//**
	 * 查询danyuan名称
	 * @param ids  待分配所有房号id
	 * @return
	 *//*
	public String  queryDanyuan()
	{
		String id = this.getRequest().getParameter("id");
//		String ids = this.getRequest().getParameter("ids");
		List<Object[]> lists =  personServices.queryDanyuan(id);
		return jsonAjaxResult(JSON.toJSONString(lists));
	}
	
	*//**
	 * 根据单元查询房号
	 *//*
	public String queryFanghaoForSelect() {
		Integer lpid = Integer.valueOf(this.getRequest().getParameter("lpid"));
		Integer buildingid = Integer.valueOf(this.getRequest().getParameter("buildingid"));
		Integer dyid = Integer.valueOf(this.getRequest().getParameter("dyid"));
		List<Object[]> queryFanghao = personServices.queryFanghaoForSelect(lpid, buildingid, dyid);
		return jsonAjaxResult(JSON.toJSONString(queryFanghao));
	}
	
	*//**
	 * 查询huxing
	 * @param ids  待分配所有房号id
	 * @return
	 *//*
	public String queryHuxing()
	{	
		String lpid = this.getRequest().getParameter("lpid");
		String dongid = this.getRequest().getParameter("dongid");
		String danyuanid =  this.getRequest().getParameter("danyuanid");
		return jsonAjaxResult(JSON.toJSONString(personServices.queryHuxing(lpid, dongid, danyuanid)));
	}*/
	
}
