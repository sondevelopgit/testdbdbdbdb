<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
값을 가져와보겠음 <br><br>
<%
	Statement stm = null;
	ResultSet rs = null;
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://172.30.1.14/test";
	url += "?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT&autoReconnect=true&useSSL=false";
    //url += "?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";W
	
	Connection conn = DriverManager.getConnection(url, "popl", "password");
	try {
        	stm = conn.createStatement();
        	if(stm.execute("select * from test")) {
                	rs = stm.getResultSet();
        }
        while(rs.next()) {
                out.println(rs.getString("num"));
                out.println(rs.getString("name"));
                out.write("<br>");
        }
        rs.close();
        stm.close();
}
catch(Exception e) {
        out.println("rs.next() ERROR");
}
conn.close();
%>

</body>
</html>
