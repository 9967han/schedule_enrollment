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
      var grade = document.getElementById("grade_list").value;
      for(var i = 1; i < table.rows.length; i++){
        table.rows[i].style.display = "";
      }
      for(var i = 1; i < table.rows.length; i++){
        if(table.rows[i].style.display == "none")continue;
        var class_name = table.rows[i].cells[1].innerHTML;
        if(!class_name.includes(input))
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
              var grade_info = table.rows[i].cells[6].innerHTML;
              if(grade_info.length == 3){
                  var target_grade = grade_info[0];
                  if(target_grade == grade)
                      target = true;
              }else{
                  var target_grade_1 = grade_info[0];
                  var target_grade_2 = grade_info[2];
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
    //console.log("OK");
      // Load all class information from database
  }


</script>

</head>
<body onload="initialize()">

  <div class="topnav">
    <a class="active" href="student_sugang.jsp">수강신청</a>
    <a href="student_wishlist.jsp">Wish List</a>
    <a href="student_set.jsp">수강신청내역</a>
    <a href="student_time_table.jsp">시간표</a>
    <a href="login.html">로그아웃</a>
  </div>

  <input type="text" id="class_input" placeholder="수업 검색" onkeyup="filter_class()">

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
        <th>수강신청</th>
        <th>Wish List 추가</th>
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
        ResultSet rs = stmt.executeQuery("select * from class");
              while(rs.next()){
                    String CNAME = rs.getString("CNAME");
                    String instructor = rs.getString("instructor");
                    String SID = (String)session.getAttribute("SID");
                    String classroom = rs.getString("classroom");
                    String available = rs.getString("available");
                    String class_credit = rs.getString("class_credit");
                    String min_grade = rs.getString("min_grade");
                    String max_grade = rs.getString("max_grade");
                    String max_student = rs.getString("max_student");

                    int c_time11 = rs.getInt("c_time11"); // 20900
                    int c_time12 = rs.getInt("c_time12"); // 21015
                    int c_time21 = rs.getInt("c_time21");
                    int c_time22 = rs.getInt("c_time22");

                    int time_check11 = c_time11;
                    int time_check12 = c_time12;
                    int time_check21 = c_time21;
                    int time_check22 = c_time22;

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
                          var table = document.getElementById("sugang_table");
                          var row = table.insertRow(table.rows.length);
                          row.insertCell(0).innerHTML = '<form action= "insert_enroll.jsp" method="post">' +
    '<input type="hidden" name="CNAME" value='+"'<%=CNAME%>'"+'</input>'+'<input type="hidden" name="instructor" value='+"'<%=instructor%>'"+'</input>'+ '<input type="hidden" name="min_grade" value='+"'<%=min_grade%>'"+'</input>'+ '<input type="hidden" name="max_grade" value='+"'<%=max_grade%>'"+'</input>'+ '<input type="hidden" name="time_check11" value='+"'<%=time_check11%>'"+'</input>'+ '<input type="hidden" name="time_check12" value='+"'<%=time_check12%>'"+'</input>'+ '<input type="hidden" name="time_check21" value='+"'<%=time_check21%>'"+'</input>'+ '<input type="hidden" name="time_check22" value='+"'<%=time_check22%>'"+'</input>' +'<button>신청</button></form>';
                          row.insertCell(1).innerHTML = '<form action= "insert_wish.jsp" method="post">' +
    '<input type="hidden" name="CNAME" value='+"'<%=CNAME%>'"+'</input>'+'<input type="hidden" name="instructor" value='+"'<%=instructor%>'"+'</input>' + '</input>'+'<input type="hidden" name="class_credit" value='+"'<%=class_credit%>'"+'</input>'+'<button>추가</button></form>';
                          row.insertCell(2).innerHTML = "<%=CNAME%>";
                          row.insertCell(3).innerHTML = "<%=class_credit%>";
                          row.insertCell(4).innerHTML = "<%=available%>";
                          row.insertCell(5).innerHTML = "<%=max_student%>";
                          row.insertCell(6).innerHTML = "<%=min_grade%>"+"-"+"<%=max_grade%>"+"학년";
                          row.insertCell(7).innerHTML = "<%=instructor%>";
                          row.insertCell(8).innerHTML = "<%=day_1_string%> <%=c_time11/100%>:<%=b11%>~<%=c_time12/100%>:<%=b12%><br><%=day_2_string%> <%=c_time21/100%>:<%=b21%>~<%=c_time22/100%>:<%=b22%>";
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