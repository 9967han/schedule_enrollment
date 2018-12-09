<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("utf-8");

    //Integer.parseInt()
    String SID = session.getAttribute("SID").toString();
    String instructor = request.getParameter("instructor");
    String CNAME = request.getParameter("CNAME");
    Connection conn;
    Statement stmt;
    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();
        ResultSet rs;
        String command = "DELETE FROM wish WHERE SID="+SID+" and"+" CNAME="+"'"+CNAME+"'";
        stmt.executeUpdate(command);
        
        
          %>
           <script> alert("삭제되었습니다.");
                    location.replace("student_wishlist.jsp");
           </script> 
          <%
          stmt.close();
        conn.close();
          //response.sendRedirect("student_wishlist.jsp");
    }
    catch( Exception ex )
    {
        
        %>
           <script> alert("삭제 오류."); history.go(-1); </script> 
        <%
    }
%>
