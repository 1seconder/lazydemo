package com.newenv.communityFocus.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author chan helix
 * 
 */
public class DateUtils {
	/**
	 * 将calendar转换成字符串格式
	 * 
	 * @param cal
	 * @return 2009-2-12
	 */
	public static String getTimeStr(Calendar cal) {
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		return sdf.format(cal.getTime());
	}
	
	public static String getTimeStr(Timestamp ts) {
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		if(ts != null){
			return sdf.format(ts.getTime());
		}
		return "";
	}

	/**
	 * 根据指定的格式得到当前日期
	 * 
	 * @param strFormat
	 * @return 2008-12-2
	 */
	public static String getCurrentDateTime(String strFormat) {
		String strReturn = "";
		try {
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					strFormat);
			java.util.Calendar cldr = java.util.Calendar.getInstance();
			strReturn = sdf.format(cldr.getTime());
		} catch (Exception ex) {
		}
		return strReturn;
	}

	/**
	 * 根据默认的格式（yyyy-MM-dd HH:mm:ss）得到当前日期
	 * 
	 * @return 2008-12-2 12:22:22
	 */
	public static String getCurrentDateTime() {
		String strFormat = "yyyy-MM-dd HH:mm:ss";
		return getCurrentDateTime(strFormat);
	}

	/**
	 * 根据格式(yyyy-MM-dd)得到当前日期
	 * 
	 * @return 2008-12-2
	 */
	public static String getCurrentDate() {
		String strReturn = "";
		try {
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"yyyy年MM月dd日");
			java.util.Calendar cldr = java.util.Calendar.getInstance();
			strReturn = sdf.format(cldr.getTime());
		} catch (Exception ex) {
		}
		return strReturn;
	}

	/**
	 * 根据格式(HH:mm)得到当前时间
	 * 
	 * @return 2008-12-2
	 */
	public static String getCurrentTime() {
		String strReturn = "";
		try {
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
					"HH:mm");
			java.util.Calendar cldr = java.util.Calendar.getInstance();
			strReturn = sdf.format(cldr.getTime());
		} catch (Exception ex) {
		}
		return strReturn;
	}
	
	/**
	 * 根据格式(yyyy-MM-dd HH:mm:ss)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 2008-12-2
	 */
	public static String getDateStr4(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}

	/**
	 * 根据格式(yyyy-MM-dd)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 2008-12-2
	 */
	public static String getDateStr(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}

	public static String getDateStr2(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.format(date);
	}
	
	public static String getDateStr3(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		return format.format(date);
	}

	/**
	 * 根据格式(yyyy年MM月)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 2008-12-2
	 */
	public static String getDateStrYMR(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		return format.format(date);
	}
	
	public static Date parseDateStrYMD(String s) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		return format.parse(s);
	}

	/**
	 * 根据格式(yyyy年MM月dd日)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 2008-12-2
	 */
	public static String getDateStrC(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日");
		return format.format(date);
	}

	/**
	 * 根据格式(yyyyMMddhhmmss)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 20081202110000
	 */
	public static String getDateStrNowTime(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddhhmmss");
		return format.format(date);
	}

	/**
	 * 根据格式(yyyy-MM-dd HH:mm:ss)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 2008-12-2
	 */
	public static String getDateTimeStr(Date date) {
		if (date != null) {
			SimpleDateFormat format = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			return format.format(date);
		} else
			return "";

	}

	/**
	 * 根据格式(yyyy年MM月dd日 HH时mm分ss秒)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 2008-12-2
	 */
	public static String getDateTimeStrC(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
		return format.format(date);
	}

	public static Calendar getDateByMonth(Calendar cal, int month) {
		cal.add(Calendar.MONTH, +month);
		return cal;
	}

	/**
	 * 根据开始时间和月份判断时间
	 * 
	 * @param startDate
	 * @param month
	 * @return 2008-12-2
	 */
	public static boolean compareDate(Date startDate, int month) {
		Date currentDate = new Date();
		if (currentDate.before(startDate))
			return false;
		else {
			int mon = (int) ((currentDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000 * 30));
			if (month < mon)
				return false;
			return true;
		}
	}

	/**
	 * 根据字符串转换成日期对象
	 * 
	 * @param s
	 * @return
	 * @throws ParseException
	 *             2008-12-9
	 */
	public static Date parseDate(String s) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.parse(s);
	}


	public static Date parseDateTime(String s) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.parse(s);
	}
	public static Date parseDateTime1(String s) throws ParseException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
		return format.parse(s);
	}
	
	

	/**
	 * 得到当前月份的第一天
	 * 
	 * @return
	 * @throws ParseException
	 */
	public static Date getFirstDayOfMonth() throws ParseException {
		Calendar gc = Calendar.getInstance();
		gc.setTime(new Date());
		gc.set(Calendar.DAY_OF_MONTH, 1);
		return gc.getTime();
	}

	public static int getMonth(Date date) {
		Calendar gc = Calendar.getInstance();
		gc.setTime(date);
		return gc.get(Calendar.MONTH) + 1;
	}

	public static Date getFirstDayOfMonth(Date date) throws ParseException {
		Calendar gc = Calendar.getInstance();
		gc.setTime(date);
		gc.set(Calendar.DAY_OF_MONTH, 1);
		return gc.getTime();
	}

	/**
	 * 得到当前月份的最后一天
	 * 
	 * @return
	 * @throws ParseException
	 */
	public static Date getLastDayOfMonth() throws ParseException {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, 1);
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}
	
	public static Date getLastDayOfMonth(Date date) throws ParseException {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, 1);
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.DATE, -1);
		return cal.getTime();
	}
	
	/**
	 * 得到每月有多少天
	 *   
	 * <b>日期:</b>2012-9-12-下午12:04:15<br/>  
	 * <b>author:</b>yanghui@cotel.com.cn<br/>
	 * @return
	 * @throws ParseException
	 */
	public static int getDaysOfMonth()throws ParseException{
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, 1);
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.DATE, -1);
		return cal.get(cal.DAY_OF_MONTH);
	}
	
	public static int getCountDaysOfMonth(Date date)throws ParseException{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, 1);
		cal.set(Calendar.DATE, 1);
		cal.add(Calendar.DATE, -1);
		return cal.get(cal.DAY_OF_MONTH);
	}
	
	public static int getDaysOfMonth(Date date)throws ParseException{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
//		cal.add(Calendar.MONTH, 1);
//		cal.set(Calendar.DATE, 1);
//		cal.add(Calendar.DATE, -1);
		return cal.get(cal.DAY_OF_MONTH);
	}
	
	public static int getDaysOfWeek(Date date)throws ParseException{
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		return cal.get(cal.DAY_OF_WEEK);
	}

	/**
	 * 得到当前月本周的第一天
	 */
	public static Date getFirstDayOfWeek() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.DAY_OF_WEEK, 1);
		return c.getTime();
	}

	/**
	 * 得到本周第一个工作日
	 * 
	 * @return
	 */
	public static Date getFirstWorkDayOfWeek() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.DAY_OF_WEEK, 2);
		return c.getTime();
	}

	public static Date getLastWorkDayOfWeek() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.DAY_OF_WEEK, 6);
		return c.getTime();
	}

	public static Date getFirstWorkDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_WEEK, 2);
		return c.getTime();
	}

	public static Date getLastWorkDayOfWeek(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DAY_OF_WEEK, 6);
		return c.getTime();
	}

	/**
	 * 得到当前月本周的最后一天
	 */
	public static Date getLastDayOfWeek() {
		Calendar c = Calendar.getInstance();
		c.setTime(new Date());
		c.set(Calendar.DAY_OF_WEEK, 7);
		return c.getTime();
	}

	public static Date getMinBefore(int min) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MINUTE, -min);
		return cal.getTime();
	}

	public static Date getMonthBefore(Date date, int month) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, -month);
		return cal.getTime();
	}

	public static Date getDayAfter(Date date, int day) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DATE, day);
		return cal.getTime();
	}
	
	public static Date getTimeAfter(Date date, int min) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.SECOND, min*60);
		return cal.getTime();
	}

	/**
	 * 得到某年某月的第一天
	 * 
	 * @param year
	 * @param month
	 * @return
	 * @throws ParseException
	 */
	public static Date getFirstDayByYM(int year, int month)
			throws ParseException {
		Calendar gc = Calendar.getInstance();
		// gc.setTime(new Date());
		gc.set(Calendar.YEAR, year);
		gc.set(Calendar.MONTH, month);
		gc.set(Calendar.DATE, 1);
		return gc.getTime();
	}

	public static Date getFirstTimeOfDate(Date date) {
		Calendar gc = Calendar.getInstance();
		gc.setTime(date);
		gc.set(Calendar.HOUR, 0);
		gc.set(Calendar.MINUTE, 0);
		gc.set(Calendar.SECOND, 0);
		gc.set(Calendar.MILLISECOND, 0);
		return gc.getTime();
	}

	public static Date getLastTimeOfDate(Date date) {
		Calendar gc = Calendar.getInstance();
		gc.setTime(date);

		gc.set(Calendar.HOUR, 0);
		gc.set(Calendar.MINUTE, 0);
		gc.set(Calendar.SECOND, 0);
		gc.set(Calendar.MILLISECOND, 0);
		gc.add(Calendar.DATE, 1);
		return gc.getTime();
	}

	/**
	 * 得到某年某月的最后一天
	 * 
	 * @param year
	 * @param month
	 * @return
	 * @throws ParseException
	 */
	public static Date getLastDayByYM(int year, int month)
			throws ParseException {
		Calendar gc = Calendar.getInstance();
		// gc.setTime(new Date());
		gc.set(Calendar.YEAR, year);
		gc.set(Calendar.MONTH, month);
		gc.add(Calendar.MONTH, 1);
		gc.set(Calendar.DAY_OF_MONTH, 1);
		gc.add(Calendar.DAY_OF_MONTH, -1);
		return gc.getTime();
	}

	/**
	 * 得到某年的第一天
	 */
	public static Date getFirstDayByY(int year) {
		Calendar gc = Calendar.getInstance();
		gc.set(Calendar.YEAR, year);
		gc.set(Calendar.DAY_OF_YEAR, 1);
		return gc.getTime();
	}

	/**
	 * 得到某年的最后一天
	 */
	public static Date getLastDayByY(int year) {
		Calendar gc = Calendar.getInstance();
		gc.set(Calendar.YEAR, year);
		gc.add(Calendar.YEAR, 1);
		gc.set(Calendar.DAY_OF_YEAR, 1);
		gc.add(Calendar.DAY_OF_YEAR, -1);
		return gc.getTime();
	}
	
	/**
	 * 得到当前年的前一年
	 */
	public static int getqianYeay() {
		Calendar gc=Calendar.getInstance();
		return gc.get(Calendar.YEAR)-1;
	}
	
	/**
	 * 得到当前年
	 */
	public static int getYeay() {
		Calendar gc=Calendar.getInstance();
		return gc.get(Calendar.YEAR);
	}
	
	
	/**
	 * 根据格式(yyyyMMdd)从日期对象得到日期字符串
	 * 
	 * @param date
	 * @return 20081202110000
	 */
	public static String getDateStrNow(Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
		return format.format(date);
	}


}
