package com.newenv.communityFocus.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.ws.rs.core.Response;

/**
 * @author Chan Helix
 * @Date 2016.03.09
 *
 */
public class StringUtils {
    /**
    *正则
    */
    public static String replaceBlank(String str) {
        String dest = "";
        if (str!=null) {
            Pattern p = Pattern.compile("\\s*|\t|\r|\n");
            Matcher m = p.matcher(str);
            dest = m.replaceAll("");
        }
        return dest;
    }
//    public static void main(String[] args) {
//        System.out.println(StringUtils.replaceBlank("just do it!"));
//    }
    public static String equeasParams(Object obj)
	{
		String object = String.valueOf(obj);
		if(object.equals("") || object == null || object.equals("null") || object.equals("Null"))
		{
			return "";
		}
		return object;
	}
    
    public static boolean notEmpty(String s)
    {
        return ((s != null) && (s.length() > 0));
    }
    
    public static boolean isEmpty(String s)
    {
        return ((s == null) || (s.length() <= 0)|| (s == ""));
    }
    
    public static boolean isParticular(String str)
    {
//		String str = "你好大家、";
		String regEx = "[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。°，、？]";
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		return m.find();
    }
}