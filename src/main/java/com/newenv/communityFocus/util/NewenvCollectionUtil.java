package com.newenv.communityFocus.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class NewenvCollectionUtil {
	public static List getSortedList(Collection c){
		List ts = new ArrayList();
		ts.addAll(c);
		return ts;
	}
	
	public static String md5Encode(String clearText){
		try{
	    	MessageDigest md = MessageDigest.getInstance("MD5"); 
	    	md.update(clearText.getBytes()); 
	    	byte b[] = md.digest(); 
	
	    	int i; 
	
	    	StringBuffer buf = new StringBuffer(""); 
	    	for (int offset = 0; offset < b.length; offset++) { 
	    	i = b[offset]; 
	    	if(i<0) i+= 256; 
	    	if(i<16) 
	    	buf.append("0"); 
	    	buf.append(Integer.toHexString(i)); 
	    	} 
	    	
	    	return buf.toString();
	
	    	} catch (NoSuchAlgorithmException e) { 
	    	return null;
	    	} 
	}
	
//	public static void main(String[] args){
//		System.out.println(md5Encode("xhj88888"));
//	}
}
