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

  function student_register() {
      var student_id = document.getElementById("student_id").value;
      var student_pwd = document.getElementById("student_pwd").value;
      var student_name = document.getElementById("student_name").value;
      var student_grade = document.getElementById("student_grade").value;
      var student_credit = document.getElementById("student_credit").value;
      // todo: check above information is available --> check with database
      var table = document.getElementById("student_table");
      var row = table.insertRow(table.rows.length);
      row.insertCell(0).innerHTML = student_id;
      row.insertCell(1).innerHTML = student_pwd;
      row.insertCell(2).innerHTML = student_name;
      row.insertCell(3).innerHTML = student_grade;
      row.insertCell(4).innerHTML = student_credit;
  }

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

</script>

</head>
<body>

  <div class="topnav">
    <a class="active" href="admin_register_student.jsp">학생 등록</a>
    <a href="admin_register_class.jsp">수업 등록</a>
    <a href="admin_modify_class.jsp">수업 수정</a>
    <a href="admin_class_list.jsp">수업 목록</a>
    <a href="admin_class_search.jsp">수업 검색</a>
    <a href="login.html">로그아웃</a>
  </div>
  <form action="student_reg.jsp">
    <input type="text" id="student_id" name="SID" placeholder="학번" required>
    <input type="text" id="student_pwd" name="pwd" placeholder="비밀번호" required>
    <input type="text" id="student_name" name="name" placeholder="이름" required>
    <input type="text" id="student_grade" name="grade" placeholder="학년" required>
    <input type="text" id="student_credit" name="max_credit" placeholder="허용학점" required>
    <button>등록</button>
  </form>

  <br><br>

  <div style="overflow-x:auto;">
    <table id="student_table">
      <tr>
        <th>학번</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>학년</th>
        <th>허용학점</th>
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

              ResultSet rs = stmt.executeQuery("select * from student");
                  int i = 1;

              while(rs.next()){
                    //out.println(rs.getString("SID"));
                    String SID = rs.getString("SID");
                    String pwd = rs.getString("pwd");
                    String name = rs.getString("name");
                    String grade = rs.getString("grade");
                    String max_credit = rs.getString("max_credit");
                      %>
                    <script>
                    //student_register("<%=rs.getString("SID")%>","<%=rs.getString("pwd")%>","<%=rs.getString("name")%>","<%=rs.getString("grade")%>","<%=rs.getString("max_credit")%>)";
                          var table = document.getElementById("student_table");
                          var row = table.insertRow(table.rows.length);
                          row.insertCell(0).innerHTML = "<%=SID%>";
                          row.insertCell(1).innerHTML = "<%=pwd%>";
                          row.insertCell(2).innerHTML = "<%=name%>";
                          row.insertCell(3).innerHTML = "<%=grade%>";
                          row.insertCell(4).innerHTML = "<%=max_credit%>";
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