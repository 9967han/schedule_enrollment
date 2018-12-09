<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("utf-8");

    try
    {
    //int SID = Integer.parseInt(request.getParameter("SID"));
    String Stu_ID = request.getParameter("SID");
    String pwd = request.getParameter("pwd");
    String name = request.getParameter("name");
    //int grade = Integer.parseInt(request.getParameter("grade"));
    //int max_credit = Integer.parseInt(request.getParameter("max_credit"));
    String grade = request.getParameter("grade");
    String max_credit = request.getParameter("max_credit");

    Connection conn;
    Statement stmt;
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();
        String query = "Insert into student(SID, pwd, name, grade, max_credit) values("+Stu_ID+",'"+pwd+"','"+name+"',"+grade+","+max_credit+");";
        stmt.executeUpdate(query);

        response.sendRedirect("admin_register_student.jsp");
        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        %> <script> alert('잘못된 입력 형식 입니다.'); history.go(-1);</script><%
        out.println( ex.getMessage() );
    }
%>
