<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      text-align: center;
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

  function modify_class(btn) {

  }

  function delete_class(btn) {
      // todo: Delete the class from database --> update for every student as well
      var row_num = btn.parentNode.parentNode.rowIndex;
      var table = document.getElementById("sugang_wish_table");
      table.deleteRow(row_num);
      total_credit();
  }

  function initialize() {
      // todo: Load class information from database.
  }


</script>


</head>
<body onload="initialize()">

  <div class="topnav">
    <a href="admin_register_student.jsp">학생 등록</a>
    <a href="admin_register_class.jsp">수업 등록</a>
    <a class="active" href="admin_modify_class.jsp">수업 수정</a>
    <a href="admin_class_list.jsp">수업 목록</a>
    <a href="admin_class_search.jsp">수업 검색</a>
    <a href="login.html">로그아웃</a>
  </div>
    <div style="overflow-x:auto;">
      <form action="modify_class.jsp" method="post">
      <table id="class_table">
        <tr contenteditable="false">
          <th >수업 삭제</th>
          <th>수업 수정</th>
          <th>교과목명</th>
          <th>교강사</th>
          <th>강의실</th>
          <th>허용인원</th>
          <th>학점</th>
          <th>학년</th>
          <th>수업시간</th>
        </tr>
      </table>
    </form>
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

              ResultSet rs = stmt.executeQuery("select * from class");
                  int i = 1;

              while(rs.next()){
                    //out.println(rs.getString("SID"));
                    String cname = rs.getString("cname");
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
                    //out.println(classroom);
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

                    int temp_min = Integer.parseInt(min_grade)-1;
                    int temp_max = Integer.parseInt(max_grade)-1;

                    int hour_11 = 4*(c_time11 / 100 - 9);
                    int hour_12 = 4*(c_time12 / 100 - 9);
                    int hour_21 = 4*(c_time21 / 100 - 9);
                    int hour_22 = 4*(c_time22 / 100 - 9);
                    int m_11 = (c_time11 % 100) / 15;
                    int m_12 = (c_time12 % 100) / 15;
                    int m_21 = (c_time21 % 100) / 15;
                    int m_22 = (c_time22 % 100) / 15;
                    int t11 = hour_11 + m_11 + 1;
                    int t12 = hour_12 + m_12 + 1;
                    int t21 = hour_21 + m_21 + 1;
                    int t22 = hour_22 + m_22 + 1;
                      %>
                    
                    <script>
                  
                          var table = document.getElementById("class_table");
                          var row = table.insertRow(table.rows.length);

                          row.insertCell(0).innerHTML = '<button name="temp" value="<%=cname%>:<%=instructor%>" formaction="delete_class.jsp">삭제</button>';
                          row.insertCell(1).innerHTML = '<button name="temp" value="<%=cname%>:<%=instructor%>" type="submit">수정</button>';
                          row.insertCell(2).innerHTML = '<input type="text" name="<%=cname%>:<%=instructor%>cname" size="10" value="<%=cname%>">';
                          row.insertCell(3).innerHTML = '<input type="text" name="<%=cname%>:<%=instructor%>instructor" size="5" value="<%=instructor%>">';
                          row.insertCell(4).innerHTML = '<input type="text" name="<%=cname%>:<%=instructor%>classroom" size="5" value="<%=classroom%>">';
                          row.insertCell(5).innerHTML = '<input type="text" name="<%=cname%>:<%=instructor%>max_student" size="3" value="<%=max_student%>">';
                          row.insertCell(6).innerHTML = '<input type="text" id="class_credit" name="<%=cname%>:<%=instructor%>class_credit" size="3" value="<%=class_credit%>">';
                          //row.insertCell(7).innerHTML = "<%=min_grade%>~<%=max_grade%>";
                          row.insertCell(7).innerHTML = '<select id="<%=cname%>:<%=instructor%>:class_grade_1" name="<%=cname%>:<%=instructor%>min_grade"> <option value="1">1학년</option> <option value="2">2학년</option> <option value="3">3학년</option> <option value="4">4학년</option> </select> ~ <select id="<%=cname%>:<%=instructor%>:class_grade_2" name="<%=cname%>:<%=instructor%>max_grade"> <option value="1">1학년</option> <option value="2">2학년</option> <option value="3">3학년</option> <option value="4">4학년</option> </select>';
                          row.insertCell(8).innerHTML = '<select id="<%=cname%>:<%=instructor%>:day_1" name="<%=cname%>:<%=instructor%>day_1"> <option value="0">수업없음</option> <option value="1">월요일</option> <option value="2">화요일</option> <option value="3">수요일</option> <option value="4">목요일</option> <option value="5">금요일</option> </select> <select id="<%=cname%>:<%=instructor%>:start_1" name="<%=cname%>:<%=instructor%>start_1"> <option>수업없음</option> <option>9:00</option> <option>9:15</option> <option>9:30</option> <option>9:45</option> <option>10:00</option> <option>10:15</option> <option>10:30</option> <option>10:45</option> <option>11:00</option> <option>11:15</option> <option>11:30</option> <option>11:45</option> <option>12:00</option> <option>12:15</option> <option>12:30</option> <option>12:45</option> <option>13:00</option> <option>13:15</option> <option>13:30</option> <option>13:45</option> <option>14:00</option> <option>14:15</option> <option>14:30</option> <option>14:45</option> <option>15:00</option> <option>15:15</option> <option>15:30</option> <option>15:45</option> <option>16:00</option> <option>16:15</option> <option>16:30</option> <option>16:45</option> <option>17:00</option> <option>17:15</option> <option>17:30</option> <option>17:45</option> <option>18:00</option> <option>18:15</option> <option>18:30</option> <option>18:45</option> <option>19:00</option> <option>19:15</option> <option>19:30</option> <option>19:45</option> <option>20:00</option> <option>20:15</option> <option>20:30</option> <option>20:45</option> <option>21:00</option> <option>21:15</option> <option>21:30</option> <option>21:45</option> <option>22:00</option> </select> ~ <select id="<%=cname%>:<%=instructor%>:end_1" name="<%=cname%>:<%=instructor%>end_1"> <option>수업없음</option> <option>9:00</option> <option>9:15</option> <option>9:30</option> <option>9:45</option> <option>10:00</option> <option>10:15</option> <option>10:30</option> <option>10:45</option> <option>11:00</option> <option>11:15</option> <option>11:30</option> <option>11:45</option> <option>12:00</option> <option>12:15</option> <option>12:30</option> <option>12:45</option> <option>13:00</option> <option>13:15</option> <option>13:30</option> <option>13:45</option> <option>14:00</option> <option>14:15</option> <option>14:30</option> <option>14:45</option> <option>15:00</option> <option>15:15</option> <option>15:30</option> <option>15:45</option> <option>16:00</option> <option>16:15</option> <option>16:30</option> <option>16:45</option> <option>17:00</option> <option>17:15</option> <option>17:30</option> <option>17:45</option> <option>18:00</option> <option>18:15</option> <option>18:30</option> <option>18:45</option> <option>19:00</option> <option>19:15</option> <option>19:30</option> <option>19:45</option> <option>20:00</option> <option>20:15</option> <option>20:30</option> <option>20:45</option> <option>21:00</option> <option>21:15</option> <option>21:30</option> <option>21:45</option> <option>22:00</option> </select>&nbsp;&nbsp;&nbsp; <select id="<%=cname%>:<%=instructor%>:day_2" name="<%=cname%>:<%=instructor%>day_2"> <option value="0">수업없음</option> <option value="1">월요일</option> <option value="2">화요일</option> <option value="3">수요일</option> <option value="4">목요일</option> <option value="5">금요일</option> </select> <select id="<%=cname%>:<%=instructor%>:start_2" name="<%=cname%>:<%=instructor%>start_2"> <option>수업없음</option> <option>9:00</option> <option>9:15</option> <option>9:30</option> <option>9:45</option> <option>10:00</option> <option>10:15</option> <option>10:30</option> <option>10:45</option> <option>11:00</option> <option>11:15</option> <option>11:30</option> <option>11:45</option> <option>12:00</option> <option>12:15</option> <option>12:30</option> <option>12:45</option> <option>13:00</option> <option>13:15</option> <option>13:30</option> <option>13:45</option> <option>14:00</option> <option>14:15</option> <option>14:30</option> <option>14:45</option> <option>15:00</option> <option>15:15</option> <option>15:30</option> <option>15:45</option> <option>16:00</option> <option>16:15</option> <option>16:30</option> <option>16:45</option> <option>17:00</option> <option>17:15</option> <option>17:30</option> <option>17:45</option> <option>18:00</option> <option>18:15</option> <option>18:30</option> <option>18:45</option> <option>19:00</option> <option>19:15</option> <option>19:30</option> <option>19:45</option> <option>20:00</option> <option>20:15</option> <option>20:30</option> <option>20:45</option> <option>21:00</option> <option>21:15</option> <option>21:30</option> <option>21:45</option> <option>22:00</option> </select> ~ <select id="<%=cname%>:<%=instructor%>:end_2" name="<%=cname%>:<%=instructor%>end_2"> <option>수업없음</option> <option>9:00</option> <option>9:15</option> <option>9:30</option> <option>9:45</option> <option>10:00</option> <option>10:15</option> <option>10:30</option> <option>10:45</option> <option>11:00</option> <option>11:15</option> <option>11:30</option> <option>11:45</option> <option>12:00</option> <option>12:15</option> <option>12:30</option> <option>12:45</option> <option>13:00</option> <option>13:15</option> <option>13:30</option> <option>13:45</option> <option>14:00</option> <option>14:15</option> <option>14:30</option> <option>14:45</option> <option>15:00</option> <option>15:15</option> <option>15:30</option> <option>15:45</option> <option>16:00</option> <option>16:15</option> <option>16:30</option> <option>16:45</option> <option>17:00</option> <option>17:15</option> <option>17:30</option> <option>17:45</option> <option>18:00</option> <option>18:15</option> <option>18:30</option> <option>18:45</option> <option>19:00</option> <option>19:15</option> <option>19:30</option> <option>19:45</option> <option>20:00</option> <option>20:15</option> <option>20:30</option> <option>20:45</option> <option>21:00</option> <option>21:15</option> <option>21:30</option> <option>21:45</option> <option>22:00</option> </select>';
                    </script>
                    <script>
                          document.getElementById("<%=cname%>:<%=instructor%>:class_grade_1").selectedIndex = "<%=temp_min%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:class_grade_2").selectedIndex = "<%=temp_max%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:day_1").selectedIndex = "<%=day_1%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:day_2").selectedIndex = "<%=day_2%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:start_1").selectedIndex = "<%=t11%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:end_1").selectedIndex = "<%=t12%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:start_2").selectedIndex = "<%=t21%>";
                          document.getElementById("<%=cname%>:<%=instructor%>:end_2").selectedIndex = "<%=t22%>";
                    </script>
                        <%
              }
              stmt.close();
              conn.close();
          }
          catch( Exception ex )
          {
              out.println( ex.getMessage() );
          }
  %>