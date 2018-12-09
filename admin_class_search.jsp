<%@page import="java.sql.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
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

  function filter_class() {
      var table = document.getElementById("sugang_table");
      var input = document.getElementById("class_input").value;
      var inst = document.getElementById("instructor_input").value;
      var state = document.getElementById("state_list").value;
      var grade = document.getElementById("grade_list").value;
      for(var i = 1; i < table.rows.length; i++){
        var class_name = table.rows[i].cells[2].innerHTML;  //index는 어떤 컬럼 값을 가져다 검색할지
        if(!class_name.includes(input))
            table.rows[i].style.display="none";
        else
            table.rows[i].style.display="";
      }
      //instructor
      for(var i = 1; i < table.rows.length; i++){
        var instructor_name = table.rows[i].cells[1].innerHTML;  //index는 어떤 컬럼 값을 가져다 검색할지
        if(!instructor_name.includes(inst))
            table.rows[i].style.display="none";
        else
            table.rows[i].style.display="";
      }
      //state
      for(var i = 1; i < table.rows.length; i++){
        var class_name = table.rows[i].cells[0].innerHTML;  //index는 어떤 컬럼 값을 가져다 검색할지
        if(state == 0){
            //do nothing
        }
        else if(!class_name.includes(state))
            table.rows[i].style.display="none";
        else
            table.rows[i].style.display="";
      }

      if(grade == 0){
          for(var i = 1; i < table.rows.length; i++){
              if(table.rows[i].style.display == "none")continue;
              table.rows[i].style.display="";
          }
      }else{
          for(var i = 1; i < table.rows.length; i++){
              if(table.rows[i].style.display == "none")continue;
              var target = false;
              var grade_info = table.rows[i].cells[4].innerHTML;
              if(grade_info.length == 3){
                  var target_grade = grade_info[0];
                  if(target_grade == grade)
                      target = true;
              }else{
                  var target_grade_1 = grade_info[0];
                  var target_grade_2 = grade_info[4];
                  if(target_grade_1 <= grade && grade <= target_grade_2)
                      target = true;
              }
              if(target == true)
                  table.rows[i].style.display="";
              else
                  table.rows[i].style.display="none";
          }
      }
  }

  function initialize() {
      // Load all class information from database
  }
</script>

</head>
<body onload="initialize()">

  <div class="topnav">
    <a href="admin_register_student.jsp">학생 등록</a>
    <a href="admin_register_class.jsp">수업 등록</a>
    <a href="admin_modify_class.jsp">수업 수정</a>
    <a href="admin_class_list.jsp">수업 목록</a>
    <a class="active" href="admin_class_search.jsp">수업 검색</a>
    <a href="login.html">로그아웃</a>
  </div>

  <input type="text" id="class_input" placeholder="강의명 검색" onkeyup="filter_class()">
  <input type="text" id="instructor_input" placeholder="강사명 검색" onkeyup="filter_class()">
  <select id="state_list" onchange="filter_class()">
    <option value="0">모든 상태</option>
    <option>폐강</option>
    <option>진행중</option>
    <option>신청종료</option>
  </select>
  <select id="grade_list" onchange="filter_class()">
    <option value="0">모든 학년</option>
    <option value="1">1학년</option>
    <option value="2">2학년</option>
    <option value="3">3학년</option>
    <option value="4">4학년</option>
  </select>
  <br><br>

  <div style="overflow-x:auto;">
    <table id="sugang_table">
      <tr>
        <th>신청상태</th>
        <th>강사명</th>
        <th>강의명</th>
        <th>학점</th>
        <th>대상학년</th>
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
                  
                          var table = document.getElementById("sugang_table");
                          var row = table.insertRow(table.rows.length);
                          row.insertCell(0).innerHTML = "<%=state%>";
                          row.insertCell(1).innerHTML = "<%=instructor%>";
                          row.insertCell(2).innerHTML = "<%=cname%>";
                          row.insertCell(3).innerHTML = "<%=class_credit%>";
                          row.insertCell(4).innerHTML = "<%=min_grade%>학년~<%=max_grade%>학년";

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