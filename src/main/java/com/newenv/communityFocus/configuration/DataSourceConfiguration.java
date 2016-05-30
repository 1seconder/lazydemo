/**
 * @Project: communityFocus
 * @FilePath: com.newenv.communityFocus.configuration.DataSourceConfiguration.java
 * @author: mingjie.lu
 * @date: 2016年5月10日 上午9:16:05
 */
package com.newenv.communityFocus.configuration;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * @ClassName: com.newenv.communityFocus.configuration.DataSourceConfiguration
 * @Description: 数据源配置类
 * @author: mingjie.lu
 * @date: 2016年5月10日 上午9:16:05
 */
@Configuration
@ConfigurationProperties(prefix = "dataSource")
public class DataSourceConfiguration {
	private String driverclass="com.mysql.jdbc.Driver";
	private String jdbcurl;
	private String user;
	private String password;
	private Integer acquireIncrement=1;
	private Integer initialPoolSize=1;
	private Integer minPoolSize=1;
	private Integer maxPoolSize=500;
	private Integer maxIdleTime=600;
	private Integer idleConnectionTestPeriod=500;
	private Integer maxStatements=0;
	private Integer maxStatementsPerConnection=100;
	/**
	 * @return the driverclass
	 */
	public String getDriverclass() {
		return driverclass;
	}
	/**
	 * @param driverclass the driverclass to set
	 */
	public void setDriverclass(String driverclass) {
		this.driverclass = driverclass;
	}
	/**
	 * @return the jdbcurl
	 */
	public String getJdbcurl() {
		return jdbcurl;
	}
	/**
	 * @param jdbcurl the jdbcurl to set
	 */
	public void setJdbcurl(String jdbcurl) {
		this.jdbcurl = jdbcurl;
	}
	/**
	 * @return the user
	 */
	public String getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(String user) {
		this.user = user;
	}
	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * @return the acquireIncrement
	 */
	public Integer getAcquireIncrement() {
		return acquireIncrement;
	}
	/**
	 * @param acquireIncrement the acquireIncrement to set
	 */
	public void setAcquireIncrement(Integer acquireIncrement) {
		this.acquireIncrement = acquireIncrement;
	}
	/**
	 * @return the initialPoolSize
	 */
	public Integer getInitialPoolSize() {
		return initialPoolSize;
	}
	/**
	 * @param initialPoolSize the initialPoolSize to set
	 */
	public void setInitialPoolSize(Integer initialPoolSize) {
		this.initialPoolSize = initialPoolSize;
	}
	/**
	 * @return the minPoolSize
	 */
	public Integer getMinPoolSize() {
		return minPoolSize;
	}
	/**
	 * @param minPoolSize the minPoolSize to set
	 */
	public void setMinPoolSize(Integer minPoolSize) {
		this.minPoolSize = minPoolSize;
	}
	/**
	 * @return the maxPoolSize
	 */
	public Integer getMaxPoolSize() {
		return maxPoolSize;
	}
	/**
	 * @param maxPoolSize the maxPoolSize to set
	 */
	public void setMaxPoolSize(Integer maxPoolSize) {
		this.maxPoolSize = maxPoolSize;
	}
	/**
	 * @return the maxIdleTime
	 */
	public Integer getMaxIdleTime() {
		return maxIdleTime;
	}
	/**
	 * @param maxIdleTime the maxIdleTime to set
	 */
	public void setMaxIdleTime(Integer maxIdleTime) {
		this.maxIdleTime = maxIdleTime;
	}
	/**
	 * @return the idleConnectionTestPeriod
	 */
	public Integer getIdleConnectionTestPeriod() {
		return idleConnectionTestPeriod;
	}
	/**
	 * @param idleConnectionTestPeriod the idleConnectionTestPeriod to set
	 */
	public void setIdleConnectionTestPeriod(Integer idleConnectionTestPeriod) {
		this.idleConnectionTestPeriod = idleConnectionTestPeriod;
	}
	/**
	 * @return the maxStatements
	 */
	public Integer getMaxStatements() {
		return maxStatements;
	}
	/**
	 * @param maxStatements the maxStatements to set
	 */
	public void setMaxStatements(Integer maxStatements) {
		this.maxStatements = maxStatements;
	}
	/**
	 * @return the maxStatementsPerConnection
	 */
	public Integer getMaxStatementsPerConnection() {
		return maxStatementsPerConnection;
	}
	/**
	 * @param maxStatementsPerConnection the maxStatementsPerConnection to set
	 */
	public void setMaxStatementsPerConnection(Integer maxStatementsPerConnection) {
		this.maxStatementsPerConnection = maxStatementsPerConnection;
	}
	
}
