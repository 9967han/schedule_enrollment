<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<html>
<head>
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

  function class_register() {
      var class_name = document.getElementById("class_name").value;
      var class_instructor = document.getElementById("class_instructor").value;
      var class_available = document.getElementById("class_available").value;
      var class_credit = document.getElementById("class_credit").selectedIndex + 1;
      var class_grade_1 = document.getElementById("class_grade_1").selectedIndex + 1;
      var class_grade_2 = document.getElementById("class_grade_2").selectedIndex + 1;
      var classroom = document.getElementById("classroom").value;
      var day_1 = document.getElementById("day_1").selectedIndex; // 1: Mon, 2: Tue, 3: Wed, 4: Thu, 5: Fri
      var start_1 = document.getElementById("start_1").selectedIndex; // 9:00 + 0:15 * start_1
      var end_1 = document.getElementById("end_1").selectedIndex; // 9:00 + 0:15 * end_1
      var day_2 = document.getElementById("day_2").selectedIndex; // 1: Mon, 2: Tue, 3: Wed, 4: Thu, 5: Fri
      var start_2 = document.getElementById("start_2").selectedIndex; // 9:00 + 0:15 * start_2
      var end_2 = document.getElementById("end_2").selectedIndex; // 9:00 + 0:15 * end_2
      // todo: check above parameters are available --> check also the database!
      var table = document.getElementById("class_table");
      var row = table.insertRow(table.rows.length);
      row.insertCell(0).innerHTML = class_name;
      row.insertCell(1).innerHTML = class_instructor;
      row.insertCell(2).innerHTML = 0;
      row.insertCell(3).innerHTML = class_available;
      row.insertCell(4).innerHTML = class_credit;
      row.insertCell(5).innerHTML = class_grade_1.toString() + '-' + class_grade_2.toString() + '학년';
      row.insertCell(6).innerHTML = classroom;
      // 수업 시간
      if(day_1)
      row.insertCell(7).innerHTML = 수업시간!!!
  }

  function initialize() {
      // todo: Load class information from database.
  }


</script>

