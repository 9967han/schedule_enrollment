<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("utf-8");
    
    String temp = request.getParameter("temp");
    //out.println(temp);
    String cname = temp.split(":")[0];
    String instructor = temp.split(":")[1];

    Connection conn;
    Statement stmt;
    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();
        String query = "delete from class where cname='"+cname+"' and instructor='"+ instructor +"' limit 1;";

        stmt.executeUpdate(query);

        response.sendRedirect("admin_modify_class.jsp");
        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
