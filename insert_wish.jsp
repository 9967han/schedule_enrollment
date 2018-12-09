<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%

    request.setCharacterEncoding("utf-8");

    //Integer.parseInt()
    String SID = session.getAttribute("SID").toString();
    String instructor = request.getParameter("instructor");
    String CNAME = request.getParameter("CNAME");
    String class_credit = request.getParameter("class_credit");
    Connection conn;
    Statement stmt;
    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();
        ResultSet rs;

        rs = stmt.executeQuery("select * from wish where SID ="+SID); // get the cnames from wish table
        List<String> cnameList= new ArrayList<String>();
        while(rs.next()){
            String db_cname = rs.getString("CNAME");
            String db_SID = rs.getString("SID");
            if(SID.equals(db_SID)){
                cnameList.add(db_cname);
            }                    
        }
        int wish_credit=0;
        for(String list_CNAME: cnameList){ // get the current wish list credit
            rs = stmt.executeQuery("select * from class where CNAME ='"+list_CNAME+"'");
            while(rs.next()){
                wish_credit+=Integer.valueOf(rs.getString("class_credit"));
            }
        }

        if(wish_credit + Integer.valueOf(class_credit) <= 27){
            String command = "INSERT INTO wish (SID, CNAME, instructor) VALUES ("+SID+",'"+CNAME+"','"+instructor+"')";
            stmt.executeUpdate(command);
        
            stmt.close();
            conn.close();
            %>
            <script> alert("Wish리스트에 추가되었습니다!"); location.replace("student_sugang.jsp"); </script> 
            <%
        }else{
            stmt.close();
            conn.close();
            %>
            <script> alert("Wish리스트는 최대 27학점까지 가능합니다"); location.replace("student_sugang.jsp"); </script> 
            <%
        }
    }
    catch( Exception ex )
    {
        
        %>
           <script> alert("이미 wishList에 추가된 과목입니다!"); location.replace("student_sugang.jsp"); </script> 
        <%
    }
%>
