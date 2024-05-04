<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
    
<%	
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	
	Connection connection = null;
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	String url = "jdbc:mariadb://localhost:3306/jspdb";
	String user = "jsp";
	String password = "1111";
	connection = DriverManager.getConnection(url, user, password);
	
	String sql = "INSERT INTO login (id, name, pwd) VALUES(?, ?, ?)";
	PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
	preparedStatement.setString(1, id);
	preparedStatement.setString(2, name);
	preparedStatement.setString(3, pwd);
	int result = preparedStatement.executeUpdate();
	
	preparedStatement.close();
	connection.close();
	
	response.sendRedirect("list.jsp");
	
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
</body>
</html>
