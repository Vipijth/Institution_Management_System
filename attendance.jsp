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
                
<jsp:forward page="index.html" />
          <%  }
%>
  <%  
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=niitkannur;user=sa;password=password123";
              Connection con=DriverManager.getConnection(s);
            String a=facs.getAttribute("fac").toString();
          
       

String name="";
        
            String selectSQL = "select * from fac where id = ?";     
     
   
PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
preparedStatement.setString(1,a );
ResultSet rs = preparedStatement.executeQuery();

        while(rs.next())
        {
            name=rs.getString("name").toUpperCase();
                      
                         

        
        }
        String sd="";
        String selectS="";
    String selectSQ = "select distinct batch_code from student_batch where fac_id = ? and status like 'not completed'";     
     
   
PreparedStatement preparedStatemen = con.prepareStatement(selectSQ);
preparedStatemen.setString(1,a );
ResultSet r = preparedStatemen.executeQuery();
String k="";
String j="";
 String op="0";
           if(request.getParameter("btn")!= null){
             j=request.getParameter("std").trim();
             op="1";
             }
             else{
                  j="";
             }
           if(request.getParameter("btns")!= null){
             k=request.getParameter("stdi");
             op="1";
             }
             else{
                 k="";
             }
       
  
            String select = "select distinct student_id from attendance where batch_code like ?";     

PreparedStatement prepared = con.prepareStatement(select);

prepared.setString(1,j);
ResultSet sq = prepared.executeQuery();

 String selec = "select  * from attendance where student_id like ? and batch_code like ?";     

PreparedStatement prepare = con.prepareStatement(selec);

prepare.setString(1,k);
prepare.setString(2,j);
ResultSet q = prepare.executeQuery();
String attended="";
String jname="";
String lname="";
String stdi="";

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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script></head>

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
                      <a href="fac.jsp"  ><i class="icon-home"></i> <big>Home </big></a>

                    </li>
                  
                    <li>
                      <a href="fac.jsp#batch"> <big><span style="color:#0FAACC;">My </span>Batches <i class="fas fa-book-open"></i></big></a>
                     
                    </li>
                    <li>
                      <a href="attendance.jsp" style="font-weight:bold;"> <big><span style="color:#0FAACC;"> </span> Attendance </big> </i></a>
                   
                    </li>
                    
					                    <li>
                      <a href="facprofile.jsp"> <big><span style="color:#0FAACC;">My </span>Profile </big> </i></a>
                   
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
<script>

    </script>
<div class="container">
<section id="batch">
  <p><h6><%=name%> <br><br>

<div class="container">
    <small>
  <p>Select Student by Student Id</p>
    </small>  <form>
      <div class="form-group">
          <form action="" method="post">
        <label for="fac">Select Batch</label>
        <select name="std" id="fac">
          <%  while(r.next())
            { String bkn=r.getString("batch_code");
         
            %>
            <option value="<%=bkn%>"><%=bkn%></option>
     
            <% }%>
        </select>
        <input type="submit" value="Show Details" name="btn" class="btn-info" style="padding: 5px;">
          </form>
    </div>
     
        
        
        <div class="form-group">
          <form action="" method="post">
              <label for="fac">Select Batch</label>
        <select name="stdi" id="fac" >
          <%  while(sq.next())
            { String bkn=sq.getString("student_id");
         
            %>
            <option value="<%=bkn%>"><%=bkn%></option>
     
            <% }%>
        </select>
        <input type="submit" value="Show Details" name="btns" class="btn-info" style="padding: 5px;">
          </form>
    </div>
     
      <table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:13px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>Batch Code</th>
        <th>Course Name</th>
        <th>Student Id</th>
                <th>total</th>
          <th>attended</th>

          
      </tr>
    </thead>
    <tbody>
     
  
   <% while(q.next())
        { %>
          
                      
    <td><%out.print(q.getString("batch_code").toUpperCase());%></td>
       <td><%out.print(q.getString("course_name").toUpperCase());%></td>
         
           <td><%out.print(q.getString("student_id").toUpperCase());%></td>
            <td><%out.print(q.getString("total").toUpperCase());%></td>
             <td><%out.print(q.getString("attended").toUpperCase());%></td>
 
 
    </tbody>
  </table>
     
               <% int tt=Integer.parseInt(q.getString("total")); 
                int ct=Integer.parseInt(q.getString("attended")); 
               for( int i=ct;i<tt;i++)
               {%>
               <form action="updateattend"  method="post">
         <input type="hidden" value="<%=ct%>" name="tt">
            <input type="hidden" value="<%=k%>" name="sid">
               <input type="hidden" value="<%=j%>" name="bid">
               <input type="text" readonly class="input-block-level" style="width:20%" value="Pending Session">
               <input type="submit" value="click to complete" class="btn-info" style="padding:5px;border-radius: 4px">
               
               <br>
               
  <%}} %>
    