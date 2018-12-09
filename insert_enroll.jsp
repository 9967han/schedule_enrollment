<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

    request.setCharacterEncoding("utf-8");

    //Integer.parseInt()
    String SID = session.getAttribute("SID").toString();
    String instructor = request.getParameter("instructor");
    String CNAME = request.getParameter("CNAME");
    int min_grade = Integer.valueOf(request.getParameter("min_grade"));
    int max_grade = Integer.valueOf(request.getParameter("max_grade"));
    int time_check11 = Integer.valueOf(request.getParameter("time_check11")); // 20900
    int time_check12 = Integer.valueOf(request.getParameter("time_check12"));
    int time_check21 = Integer.valueOf(request.getParameter("time_check21"));
    int time_check22 = Integer.valueOf(request.getParameter("time_check22"));
    int time_flag = 0;

    Connection conn;
    Statement stmt;
    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();
        ResultSet rs;

        rs = stmt.executeQuery("select * from student where SID ="+SID); // get student's Grade
        int grade=0;
        while(rs.next()){
            grade = Integer.valueOf(rs.getString("grade"));
        }


        rs = stmt.executeQuery("select * from enroll where SID ="+SID); //get student's enrolled classes
        List<String> cnameList= new ArrayList<String>(); 
        String db_class;
        while(rs.next()){
            db_class = rs.getString("CNAME");
            cnameList.add(db_class);
        }


        rs = stmt.executeQuery("select * from class"); //get student's enrolled classes time
        while(rs.next()){
            for(String classes : cnameList){
                if(classes.equals(rs.getString("CNAME"))){
                    int time11 = rs.getInt("c_time11");
                    int time12 = rs.getInt("c_time12");
                    int time21 = rs.getInt("c_time21");
                    int time22 = rs.getInt("c_time22");
                    out.println(time11);
                    out.println(time12);
                    out.println(time21);
                    out.println(time22);
                    out.println(time_check11);
                    out.println(time_check12);
                    out.println(time_check21);
                    out.println(time_check22);
                    out.println("OKK");
                    if((time11 < time_check11 && time_check11 < time12) || (time11 < time_check12 && time_check12 < time12) || (time21 < time_check11 && time_check11 < time22) || (time21 < time_check12 && time_check12 < time22) || (time11 < time_check21 && time_check21 < time12) || (time11 < time_check22 && time_check22 < time12) || (time21 < time_check21 && time_check21 < time22) || (time21 < time_check22 && time_check22 < time22)){
                        time_flag = 1;
                    } 
                }
            }   
        }

        rs = stmt.executeQuery("select * from class where CNAME ='"+CNAME+"'");
        int available=0, max_student=0;
        while(rs.next()){
        available = Integer.valueOf(rs.getString("available"));
        max_student = Integer.valueOf(rs.getString("max_student"));   
        }
        if(max_student > available){
            if(min_grade <= grade && max_grade >= grade && time_flag == 0){
                String command = "INSERT INTO enroll (SID, CNAME, instructor) VALUES ("+SID+",'"+CNAME+"','"+instructor+"')";
                stmt.executeUpdate(command);
                available+=1;
                command = "UPDATE class SET available = "+available+"  where CNAME = '"+CNAME+"'";
                stmt.executeUpdate(command);
                stmt.close();
                conn.close();
                %>
                <script> alert("수강신청 되었습니다"); location.replace("student_sugang.jsp"); </script> 
                <%
            }else if(min_grade <= grade && max_grade >= grade && time_flag == 1){
                stmt.close();
                conn.close();
                %>
                <script> alert("수강신청 시간을 확인하세요"); location.replace("student_sugang.jsp"); </script> 
                <%
            }else{
                stmt.close();
                conn.close();
                %>
                <script> alert("수강신청 가능 학년을 확인하세요"); location.replace("student_sugang.jsp"); </script> 
                <%
            }
        }
        else{
            %>
           <script> alert("수강신청 인원이 초과되었습니다"); location.replace("student_sugang.jsp"); </script> 
            <%
        }
    }
    catch( Exception ex )
    {
        
        %>
           <script> alert("이미 수강신청된 과목입니다"); location.replace("student_sugang.jsp"); </script> 
        <%
    }
%>
