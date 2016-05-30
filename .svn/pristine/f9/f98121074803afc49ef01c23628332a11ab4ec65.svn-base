package com.newenv.communityFocus.configuration;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;
import javax.ws.rs.ext.Provider;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.cxf.bus.spring.SpringBus;
import org.apache.cxf.endpoint.Server;
import org.apache.cxf.interceptor.Interceptor;
import org.apache.cxf.interceptor.LoggingInInterceptor;
import org.apache.cxf.jaxrs.JAXRSServerFactoryBean;
import org.apache.cxf.message.Message;
import org.apache.cxf.transport.servlet.CXFServlet;
import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.embedded.ServletRegistrationBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.jaxrs.json.JacksonJaxbJsonProvider;
import com.fasterxml.jackson.jaxrs.json.JacksonJsonProvider;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.c3p0.PooledDataSource;
import com.newenv.communityFocus.interceptor.XhjLpjgInterceptor;
//import com.newenv.communityFocus.mvc.controlls.ExampleEntryController;
import com.newenv.communityFocus.services.FileUploadService;
import com.newenv.communityFocus.services.GuestProfileService;

@Configuration
@ImportResource({ "classpath:META-INF/cxf/cxf.xml" })
@ComponentScan
public class APPConfiguration {

	private static final Log logger = LogFactory.getLog(APPConfiguration.class);

	@Autowired
	private ApplicationContext ctx;

	@Value("${cxf.path:/services/*}")
	private String cxfPath;

	@Value("${cxf.log.requests:false}")
	private boolean logRequests;

	@Autowired
	private DataSourceConfiguration dataSourceConfiguration;
	
	@Autowired
	private ServiceWhiteListConfiguration serviceWhiteListConfiguration;

	@Bean
	public ServletRegistrationBean cxfServletRegistrationBean() {
		return new ServletRegistrationBean(new CXFServlet(), cxfPath);
	}

	@Bean
	public Server jaxRsServer() {
		Server server = null;
		try {
			List<Object> serviceBeans = new ArrayList<Object>(ctx.getBeansWithAnnotation(Path.class).values());
			serviceBeans.add(fileUploadService());
			logger.info("Registering service beans: " + serviceBeans);
			List<Object> providers = new ArrayList<Object>(ctx.getBeansWithAnnotation(Provider.class).values());
			providers.add(jsonProvider(objectMapper()));
			logger.info("Registering providers: " + providers);
			JAXRSServerFactoryBean factory = new JAXRSServerFactoryBean();
			factory.setBus(ctx.getBean(SpringBus.class));
			factory.setAddress("/");
			factory.setServiceBeans(serviceBeans);
			List<Interceptor<? extends Message>> interceptors = new ArrayList<Interceptor<? extends Message>>();
			interceptors.add(new XhjLpjgInterceptor(serviceWhiteListConfiguration));
			factory.setInInterceptors(interceptors);
			factory.setProviders(providers);
			server = factory.create();
			if (logRequests) {
				server.getEndpoint().getInInterceptors().add(new LoggingInInterceptor());
			}
		} catch (Exception e) {
			logger.error("jaxRsServer exception:", e);
			e.printStackTrace();
		}
		return server;
	}

	@Bean
	@ConditionalOnMissingBean
	public JacksonJsonProvider jsonProvider(ObjectMapper objectMapper) {
		JacksonJaxbJsonProvider provider = new JacksonJaxbJsonProvider();
		provider.setMapper(objectMapper);
		return provider;
	}

	@Bean
	@ConditionalOnMissingBean
	public GuestProfileService guestProfileService() {
		return new GuestProfileService();
	}

	@Bean
	@ConditionalOnMissingBean
	public FileUploadService fileUploadService() {
		return new FileUploadService();
	}

	@Bean
	@ConditionalOnMissingBean
	public ObjectMapper objectMapper() {
		return new ObjectMapper();
	}

	@Bean(name = "dataSourceConfiguration")
	@ConditionalOnMissingBean
	public DataSourceConfiguration dataSourceConfiguration() {
		return new DataSourceConfiguration();
	}

	@Bean(name = "dataSource")
	public PooledDataSource dataSource() {
		ComboPooledDataSource cpds = new ComboPooledDataSource();
		try {
			cpds.setAcquireIncrement(dataSourceConfiguration.getAcquireIncrement());
			cpds.setInitialPoolSize(dataSourceConfiguration.getInitialPoolSize());
			cpds.setMinPoolSize(dataSourceConfiguration.getMinPoolSize());
			cpds.setMaxPoolSize(dataSourceConfiguration.getMaxPoolSize());
			cpds.setMaxIdleTime(dataSourceConfiguration.getMaxIdleTime());
			cpds.setIdleConnectionTestPeriod(dataSourceConfiguration.getIdleConnectionTestPeriod());
			cpds.setMaxStatements(dataSourceConfiguration.getMaxStatements());
			cpds.setMaxStatementsPerConnection(dataSourceConfiguration.getMaxStatementsPerConnection());
			cpds.setDriverClass(dataSourceConfiguration.getDriverclass());
			cpds.setJdbcUrl(dataSourceConfiguration.getJdbcurl());
			cpds.setUser(dataSourceConfiguration.getUser());
			cpds.setPassword(dataSourceConfiguration.getPassword());
		} catch (Exception e) {
			logger.error("init dataSource exception:", e);
			e.printStackTrace();
		}
		return cpds;
	}

	@Bean(name = "dao")
	@ConditionalOnMissingBean
	public Dao dao() {
		NutDao nd = null;
		try {
			nd = new NutDao(dataSource());
			logger.info("init dataSource success.");
		} catch (Exception e) {
			logger.error("init dao exception:", e);
		}
		return nd;
	}

}
