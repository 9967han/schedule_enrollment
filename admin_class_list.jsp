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

  function initialize() {
      // todo: Load class information from database.
  }


</script>

</head>
<body onload="initialize()">

  <div class="topnav">
    <a href="admin_register_student.jsp">학생 등록</a>
    <a href="admin_register_class.jsp">수업 등록</a>
    <a href="admin_modify_class.jsp">수업 수정</a>
    <a class="active" ref="admin_class_list.jsp">수업 목록</a>
    <a href="admin_class_search.jsp">수업 검색</a>
    <a href="login.html">로그아웃</a>
  </div>

  <div style="overflow-x:auto;">
    <table id="class_table">
      <tr>
        <th>교과목명</th>
        <th>교강사</th>
        <th>신청인원</th>
        <th>허용인원</th>
        <th>학점</th>
        <th>학년</th>
        <th>신청상태</th>
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
                
                    String cname = rs.getString("cname");
                    String instructor = rs.getString("instructor");
                    String classroom = rs.getString("classroom");
                    String available = rs.getString("available");
                    String class_credit = rs.getString("class_credit");
                    String min_grade = rs.getString("min_grade");
                    String max_grade = rs.getString("max_grade");
                    String max_student = rs.getString("max_student");
                    
                    int check = Integer.parseInt(max_student) - Integer.parseInt(available);
                    String state = "";
                    if(Integer.parseInt(available)<5)
                      state = "폐강";
                    else if(check > 0)
                      state = "진행중";
                    else
                      state = "신청종료";
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
                          row.insertCell(6).innerHTML = "<%=state%>";
                          
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