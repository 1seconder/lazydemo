package com.newenv.communityFocus.services;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.apache.cxf.jaxrs.ext.multipart.Attachment;
import org.apache.cxf.jaxrs.ext.multipart.Multipart;
import org.nutz.dao.entity.Record;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.newenv.communityFocus.base.BaseService;
import com.newenv.communityFocus.configuration.EntryPointEnum;
import com.newenv.communityFocus.dao.DaoHelper;
import com.newenv.communityFocus.domain.FangYuan;
import com.newenv.communityFocus.vo.GuestProfile;

@Component
//@EnableAutoConfiguration
@Path("/fileService")
public class FileUploadService extends BaseService{
	
	@Autowired
	private DaoHelper daoHelper;
	
	//文件上传接口
	@POST
	@Produces("application/json")
    @Consumes("multipart/form-data")
    @Multipart(value = "file", type = "application/octet-stream")
	@Path("/file")
    public Response postGetFile(@Multipart("fileName") String fileName, @Multipart("upfile") Attachment attachment) throws IOException {
		String filename = attachment.getContentDisposition().getParameter("filename");

        java.nio.file.Path path = Paths.get("c:/" + filename);
        Files.deleteIfExists(path);
        InputStream in = attachment.getObject(InputStream.class);

        Files.copy(in, path);
		return Response.ok("uploaded " + fileName).build();
	}
	
	  @GET
	  @Produces("text/html")
	  @Path("/uploadPage")
	  public void uploadPage() {
		 GuestProfile gp = new GuestProfile();
			gp.setGuestName("joeli");
			gp.setAge(55);
			gp.setApplicationNo(123);
		 	super.setRequestAttribute("testAttr",gp);
		 	super.forwardTo(EntryPointEnum.EXAMPLE_FILE_UPLOAD.getEntryPoint());
		 	//return Response.ok().build();
		 //	return Response.created(URI.create(EntryPointEnum.EXAMPLE_FILE_UPLOAD.getEntryPoint())).build();
		  	//return	Response.seeOther(URI.create(EntryPointEnum.EXAMPLE_FILE_UPLOAD.getEntryPoint())).build();
	  } 
	  /**
	   * 
	   * example:操作记录 MVC
	   * @author hui.peng
	   */
	  @GET
	  @Produces("text/html")
	  @Path("/operRecord")
	  public void operRecord() {
		Record record = daoHelper.getRecord("SELECT id ,title_name FROM TBL_TITLE   limit 1");
		FangYuan  f = new FangYuan();
		f.setHsid(1);
		f.setFangYuanId("123");
		daoHelper.save(f);
	 	super.setRequestAttribute("record",record);
	 	super.forwardTo("/jsp/record.jsp");
	  } 
	
	  
}
