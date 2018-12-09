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
      text-align: center;
      font-size: 15px;
  }

  th, td {
      text-align: center;
      width:15%;
      padding: 0px;
      height: 15px;
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
      // todo: Get class from database
      // Example input --> change this part later
      var class_name = "알고리즘개론";
      var day = "1"; // 1: Mon, 2: Tue, 3: Wed, 4: Thu, 5: Fri
      var start_time = "9:00";
      var end_time = "10:15";
      // Update above four parameters for each class
      var table = document.getElementById("sugang_time_table");
      var start_hour = start_time.split(":")[0];
      var start_min = start_time.split(":")[1];
      var end_hour = end_time.split(":")[0];
      var end_min = end_time.split(":")[1]
      var start_row_num = (start_hour - 9) * 4 + 1 + start_min / 15;
      var end_row_num = (end_hour - 9) * 4 + 1 + end_min / 15;
      for(var i = start_row_num; i < end_row_num; i++){
          table.rows[i].cells[parseInt(day)].style.background = "red";
          table.rows[Math.ceil((end_row_num-start_row_num)/2)].cells[parseInt(day)].innerHTML = class_name;
      }

  }

  function initialize() {
      //add_class();
  }

</script>

</head>
<body onload="initialize()">

  <div class="topnav">
    <a href="student_sugang.jsp">수강신청</a>
    <a href="student_wishlist.jsp">Wish List</a>
    <a href="student_set.jsp">수강신청내역</a>
    <a class="active" href="student_time_table.jsp">시간표</a>
    <a href="login.jsp">로그아웃</a>
  </div>

  <div style="overflow-x:auto;">
    <table id="sugang_time_table">
      <col width="80">
      <tr>
        <th></th>
        <th>월</th>
        <th>화</th>
        <th>수</th>
        <th>목</th>
        <th>금</th>
      </tr>
      <tr><td>9:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>10:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>11:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>12:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>13:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>14:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>15:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>16:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>17:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>18:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>19:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>20:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>21:00</td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
      <tr><td>22:00</td><td></td><td></td><td></td><td></td><td></td></tr>
    </table>

</body>
</html>
    <% 
    Connection conn; 
    Statement stmt;
    int cnt=0;
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

                    int c_time11 = rs.getInt("c_time11"); //20900
                    int c_time12 = rs.getInt("c_time12"); //21015
                    int c_time21 = rs.getInt("c_time21");
                    int c_time22 = rs.getInt("c_time22");

                    int day_1 = c_time11/10000;
                    int day_2 = c_time21/10000;
                    c_time11 = c_time11 - day_1*10000;
                    c_time12 = c_time12 - day_1*10000;
                    c_time21 = c_time21 - day_2*10000;
                    c_time22 = c_time22 - day_2*10000;
          
                    int hour_11 = 4*(c_time11 / 100 - 9);
                    int hour_12 = 4*(c_time12 / 100 - 9);
                    int hour_21 = 4*(c_time21 / 100 - 9);
                    int hour_22 = 4*(c_time22 / 100 - 9);
                    int m_11 = (c_time11 % 100) / 15;
                    int m_12 = (c_time12 % 100) / 15;
                    int m_21 = (c_time21 % 100) / 15;
                    int m_22 = (c_time22 % 100) / 15;
                    int r11 = hour_11 + m_11+1;
                    int r12 = hour_12 + m_12+1;
                    int r21 = hour_21 + m_21+1;
                    int r22 = hour_22 + m_22+1;
                    int c1 = day_1;
                    int c2 = day_2;
                    List<String> colorList= new ArrayList<String>();
                    colorList.add("RED");
                    colorList.add("RoyalBlue");
                    colorList.add("PaleGreen");
                    colorList.add("SandyBrown");
                    colorList.add("SpringGreen");
                    colorList.add("SlateBlue");
                    colorList.add("Violet");
                    colorList.add("YellowGreen");
                    colorList.add("Tomato");
                    colorList.add("MediumPurple");
                    colorList.add("DodgerBlue");
                  for(String cname: cnameList){
                    if(cname.equals(CNAME)){
                        out.println(CNAME);
                        out.println(c1);
                        out.println(r11);
                      %>
                      <script>
                        var colorList = ["RED", "RoyalBlue", "SpringGreen", "PaleGreen", "SandyBrown","SlateBlue", "Violet","YellowGreen","Tomato","MediumPurple","DodgerBlue"];
                        var table = document.getElementById("sugang_time_table");
                        //alert(table.rows[0].cells[0]);
                        //alert(<%=r11%>);
                        for(var i=<%=r11%>;i<<%=r12%>;i++){
                          var cell = table.rows[i].cells[<%=c1%>];
                          if( i == parseInt((<%=r11%> + <%=r12%>)/2)){
                            cell.innerHTML = "<%=CNAME%>";
                          }
                          cell.bgColor = colorList[<%=cnt%>];
                        }
                        for(var i=<%=r21%>;i<<%=r22%>;i++){
                          var cell = table.rows[i].cells[<%=c2%>];
                          if( i == parseInt((<%=r21%> + <%=r22%>)/2)){
                            cell.innerHTML = "<%=CNAME%>";
                          }
                          cell.bgColor = colorList[<%=cnt%>];
                         }
                      </script>
                      <%
                      cnt = cnt + 1;
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