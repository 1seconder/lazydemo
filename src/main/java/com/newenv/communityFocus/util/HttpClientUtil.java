package com.newenv.communityFocus.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.CookieSpecs;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

public final class HttpClientUtil {

	private static HttpClientUtil httpClientUtil;

	public static HttpClientUtil getInstance() {
		if (httpClientUtil == null) {
			return new HttpClientUtil();
		}
		return httpClientUtil;
	}

	/**
	 * httpclient get请求
	 * 
	 * @param url
	 * @param encode
	 * @return
	 * @throws Exception
	 */
	public String get(String url, String encode) throws Exception {
		CloseableHttpClient httpclient = HttpClients.custom().build();
		HttpGet httpget = new HttpGet(url);
		CloseableHttpResponse response = null;
		RequestConfig requestconfig = RequestConfig.custom().setSocketTimeout(1000 * 5).setConnectTimeout(1000 * 5).setCookieSpec(CookieSpecs.DEFAULT).build();
		httpget.setConfig(requestconfig);
		try {
			response = httpclient.execute(httpget);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != HttpStatus.SC_OK) {
				throw new Exception("远程连接失败");
			}
			HttpEntity entity = response.getEntity();
			String responseStr = "";
			if (entity != null) {
				responseStr = EntityUtils.toString(entity, encode);
			}
			EntityUtils.consume(entity);
			return responseStr;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("远程调用失败");
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				if (httpget != null) {
					httpget.releaseConnection();
				}
				if (httpclient != null) {
					httpclient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 
	 * @Title: post
	 * @Description: post
	 * @param url
	 * @param encode
	 * @param params
	 * @return
	 * @throws Exception
	 * @return String
	 * @throws
	 */
	public String post(String url, String encode, Map<String, String> params) throws Exception {
		CloseableHttpClient httpclient = HttpClients.custom().build();
		HttpPost httpPost = new HttpPost(url);
		CloseableHttpResponse response = null;
		RequestConfig requestconfig = RequestConfig.custom().setSocketTimeout(1000 * 5).setConnectTimeout(1000 * 5).setCookieSpec(CookieSpecs.DEFAULT).build();
		httpPost.setConfig(requestconfig);
		try {
			if (params != null && params.size() > 0) {
				Set<String> paramsSet = params.keySet();
				List<NameValuePair> nvps = new ArrayList<NameValuePair>();
				for (String key : paramsSet) {
					nvps.add(new BasicNameValuePair(key, params.get(key)));
				}
				httpPost.setEntity(new UrlEncodedFormEntity(nvps, encode));
			}
			response = httpclient.execute(httpPost);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != HttpStatus.SC_OK) {
				throw new Exception("远程连接失败");
			}
			HttpEntity entity = response.getEntity();
			String responseStr = "";
			if (entity != null) {
				responseStr = EntityUtils.toString(entity, encode);
			}
			EntityUtils.consume(entity);
			return responseStr;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("远程调用失败");
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				if (httpPost != null) {
					httpPost.releaseConnection();
				}
				if (httpclient != null) {
					httpclient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * httpclient post请求
	 * 
	 * @param url
	 * @param encode
	 * @param requestBody
	 * @return
	 * @throws Exception
	 */
	public String post(String url, String encode, String requestBody) throws Exception {
		CloseableHttpClient httpclient = HttpClients.custom().build();

		HttpPost httpPost = new HttpPost(url);
		CloseableHttpResponse response = null;
		RequestConfig requestconfig = RequestConfig.custom().setSocketTimeout(1000 * 5).setConnectTimeout(1000 * 5).setCookieSpec(CookieSpecs.DEFAULT).build();
		httpPost.setConfig(requestconfig);
		try {
			httpPost.setEntity(new StringEntity(requestBody, encode));
			response = httpclient.execute(httpPost);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != HttpStatus.SC_OK) {
				throw new Exception("远程连接失败");
			}
			HttpEntity entity = response.getEntity();
			String responseStr = "";
			if (entity != null) {
				responseStr = EntityUtils.toString(entity, encode);
			}
			EntityUtils.consume(entity);
			return responseStr;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("远程调用失败");
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				if (httpPost != null) {
					httpPost.releaseConnection();
				}
				if (httpclient != null) {
					httpclient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * httpclient post请求
	 * 
	 * @param url
	 * @param encode
	 * @param requestBody
	 * @return
	 * @throws Exception
	 */
	public String jsonPost(String url, String encode, String requestBody) throws Exception {
		CloseableHttpClient httpclient = HttpClients.custom().build();
		HttpPost httpPost = new HttpPost(url);
		CloseableHttpResponse response = null;
		RequestConfig requestconfig = RequestConfig.custom().setSocketTimeout(1000 * 600).setConnectTimeout(1000 * 600).setCookieSpec(CookieSpecs.DEFAULT).build();
		httpPost.setConfig(requestconfig);
		httpPost.addHeader(HTTP.CONTENT_TYPE, "application/json");
		try {
			httpPost.setEntity(new StringEntity(requestBody, encode));
			response = httpclient.execute(httpPost);
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != HttpStatus.SC_OK) {
				throw new Exception("远程连接失败");
			}
			HttpEntity entity = response.getEntity();
			String responseStr = "";
			if (entity != null) {
				responseStr = EntityUtils.toString(entity, encode);
			}
			EntityUtils.consume(entity);
			return responseStr;
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("远程调用失败");
		} finally {
			try {
				if (response != null) {
					response.close();
				}
				if (httpPost != null) {
					httpPost.releaseConnection();
				}
				if (httpclient != null) {
					httpclient.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

}
