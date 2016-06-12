<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.newenv.communityFocus.domain.GuestProfile"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>file upload example</title>
</head>
<body>
	<a>age:</a>
	<a><%=((GuestProfile)request.getAttribute("testAttr")).getAge() %></a>
	<a>ApplicationNo:</a>
	<a><%=((GuestProfile)request.getAttribute("testAttr")).getApplicationNo() %></a>
	<a>GuestName:</a>
	<a><%=((GuestProfile)request.getAttribute("testAttr")).getGuestName() %></a><br>
	
	<a>jstl:</a><br>
	<a>age:</a>
	<a>${testAttr.age}</a>
	<a>ApplicationNo:</a>
	<a>${testAttr.applicationNo}</a>
	<a>GuestName:</a>
	<a>${testAttr.guestName}</a>
	
	 <form method="POST" enctype="multipart/form-data"
              action="/services/fileService/file">
            File to upload: <input type="file" name="upfile"><br/>
            File name: <input type="text" name="fileName"><br/>
            <br/>
            <input type="submit" value="Upload File"> to upload the file!
     </form>
</body>
</html>