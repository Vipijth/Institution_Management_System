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
 HttpSession facs=request.getSession(true);
 
     if(facs.getAttribute("fac")==null)
            {%>
                
<jsp:forward page="faculty/index.html" />
          <%  }
%>
  <%  
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=niitkannur;user=sa;password=password123";
              Connection con=DriverManager.getConnection(s);
            String a=facs.getAttribute("fac").toString();
          
           String b=facs.getAttribute("admin").toString().toUpperCase();

String name="";
        
            String selectSQL = "select * from fac where id = ?";     
     
   String st="";
PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
preparedStatement.setString(1,a );
ResultSet rs = preparedStatement.executeQuery();

        while(rs.next())
        {
            name=rs.getString("name").toUpperCase();
                      
                         

        
        }
        

            // rows affected
            
                  String student = "select * from course_fee";     
    
PreparedStatement prepared = con.prepareStatement(student);
ResultSet stud= prepared.executeQuery();
 
        
                  String studnt = "select * from course_fee";     
    
PreparedStatement prepar = con.prepareStatement(studnt);
ResultSet study= prepar.executeQuery();
 
              String selectSQ = "select * from batch where fac_id = ?";     
     
   
PreparedStatement preparedStatemen = con.prepareStatement(selectSQ);
preparedStatemen.setString(1,a );
ResultSet r = preparedStatemen.executeQuery();
 String bok = "select * from niit_courses";     
     
   
PreparedStatement preparedSta= con.prepareStatement(bok);
ResultSet bk = preparedSta.executeQuery();
String stid="";
ResultSet stude;
     if(request.getParameter("show")!= null){
      stid=request.getParameter("student_ids").toUpperCase();
      
 
     }
     
   String studt = "select * from course_fee where student_id like ?";      
PreparedStatement prepr = con.prepareStatement(studt);
 prepr.setString(1,stid );
 stude= prepr.executeQuery();
     


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
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
                <p class="topcontact"><i class="icon-USER"></i><BIG> Welcome <%= name%> </big></p>
                    
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
                      <a href="fro.jsp" style="font-weight:bold;" ><i class="icon-home"></i> <big>Home </big></a>

                    </li>
                  
                    <li>
                      <a href="fro.jsp#batch"> <big><span style="color:#0FAACC;">Students </span><i class="fas fa-book-open"></i></big></a>
                     
                    </li>
                    <li>
                      <a href="batches.jsp"> <big><span style="color:#0FAACC;"> Batches<span>  </big> </i></a>
                   
                    </li>
                    			                    <li>
                      <a href="faculty.jsp"> <big><span style="color:#0FAACC;">Faculties </span> </big> </i></a>
                   
                    </li>
					                    <li>
                      <a href="courses.jsp"> <big><span style="color:#0FAACC;">NIIT </span>Courses </big> </i></a>
                   
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
<section id="batch">
  <p><h6>Faculty Name: <%=name%> <br>
      
      <p><h6> <small><%=b%> Employee</small><br><br>
  </div><hr/>
  <div class="container">
  <h5> <b>Fee Details </h5>
 

<hr/>
 

<table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:13px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>Student Id</th>
        <th>Student Name</th>
        <th>Course Name</th>
                <th>Total</th>
          <th>Payed</th>
            <th>Balance</th>
            <th></th>
      </tr>
    </thead>
    <tbody>
      <%  
        while(stud.next())
            
        {  int bal=Integer.parseInt(stud.getString("balance")); 

      %>
        
      <tr>
           
        <td><% out.print(stud.getString("student_id").toUpperCase());%></td>
        <td><% out.print(stud.getString("student_name").toUpperCase());%></td>
        <td><%out.print(stud.getString("course_name").toUpperCase());%></td>
          <td><%out.print(stud.getString("total").toUpperCase());%></td>
         <td><%out.print(stud.getString("payed").toUpperCase());%></td>
          <td><% out.print(stud.getString("balance").toUpperCase());%></td>
          <%if(bal>0){ %>
   <td>
       
            <input type="button" value="Pending" class="btn-info">
        </td> 
          <%}
else{ %>
    <td><input type="button" value="Paid" class="btn-info">
     <%}
          %>
      </tr>
<%}%>
    </tbody>
  </table>
    
    <br><br>
        <div class="form-group">
            <form action="" method="post">
                <label for="fac"> <h5> <b>Select Student Id</h5></label>
        <select name="student_ids" id="fac">
          <%  while(study.next())
            { String bkn=study.getString("student_id");
         
            %>
            <option value="<%=bkn%>"><%=bkn%></option>
     
            <% }%>
        </select>
        <input type="submit" value="Show Details" name="show" class="btn-info" style="padding:7px 10px; border-radius: 10px">
            </form>
    </div>
    
  </div>
            <table align="center" class="table" style="width:60%"> 
                <tr>
                    <td>
                        
                    
<% 
while(stude.next())
{%>
<form action="studentfee" method="post">
<h6><small> Student ID:<input type="text" name="std" value=" <%out.print(stude.getString("student_id"));%>" class="input-block-level " readonly style="border:0px solid blue">
    
    Student Name<input type="text" value=" <%out.print(stude.getString("student_Name"));%>" class="input-block-level " readonly style="border:0px solid blue">
    
     Course Name<input type="text" name="csd" value=" <%out.print(stude.getString("course_name"));%>" class="input-block-level " readonly style="border:0px solid blue">
        Total Amount<input type="text" value=" <%out.print(stude.getString("total"));%>" class="input-block-level " readonly style="border:0px solid blue">
           Paid<input type="text" id="cc" value=" <%out.print(stude.getString("payed"));%>" class="input-block-level " readonly style="border:0px solid blue">
       Balance<input type="text" value=" <%out.print(stude.getString("balance"));%>" id="bl" class="input-block-level " readonly style="border:0px solid blue">
       Paying AMount<input type="text" class="input-block-level "  style="border:1px solid blue" id="pl" onchange="myFunction()">
    Total Paid<input type="text" name="paid" value=" " id="kk"  class="input-block-level " readonly style="border:0px solid blue">
    
       New balance<input type="text"  name="bal"  class="input-block-level "  style="border:1px solid blue" id="newbal" >
       
       <input type="submit" value="go to payment" name="sub" class="btn-info">
    </form>
<%}

%>

<script>
    function myFunction()
    {
      
        var a=document.getElementById("bl").value;
        var b=document.getElementById("pl").value;
         var d=document.getElementById("cc").value;
            c=a-b;
            var integer = parseInt(d, 10);
               var integers = parseInt(b, 10);
            e=integer+integers;
        if(c>-1){
    
         document.getElementById("newbal").value=c;
         
         document.getElementById("kk").value=e/1;
    }
    else{
        
          alert("error");
    }
}
    
</script>