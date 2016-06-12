/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package com.newenv.communityFocus.fed;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CommunityFocusServlet extends HttpServlet {

    /**
     * 
     */
    private static final long serialVersionUID = -9019993850246851112L;

    public void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	String userName = request.getUserPrincipal().getName();
    	
    	if(request.getSession().getAttribute("landingUrl")!=null){
    		((HttpServletResponse)response).sendRedirect(request.getSession().getAttribute("landingUrl").toString().replaceFirst("http", "https").replaceFirst("8080", "8443"));
    	}
    	else{
    		((HttpServletResponse)response).sendRedirect(request.getContextPath()+"/services/securityUserHolder/login/"+userName+"/login");
    	}
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    	if(request.getSession().getAttribute("landingUrl")!=null){
    		((HttpServletResponse)response).sendRedirect(request.getSession().getAttribute("landingUrl").toString().replaceFirst("http", "https").replaceFirst("8080", "8443"));
    	}
    }

}