</head>
<body onload="initialize()">

  <div class="topnav">
    <a href="admin_register_student.jsp">학생 등록</a>
    <a class="active" href="admin_register_class.jsp">수업 등록</a>
    <a href="admin_modify_class.jsp">수업 수정</a>
    <a href="admin_class_list.jsp">수업 목록</a>
    <a href="admin_class_search.jsp">수업 검색</a>
    <a href="login.html">로그아웃</a>
  </div>

  <form action="class_reg.jsp">
    <input type="text" id="class_name" name="cname" placeholder="교과목명">&nbsp;&nbsp;&nbsp;
    <input type="text" id="class_instructor" name="instructor" placeholder="교강사">&nbsp;&nbsp;&nbsp;
    <input type="text" id="class_available" name="max_student" placeholder="허용인원">&nbsp;&nbsp;&nbsp;
    <select id="class_credit" name="class_credit">
      <option value="1">1학점</option>
      <option value="2">2학점</option>
      <option value="3">3학점</option>
      <option value="4">4학점</option>
    </select>&nbsp;&nbsp;&nbsp;
    <select id="class_grade_1" name="min_grade">
      <option value="1">1학년</option>
      <option value="2">2학년</option>
      <option value="3">3학년</option>
      <option value="4">4학년</option>
    </select>
    ~
    <select id="class_grade_2" name="max_grade">
      <option value="1">1학년</option>
      <option value="2">2학년</option>
      <option value="3">3학년</option>
      <option value="4">4학년</option>
    </select>&nbsp;&nbsp;&nbsp;
    <input type="text" id="classroom" name="classroom" placeholder="강의실">&nbsp;&nbsp;&nbsp;
    <select id="day_1" name="day1">
      <option value="0">수업없음</option>
      <option value="1">월요일</option>
      <option value="2">화요일</option>
      <option value="3">수요일</option>
      <option value="4">목요일</option>
      <option value="5">금요일</option>
    </select>
    <select id="start_1" name="start_1">
      <option>수업없음</option>
      <option>9:00</option>
      <option>9:15</option>
      <option>9:30</option>
      <option>9:45</option>
      <option>10:00</option>
      <option>10:15</option>
      <option>10:30</option>
      <option>10:45</option>
      <option>11:00</option>
      <option>11:15</option>
      <option>11:30</option>
      <option>11:45</option>
      <option>12:00</option>
      <option>12:15</option>
      <option>12:30</option>
      <option>12:45</option>
      <option>13:00</option>
      <option>13:15</option>
      <option>13:30</option>
      <option>13:45</option>
      <option>14:00</option>
      <option>14:15</option>
      <option>14:30</option>
      <option>14:45</option>
      <option>15:00</option>
      <option>15:15</option>
      <option>15:30</option>
      <option>15:45</option>
      <option>16:00</option>
      <option>16:15</option>
      <option>16:30</option>
      <option>16:45</option>
      <option>17:00</option>
      <option>17:15</option>
      <option>17:30</option>
      <option>17:45</option>
      <option>18:00</option>
      <option>18:15</option>
      <option>18:30</option>
      <option>18:45</option>
      <option>19:00</option>
      <option>19:15</option>
      <option>19:30</option>
      <option>19:45</option>
      <option>20:00</option>
      <option>20:15</option>
      <option>20:30</option>
      <option>20:45</option>
      <option>21:00</option>
      <option>21:15</option>
      <option>21:30</option>
      <option>21:45</option>
      <option>22:00</option>
    </select>
    ~
    <select id="end_1" name="end_1">
      <option>수업없음</option>
      <option>9:00</option>
      <option>9:15</option>
      <option>9:30</option>
      <option>9:45</option>
      <option>10:00</option>
      <option>10:15</option>
      <option>10:30</option>
      <option>10:45</option>
      <option>11:00</option>
      <option>11:15</option>
      <option>11:30</option>
      <option>11:45</option>
      <option>12:00</option>
      <option>12:15</option>
      <option>12:30</option>
      <option>12:45</option>
      <option>13:00</option>
      <option>13:15</option>
      <option>13:30</option>
      <option>13:45</option>
      <option>14:00</option>
      <option>14:15</option>
      <option>14:30</option>
      <option>14:45</option>
      <option>15:00</option>
      <option>15:15</option>
      <option>15:30</option>
      <option>15:45</option>
      <option>16:00</option>
      <option>16:15</option>
      <option>16:30</option>
      <option>16:45</option>
      <option>17:00</option>
      <option>17:15</option>
      <option>17:30</option>
      <option>17:45</option>
      <option>18:00</option>
      <option>18:15</option>
      <option>18:30</option>
      <option>18:45</option>
      <option>19:00</option>
      <option>19:15</option>
      <option>19:30</option>
      <option>19:45</option>
      <option>20:00</option>
      <option>20:15</option>
      <option>20:30</option>
      <option>20:45</option>
      <option>21:00</option>
      <option>21:15</option>
      <option>21:30</option>
      <option>21:45</option>
      <option>22:00</option>
    </select>&nbsp;&nbsp;&nbsp;
    <select id="day_2" name="day_2">
      <option value="0">수업없음</option>
      <option value="1">월요일</option>
      <option value="2">화요일</option>
      <option value="3">수요일</option>
      <option value="4">목요일</option>
      <option value="5">금요일</option>
    </select>
    <select id="start_2" name="start_2">
      <option>수업없음</option>
      <option>9:00</option>
      <option>9:15</option>
      <option>9:30</option>
      <option>9:45</option>
      <option>10:00</option>
      <option>10:15</option>
      <option>10:30</option>
      <option>10:45</option>
      <option>11:00</option>
      <option>11:15</option>
      <option>11:30</option>
      <option>11:45</option>
      <option>12:00</option>
      <option>12:15</option>
      <option>12:30</option>
      <option>12:45</option>
      <option>13:00</option>
      <option>13:15</option>
      <option>13:30</option>
      <option>13:45</option>
      <option>14:00</option>
      <option>14:15</option>
      <option>14:30</option>
      <option>14:45</option>
      <option>15:00</option>
      <option>15:15</option>
      <option>15:30</option>
      <option>15:45</option>
      <option>16:00</option>
      <option>16:15</option>
      <option>16:30</option>
      <option>16:45</option>
      <option>17:00</option>
      <option>17:15</option>
      <option>17:30</option>
      <option>17:45</option>
      <option>18:00</option>
      <option>18:15</option>
      <option>18:30</option>
      <option>18:45</option>
      <option>19:00</option>
      <option>19:15</option>
      <option>19:30</option>
      <option>19:45</option>
      <option>20:00</option>
      <option>20:15</option>
      <option>20:30</option>
      <option>20:45</option>
      <option>21:00</option>
      <option>21:15</option>
      <option>21:30</option>
      <option>21:45</option>
      <option>22:00</option>
    </select>
    ~
    <select id="end_2" name="end_2">
      <option>수업없음</option>
      <option>9:00</option>
      <option>9:15</option>
      <option>9:30</option>
      <option>9:45</option>
      <option>10:00</option>
      <option>10:15</option>
      <option>10:30</option>
      <option>10:45</option>
      <option>11:00</option>
      <option>11:15</option>
      <option>11:30</option>
      <option>11:45</option>
      <option>12:00</option>
      <option>12:15</option>
      <option>12:30</option>
      <option>12:45</option>
      <option>13:00</option>
      <option>13:15</option>
      <option>13:30</option>
      <option>13:45</option>
      <option>14:00</option>
      <option>14:15</option>
      <option>14:30</option>
      <option>14:45</option>
      <option>15:00</option>
      <option>15:15</option>
      <option>15:30</option>
      <option>15:45</option>
      <option>16:00</option>
      <option>16:15</option>
      <option>16:30</option>
      <option>16:45</option>
      <option>17:00</option>
      <option>17:15</option>
      <option>17:30</option>
      <option>17:45</option>
      <option>18:00</option>
      <option>18:15</option>
      <option>18:30</option>
      <option>18:45</option>
      <option>19:00</option>
      <option>19:15</option>
      <option>19:30</option>
      <option>19:45</option>
      <option>20:00</option>
      <option>20:15</option>
      <option>20:30</option>
      <option>20:45</option>
      <option>21:00</option>
      <option>21:15</option>
      <option>21:30</option>
      <option>21:45</option>
      <option>22:00</option>
    </select>&nbsp;&nbsp;&nbsp;
  <button onclick="class_register()">등록</button>
  </form>
  <br><br>

  <div style="overflow-x:auto;">
    <table id="class_table">
      <tr>
        <th>교과목명</th>
        <th>교강사</th>
        <th>신청인원</th>
        <th>허용인원</th>
        <th>학점</th>
        <th>학년</th>
        <th>강의실</th>
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
                      %>
                    
                    <script>
                  
                          var table = document.getElementById("class_table");
                          var row = table.insertRow(table.rows.length);
                          row.insertCell(0).innerHTML = "<%=cname%>";
                          row.insertCell(1).innerHTML = "<%=instructor%>";
                          row.insertCell(2).innerHTML = "<%=available%>";
                          row.insertCell(3).innerHTML = "<%=max_student%>";
                          row.insertCell(4).innerHTML = "<%=class_credit%>";
                          row.insertCell(5).innerHTML = "<%=min_grade%>~<%=max_grade%>";
                          row.insertCell(6).innerHTML = "<%=classroom%>";
                          row.insertCell(7).innerHTML = "<%=day_1_string%> <%=c_time11/100%>:<%=b11%>~<%=c_time12/100%>:<%=b12%><br><%=day_2_string%> <%=c_time21/100%>:<%=b21%>~<%=c_time22/100%>:<%=b22%>";
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