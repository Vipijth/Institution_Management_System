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
            
                  String student = "select * from stud_info";     
    
PreparedStatement prepared = con.prepareStatement(student);
ResultSet stud= prepared.executeQuery();
 
      
              String selectSQ = "select * from batch where fac_id = ?";     
     
   
PreparedStatement preparedStatemen = con.prepareStatement(selectSQ);
preparedStatemen.setString(1,a );
ResultSet r = preparedStatemen.executeQuery();
 String bok = "select * from niit_courses";     
     
   
PreparedStatement preparedSta= con.prepareStatement(bok);
ResultSet bk = preparedSta.executeQuery();

     
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
  <h5> <b>Students Details </h5>
 <button type="button" class="btn-link"   data-toggle="modal" data-target="#myModal">Click Here To Add Student</button>
 <br> 
 <form action="fee.jsp" method="post">
       <input type="submit" class="btn-link"   style='color:red' value="Student's Payment">
 </form>       

<hr/>
 

<table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:13px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
                <th>Address</th>
          <th>Mobile</th>
            <th>Student Id</th>
          
      </tr>
    </thead>
    <tbody>
      <%  
        while(stud.next())
        {%>
        
      <tr>
        <td><% out.print(stud.getString("fname").toUpperCase());%></td>
        <td><% out.print(stud.getString("lname").toUpperCase());%></td>
        <td><%out.print(stud.getString("email").toUpperCase());%></td>
          <td><%out.print(stud.getString("address").toUpperCase());%></td>
         <td><%out.print(stud.getString("mob").toUpperCase());%></td>
          <td><% out.print(stud.getString("student_id").toUpperCase());%></td>
      </tr>
<%}%>
    </tbody>
  </table>
    
  </div>
    
    
         <div class="modal fade" id="myModal" role="dialog" style="left:20%;background: transparent;width: 100%;height:100%;border:0px solid black; box-shadow: 0px 0px 0px black">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>

        </div>
        <div class="modal-body">
       
  <h4>Student Registration form</h4>
  <form action="studreg" method="post">
    <div class="form-group">
        <label for="fname">First Name:</label>
      <input type="text" required class="input-block-level" id="fname" placeholder="Enter First Name" name="fname" style="width: 100%">
    </div>
      
      <div class="form-group">
        <label for="lname">Last Name:</label>
      <input type="text" required class="input-block-level" id="lname" placeholder="Enter Last Name" name="lname" style="width: 100%">
    </div>
        <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" required class="input-block-level" id="email" placeholder="Enter email" name="email" style="width: 100%">
    </div>
    <div class="form-group">
      <label for="mob">Mobile</label>
      <input type="Text" required class="input-block-level" maxlength="10" id="mob" placeholder="Enter Mobile Number" name="mob">
    </div>
        <div class="form-group">
      <label for="stid">Student Id</label>
      <input type="Text" required class="input-block-level" id="mob" value="S1811020600" placeholder="Enter Student Id" name="stid">
    </div>
      <div class="form-group">
      <label for="add">Address:</label>
      <textarea required  class="input-block-level"  id="add" placeholder="Enter Student's Address" name="add">
      </textarea>
    </div>
    <div class="form-group">
        <label for="fac">Session Name</label>
        <select name="course_name" id="fac">
          <%  while(bk.next())
            { String bkn=bk.getString("course_name");
         
            %>
            <option value="<%=bkn%>"><%=bkn%></option>
     
            <% }%>
        </select>
    </div>
        
           <div class="form-group">
      <label for="v">Course Fee</label>
      <input type="Text" required class="input-large" maxlength="10" id="v" placeholder="Course Fee" name="fee" style="height:40px">
    </div>

      <input type="submit" name="sss" class="btn btn-primary" value="Add Student"></button>
  </form>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>