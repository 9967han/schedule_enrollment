<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("utf-8");

    String userID = request.getParameter("uname");
    String userPW = request.getParameter("psw");
    String checkAdmin = request.getParameter("admin");
    String checkStuent = request.getParameter("student");
    boolean is_student = false;

    if(checkAdmin != null){
        
    } else if(checkStuent != null){
        is_student = true;
    } else{
        response.sendRedirect("login.html");
    }

    Connection conn;
    Statement stmt;
    boolean found = false;

    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();

        ResultSet rs;
        if(is_student == true)
            rs = stmt.executeQuery("select * from student");
        else if(is_student == false)
            rs = stmt.executeQuery("select * from admins");//admin <=> admins 이름 조심
        else
            rs = stmt.executeQuery("select * from student");

        while(rs.next()){
            if(is_student == true){
                if(rs.getString("SID").equals(userID) && rs.getString("pwd").equals(userPW)){
                    //out.println(rs.getString("SID"));
                    session.setAttribute("SID", rs.getString("SID"));
                    session.setAttribute("name", rs.getString("name"));
                    session.setAttribute("grade", rs.getString("grade"));
                    session.setAttribute("max_credit", rs.getString("max_credit"));
                    found = true;
                    break;
                };
            }else{
                if(rs.getString("AID").equals(userID) && rs.getString("pwd").equals(userPW)){
                    session.setAttribute("AID", rs.getString("AID"));
                    found = true;
                    break;
                }

            }
        }
        if(found){
            if(is_student){
                response.sendRedirect("student_sugang.jsp");  
            }else{
                response.sendRedirect("admin_register_student.jsp");
            }
        }
        else{
          %> <script> alert("로그인에 실패하였습니다"); history.go(-1); </script> <%
        }

        stmt.close();
        conn.close();
    }
    catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
%>
