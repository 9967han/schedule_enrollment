<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  table {
      border-collapse: collapse;
      border-spacing: 0;
      width: 100%;
      border: 1px solid #ddd;
  }

  th, td {
      text-align: left;
      padding: 8px;
  }

  tr:nth-child(even){background-color: #f2f2f2}

  .topnav {
    overflow: hidden;
    background-color: #333;
    margin-bottom: 20px;
  }

  .topnav a {
    float: left;
    color: #f2f2f2;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    font-size: 17px;
  }

  .topnav a:hover {
    background-color: #ddd;
    color: black;
  }

  .topnav a.active {
    background-color: #4CAF50;
    color: white;
  }
</style>

<script>
  function add_class() {
      var table = document.getElementById("sugang_set_table");
      var num_row = table.rows.length;
      var row = table.insertRow(num_row);
      // todo: Get class from database
      // Example input --> change this part later
      var cell_arr = ['<button onclick="delete_class(this)">삭제</button>',"소프트웨어실습4",2,35,40,"2-4학년","정윤경","[화]18:00~21:45"];
      for(var i = 0; i < 8; i++){
        var cell = row.insertCell(i);
        cell.innerHTML = cell_arr[i];
      }
      total_credit();
  }

  function delete_class(btn) {
      var row_num = btn.parentNode.parentNode.rowIndex;
      var table = document.getElementById("sugang_set_table");
      table.deleteRow(row_num);
      total_credit();
  }

  function total_credit() {
      var table = document.getElementById("sugang_set_table");
      var sum_credit = 0;
      for(var i = 1; i < table.rows.length; i++){
        var credit = parseInt(table.rows[i].cells[2].innerHTML);
        sum_credit += credit;
      }
      document.getElementById("total_credit").innerHTML = '총 ' + sum_credit.toString() + ' 학점';
  }

  function initialize() {
      // todo: Get class from database
      total_credit();
  }

</script>

</head>
<body onload="initialize()">

  <div class="topnav">
    <a href="student_sugang.jsp">수강신청</a>
    <a href="student_wishlist.jsp">Wish List</a>
    <a class="active" href="student_set.jsp">수강신청내역</a>
    <a href="student_time_table.jsp">시간표</a>
    <a href="login.jsp">로그아웃</a>
  </div>

  <div id="total_credit"></div>
  <br>

  <div style="overflow-x:auto;">
    <table id="sugang_set_table">
      <tr>
        <th>삭제</th>
        <th>교과목명</th>
        <th>학점</th>
        <th>신청인원</th>
        <th>허용인원</th>
        <th>학년</th>
        <th>교강사</th>
        <th>수업시간</th>
      </tr>
    </table>


</div>

</body>
</html>
  <% 
    Connection conn; 
    Statement stmt;
    try
    {
        Class.forName( "com.mysql.jdbc.Driver" );
        conn = DriverManager.getConnection( "jdbc:mysql://localhost/sugang_db?characterEncoding=UTF-8&serverTimezone=UTC", "root", "root1234" );
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from enroll");
        
        String currentSID = (String) session.getAttribute("SID"); // current session ID
        out.println("SID: "+currentSID);
         List<String> cnameList= new ArrayList<String>();
          while(rs.next()){
                    String CNAME = rs.getString("CNAME");
                    String SID = rs.getString("SID");
                    if(currentSID.equals(SID)){
                      cnameList.add(CNAME);
                    }                    
              }
              rs = stmt.executeQuery("select * from class");
              while(rs.next()){
                    String CNAME = rs.getString("CNAME");
                    String instructor = rs.getString("instructor");
                    String classroom = rs.getString("classroom");
                    String available = rs.getString("available");
                    String class_credit = rs.getString("class_credit");
                    String min_grade = rs.getString("min_grade");
                    String max_grade = rs.getString("max_grade");
                    String max_student = rs.getString("max_student");

                    int c_time11 = rs.getInt("c_time11");
                    int c_time12 = rs.getInt("c_time12");
                    int c_time21 = rs.getInt("c_time21");
                    int c_time22 = rs.getInt("c_time22");

                    int day_1 = c_time11/10000;
                    int day_2 = c_time21/10000;
                    c_time11 = c_time11 - day_1*10000;
                    c_time12 = c_time12 - day_1*10000;
                    c_time21 = c_time21 - day_2*10000;
                    c_time22 = c_time22 - day_2*10000;
                    String b11 = Integer.toString(c_time11%100);
                    String b12 = Integer.toString(c_time12%100);
                    String b21 = Integer.toString(c_time21%100);
                    String b22 = Integer.toString(c_time22%100);
                    if(b11.equals("0"))
                      b11 = "0"+b11;
                    if(b12.equals("0"))
                      b12 = "0"+b12;
                    if(b21.equals("0"))
                      b21 = "0"+b21;
                    if(b22.equals("0"))
                      b22 = "0"+b22;


                    String day_1_string = "";
                    String day_2_string = "";
                    if(day_1 == 1)
                      day_1_string = "월";
                    else if(day_1 == 2)
                      day_1_string = "화";
                    else if(day_1 == 3)
                      day_1_string = "수";
                    else if(day_1 == 4)
                      day_1_string = "목";
                    else if(day_1 == 5)
                      day_1_string = "금";

                    if(day_2 == 1)
                      day_2_string = "월";
                    else if(day_2 == 2)
                      day_2_string = "화";
                    else if(day_2 == 3)
                      day_2_string = "수";
                    else if(day_2 == 4)
                      day_2_string = "목";
                    else if(day_2 == 5)
                      day_2_string = "금";

                  for(String cname: cnameList){
                    if(cname.equals(CNAME)){
                      %>
                      <script>
                        var table = document.getElementById("sugang_set_table");
                        var row = table.insertRow(table.rows.length);
                        row.insertCell(0).innerHTML = '<form action= "delete_enroll.jsp">' +
    '<input type="hidden" name="CNAME" value='+"'<%=CNAME%>'"+'</input>'+'<input type="hidden" name="instructor" value='+"'<%=instructor%>'"+'</input>' +'<button>삭제</button></form>';
                        row.insertCell(1).innerHTML = "<%=CNAME%>";
                        row.insertCell(2).innerHTML = "<%=class_credit%>";
                        row.insertCell(3).innerHTML = "<%=available%>";
                        row.insertCell(4).innerHTML = "<%=max_student%>";
                        row.insertCell(5).innerHTML = "<%=min_grade%>"+"-"+"<%=max_grade%>"+"학년";
                        row.insertCell(6).innerHTML = "<%=instructor%>";
                        row.insertCell(7).innerHTML = "<%=day_1_string%> <%=c_time11/100%>:<%=b11%>~<%=c_time12/100%>:<%=b12%><br><%=day_2_string%> <%=c_time21/100%>:<%=b21%>~<%=c_time22/100%>:<%=b22%>";
                      </script>
                      <%
                    }
                  }              
              }
        stmt.close();
        conn.close();
    } catch( Exception ex )
    {
        out.println( ex.getMessage() );
    }
    
%>