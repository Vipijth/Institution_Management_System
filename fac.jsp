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
     
   String st="";
PreparedStatement preparedStatement = con.prepareStatement(selectSQL);
preparedStatement.setString(1,a );
ResultSet rs = preparedStatement.executeQuery();

        while(rs.next())
        {
            name=rs.getString("name").toUpperCase();
                      
                         

        
        }
 
      
              String selectSQ = "select * from batch where fac_id = ? and status like 'not completed'";     
     
   
PreparedStatement preparedStatemen = con.prepareStatement(selectSQ);
preparedStatemen.setString(1,a );
ResultSet r = preparedStatemen.executeQuery();

 
              String select = "select * from batch where fac_id = ? and status like 'not completed'";     
PreparedStatement preparedStatem = con.prepareStatement(select);
preparedStatem.setString(1,a );
ResultSet x = preparedStatem.executeQuery();

 String selec = "select * from stud_info";     
PreparedStatement prepar = con.prepareStatement(selec);
ResultSet y = prepar.executeQuery();

    String selectS = "select * from batch where fac_id = ? and status like 'completed'";     
     
   
PreparedStatement preparedStateme = con.prepareStatement(selectS);
preparedStateme.setString(1,a );
ResultSet t = preparedStateme.executeQuery();
     

 String sele = "select * from student_batch where fac_id = ? and status like 'not completed'";     
PreparedStatement pre = con.prepareStatement(sele);
pre.setString(1,a );
ResultSet pr = pre.executeQuery();
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
                      <a href="fac.jsp" style="font-weight:bold;" ><i class="icon-home"></i> <big>Home </big></a>

                    </li>
                  
                    <li>
                      <a href="fac.jsp#batch"> <big><span style="color:#0FAACC;">My </span>Batches <i class="fas fa-book-open"></i></big></a>
                     
                    </li>
                    <li>
                      <a href="attendance.jsp"> <big><span style="color:#0FAACC;"> </span> Attendance </big> </i></a>
                   
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
<div class="container">
<section id="batch">
  <p><h6>Faculty Name: <%=name%> <br><br>

  </div>
    <div class="container">
  <h5> <b>Batch Details </h5>
 
      <button type="button" class="btn-link"  style="color:red" >My Batches</button>
 <p>
<hr/>
<table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:14px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>Batch Code</th>
        <th>Session Name</th>
        <th>Start Date</th>
             <th>End Date</th>
                <th> Total Sessions</th>
                <th></th>
      </tr>
    </thead>
     <tbody>
      <%  
        while(r.next())
        {
      String bid=r.getString("id").toUpperCase();%>
        
      <tr>
        <td><% out.print(r.getString("id").toUpperCase());%></td>
          <td><% out.print(r.getString("session_name").toUpperCase());%></td>
            <td><% out.print(r.getString("start_date").toUpperCase());%></td>
              <td><% out.print(r.getString("end_date").toUpperCase());%></td>
          
               <td><% out.print(r.getString("total_session").toUpperCase());%></td>
     <form action="batchstatus" method="post">
         <td>
             <input type="hidden" name="bid" value="<%=bid%>">
             <input type="submit" value="CLick TO Complete" class="btn-info" name="batchstatus" style="width:100%">
         </td>
     </form>
       
        

      
     
      </tr>
<%}%>
    </tbody>
  </table>
 
    <hr/>
    <br>
 
      <button type="button" class="btn-link"  style="color:red" >My Completed Batches</button>
 <p>
<hr/>
<table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:14px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>Batch Code</th>
        <th>Session Name</th>
        <th>Start Date</th>
             <th>End Date</th>
                <th> Total Sessions</th>
              
      </tr>
    </thead>
     <tbody>
      <%  
        while(t.next())
        {
 %>
        
      <tr>
        <td><% out.print(t.getString("id").toUpperCase());%></td>
          <td><% out.print(t.getString("session_name").toUpperCase());%></td>
            <td><% out.print(t.getString("start_date").toUpperCase());%></td>
              <td><% out.print(t.getString("end_date").toUpperCase());%></td>
          
               <td><% out.print(t.getString("total_session").toUpperCase());%></td>
  
       
        

      
     
      </tr>
<%}%>
    </tbody>
  </table><hr/><hr/>
    
      <h5> <b>My Students </h5>
 
      <button type="button" class="btn-link"  style="color:red" >Add Students to My Batches</button>
 <p>
<hr/>
<form action="studentbatch" method="post">
       <div class="form-group">
      <label for="batch">Select Batch Code</label>
      <h6>  <select name="bcode"  id="batch">
              <% while(x.next()){ String gg=x.getString("id");%>
              <option value="<%=gg%>"><% out.print(x.getString("id"));%></option>
          <%}%>
          </select>
      </h6>
       </div>
    <div class="form-group">
      <label for="student">Select Student Id</label>
      <h6>  <select name="stcode"  id="student">
              <% while(y.next()){ String bb=y.getString("id");%>
              <option value="<%=bb%>"><% out.print(y.getString("student_id"));%></option>
          <%}%>
          </select>
          <input type="submit" value="Add Student" class="btn-info" name="addstud" style="padding:5px; border-radius: 5px">
      </h6>
</form>
    </div>
          <hr/>
    

      <button type="button" class="btn-link"  style="color:red" >Current Students and Batches</button>
 <p>
<hr/>
  <table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:14px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>Batch Code</th>
        <th>Session Name</th>
          <th>Student Name</th>
           <th>Student Id</th>
        <th>Start Date</th>
             <th>End Date</th>
                <th> </th>
              
      </tr>
    </thead>        
    <tbody>
      <%  
        while(pr.next())
        {
     String vid=pr.getString("student_id").toUpperCase();
           String mid=pr.getString("batch_code").toUpperCase();%>
      <tr>
        <td><% out.print(pr.getString("batch_code").toUpperCase());%></td>
          <td><% out.print(pr.getString("session_name").toUpperCase());%></td>
          <td><% out.print(pr.getString("student_name").toUpperCase());%></td>
          <td><% out.print(pr.getString("student_id").toUpperCase());%></td>
            <td><% out.print(pr.getString("start_date").toUpperCase());%></td>
              <td><% out.print(pr.getString("end_date").toUpperCase());%></td>
          
               
     <form action="studstatus" method="post">
         <td>
             <input type="hidden" name="bid" value="<%=vid%>">
               <input type="hidden" name="mid" value="<%=mid%>">
             <input type="submit" value="CLick TO Complete" class="btn-info" name="studentstatus" style="width:100%">
         </td>
     </form>
       
        

      
     
      </tr>
<%}%>
    </tbody>
  </table>
</body>
</html>
