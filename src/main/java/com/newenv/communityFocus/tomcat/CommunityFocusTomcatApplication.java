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

package com.newenv.communityFocus.tomcat;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.web.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan("com.newenv.communityFocus")
public class CommunityFocusTomcatApplication extends SpringBootServletInitializer {

	private static Log logger = LogFactory.getLog(CommunityFocusTomcatApplication.class);

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(CommunityFocusTomcatApplication.class);
	}

	public static void main(String[] args) throws Exception {
		SpringApplication.run(CommunityFocusTomcatApplication.class, args);
	}

	@Bean
	protected ServletContextListener listener() {
		return new ServletContextListener() {
			public void contextInitialized(ServletContextEvent sce) {
				logger.info("sce: " + sce.getServletContext().getContextPath());
				logger.info("source: " + sce.getSource());
				logger.info("ServletContext initialized");
			}
			public void contextDestroyed(ServletContextEvent sce) {
				logger.info("ServletContext destroyed");
			}
		};
	}

}
