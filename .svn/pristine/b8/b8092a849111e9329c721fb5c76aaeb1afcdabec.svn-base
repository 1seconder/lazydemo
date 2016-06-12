/*
 * Copyright 2012-2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.newenv.communityFocus.services;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;

import org.nutz.dao.Dao;
import org.springframework.beans.factory.annotation.Autowired;

import com.newenv.communityFocus.vo.GuestProfile;

@Path("/guestProfileService")
public class GuestProfileService {
	@Autowired(required=true)
	private Dao dao;
	
	@GET
	@Produces("application/json")
	@Consumes("application/json")
	@Path("/guestProfile/name/{guestName}")
	public Response getUserProfile(@PathParam("guestName") String name) {
		GuestProfile gp = new GuestProfile();
		gp.setGuestName(name);
		gp.setAge(55);
		gp.setApplicationNo(dao.count("application"));

//		Sql sql = Sqls.create("select version();");
//        sql.setCallback(Sqls.callback.records());
//        System.out.println(dao+"sfdsfsd");
//        sql.setEntity(dao.getEntity(Record.class));
//        dao.execute(sql);
//        List<Record> list = sql.getList(Record.class);
	//	gp.setDbVersion(dbVersion);
		return Response.ok().entity(gp).build();
	}

}
