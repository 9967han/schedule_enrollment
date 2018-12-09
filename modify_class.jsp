<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

    request.setCharacterEncoding("utf-8");
    
    String temp = request.getParameter("temp");
    //out.println(temp);
    String cname_original = temp.split(":")[0];
    String instructor_original = temp.split(":")[1];

	String cname = request.getParameter(temp+"cname");   //class name
    String instructor = request.getParameter(temp+"instructor");
    String max_student_temp = request.getParameter(temp+"max_student");  //to int
    int class_credit = Integer.parseInt(request.getParameter(temp+"class_credit")); //have to process (to int)
    int min_grade = Integer.parseInt(request.getParameter(temp+"min_grade"));   //to int
    int max_grade = Integer.parseInt(request.getParameter(temp+"max_grade"));   //to int
    String classroom = request.getParameter(temp+"classroom");   
    int day_1 = Integer.parseInt(request.getParameter(temp+"day_1"));
    String start_1 = request.getParameter(temp+"start_1");
    String end_1 = request.getParameter(temp+"end_1");
    int day_2 = Integer.parseInt(request.getParameter(temp+"day_2"));
    String start_2 = request.getParameter(temp+"start_2");
    String end_2 = request.getParameter(temp+"end_2");
    int max_student = -1;
    try{
    max_student = Integer.parseInt(max_student_temp);


    int c_time11 = day_1*10000 + Integer.parseInt(start_1.split(":")[0])*100 + Integer.parseInt(start_1.split(":")[1]);
    int c_time12 = day_1*10000 + Integer.parseInt(end_1.split(":")[0])*100 + Integer.parseInt(end_1.split(":")[1]);
    int c_time21 = day_2*10000 + Integer.parseInt(start_2.split(":")[0])*100 + Integer.parseInt(start_2.split(":")[1]);
    int c_time22 = day_2*10000 + Integer.parseInt(end_2.split(":")[0])*100 + Integer.parseInt(end_2.split(":")[1]);

    


    Connection conn;
    Statement stmt;
        try
        {
            Class.forName( "com.mysql.jdbc.Driver" );
            conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
            stmt = conn.createStatement();
            String query = "Update class SET cname='"+cname+"', instructor='"+instructor+"', classroom='"+classroom+"', class_credit='"+class_credit+"', min_grade='"+min_grade+"', max_grade='"+max_grade+"', max_student='"+max_student+"', c_time11='"+c_time11+"', c_time12='"+c_time12+"', c_time21='"+c_time21+"', c_time22='"+c_time22+"' WHERE cname='"+ cname_original+"' AND instructor='"+ instructor_original +"';";
            stmt.executeUpdate(query);

            response.sendRedirect("admin_modify_class.jsp");
            stmt.close();
            conn.close();
        }
        catch( Exception ex )
        {
            out.println( ex.getMessage() );
        }
    }
    catch(Exception ex){
        out.println( ex.getMessage() );
        %> <script> alert('잘못된 입력 형식 입니다.'); history.go(-1);</script><%
        //잘못된 입력 --> alert 추가하기
    }
    
%>
