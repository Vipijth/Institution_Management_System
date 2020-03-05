<%-- 
    Document   : myaccount
    Created on : 29 Jul, 2019, 12:18:47 PM
    Author     : Vipi
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%
 HttpSession sess=request.getSession(true);
 
     if(sess.getAttribute("user")==null)
            {%>
                
<jsp:forward page="index.html" />
          <%  }
%>
  <%  
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=niitkannur;user=sa;password=password123";
              Connection con=DriverManager.getConnection(s);
            String a=sess.getAttribute("user").toString();
          
       

String fname="";
          String lname="";
           String emailid="";
            String mob="";
             String psd="";
            String css="";
             if(request.getParameter("submit")!= null){
             css=request.getParameter("course");
             }
             else{
                  css="";
             }
     
      String add="";
      String tq=request.getParameter("mob");
      String qq=request.getParameter("warn");
        String selectSQL = "select * from stud_info where id = ?";
PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
preparedStatement.setString(1,a );
ResultSet rs = preparedStatement.executeQuery();
        while(rs.next())
        {
            fname=rs.getString("fname").toUpperCase();
                         lname=rs.getString("lname").toUpperCase();
                         emailid=rs.getString("email");
                         add=rs.getString("address");
                         

                         mob=rs.getString("student_id");
                        
                         psd=rs.getString("password").toUpperCase();
        
        }
        

     String SQL = "select * from course_fee where student_id like ?";
PreparedStatement preparedStatemen = con.prepareStatement(SQL);
preparedStatemen.setString(1,mob );
ResultSet rj = preparedStatemen.executeQuery();
        %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<head>
  <meta charset="utf-8">
  <title>NIIT Kannur</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Handlee|Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link href="css/bootstrap.css" rel="stylesheet" />
  <link href="css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="css/flexslider.css" rel="stylesheet" />
  <link href="css/prettyPhoto.css" rel="stylesheet" />
  <link href="css/camera.css" rel="stylesheet" />
  <link href="css/jquery.bxslider.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet" />

  <!-- Theme skin -->
  <link href="color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/logo.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/logo.png"/>
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/logo.png" />
  <link rel="apple-touch-icon-precomposed" href="img/logo.png" />
  <link rel="shortcut icon" href="img/logo.png" />


</head>

<body>

  <div id="wrapper">

    <!-- start header -->
    <header>
      <div class="top">
        <div class="container">
          <div class="row">
            <div class="span6">
                <p class="topcontact"><i class="icon-USER"></i><BIG> Welcome <%= fname%>  <%= lname%> </big></p>
                    
            </div>
            <div class="span6">

              <ul class="social-network">
                <li><a href="#" data-placement="bottom" title="Facebook"><i class="icon-facebook icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Twitter"><i class="icon-twitter icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Linkedin"><i class="icon-linkedin icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Pinterest"><i class="icon-pinterest  icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Google +"><i class="icon-google-plus icon-white"></i></a></li>
                <li><a href="#" data-placement="bottom" title="Dribbble"><i class="icon-dribbble icon-white"></i></a></li>
              </ul>

            </div>
          </div>
        </div>
      </div>
 <div class="container">


        <div class="row nomargin">
          <div class="span3">
            <div class="logo">
              <a href="index.html" class="a"><span style="font-size:39px;color:#0FAACC;"><b><big>NIIT</big><font color="#FFC500"> K</font><small>annur<small></span></a>
            </div>
          </div>
          <div class="span10">
            <div class="navbar navbar-static-top" >
              <div class="navigation" >
                <nav >
                  <ul class="nav topnav">
                    <li>
                      <a href="student.jsp" style="font-weight:bold;" ><i class="icon-home"></i> <big>Home </big></a>

                    </li>
                  
                    <li>
                      <a href="student.jsp#courses"> <big><span style="color:#0FAACC;">My </span>Courses <i class="fas fa-book-open"></i></big></a>
                     
                    </li>
                    <li>
                      <a href="myaccount.jsp"> <big><span style="color:#0FAACC;">My </span> Account </big> </i></a>
                   
                    </li>
                    			                    <li>
                      <a href="student.jsp#prg"> <big><span style="color:#0FAACC;">Program </span>Performance </big> </i></a>
                   
                    </li>
					                    <li>
                      <a href="myprofile.jsp"> <big><span style="color:#0FAACC;">My </span>Profile </big> </i></a>
                   
                    </li>
                 
                
                    
                      <li>
                      <a href="index.html#login" style="right:0" >Log <span style="color:#0FAACC;">Out</span> </big></a>
                    </li>
                  </ul>
                </nav>
              </div>
              <!-- end navigation -->
            </div>
          </div>
        </div>
      </div>
<hr/>
<div class="container">
  <h2>Payment History</h2>
  <p><h6>Student Name: <%=fname%> <%= lname%><br><br>Student Id:<%=mob%></p></h6>            
  <table class="table table-striped" style="font-family: kalinga; font-size: 18px;font-weight: normal">
    <thead><font >
        <tr>
        <th>Course Name</th>
        <th>Total Fee</th>
        <th>Payed</th>
      
         <th>Balance</th>
      </tr>
    </thead>
    <tbody  style="font-family: kalinga; font-size: 15px;font-weight: normal">
        <%    while(rj.next())
        {
           %>
      <tr>
        <td><%out.print(rj.getString("course_name").toUpperCase());%></td>
        <td><%out.print(rj.getString("total"));%></td>
        <td><%out.print(rj.getString("payed"));%></td>
            
             <td><%out.print(rj.getString("balance"));%></td>
      </tr>
 <%}%>
    </tbody>
  </table>
</div>

</body>
</html>
