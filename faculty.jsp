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
            
                  String student = "select * from fac";     
    
PreparedStatement prepared = con.prepareStatement(student);
ResultSet stud= prepared.executeQuery();
 
      
              String selectSQ = "select * from batch where fac_id = ?";     
     
   
PreparedStatement preparedStatemen = con.prepareStatement(selectSQ);
preparedStatemen.setString(1,a );
ResultSet r = preparedStatemen.executeQuery();
   if(request.getParameter("del")!= null){
            String delid=  request.getParameter("delsid");
                String selec = "delete from fac where id = ?";     
     
   
PreparedStatement prepar = con.prepareStatement(selec);
prepar.setString(1,"13" );
 prepar.executeUpdate();
   }
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
              <a href="faculty/index.html" class="a"><span style="font-size:39px;color:#0FAACC;"><b><big>NIIT</big><font color="#FFC500"> K</font><small>annur<small></span></a>
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
  <h5> <b>Faculty Details </h5>
 <button type="button" class="btn-link"   data-toggle="modal" data-target="#myModal">Click Here To Add a New Faculty</button>

<hr/>
 

<table class="table table-hover" style="height:100%;width:100%; border:1px solid black; font-family: Helvetica; font-size:13px; font-weight:normal;">
    <thead>
      <tr style="background: #149bdf; color:white;">
        <th>Faculty Id</th>
        <th>Faculty Name</th>
        <th>User Name</th>
             <th>Faculty Type</th>
             <th> </th>
  
          
      </tr>
    </thead>
    <tbody>
      <%  
        while(stud.next())
        {%>
        
      <tr>
        <td><% out.print(stud.getString("id").toUpperCase());%></td>
        <td><% out.print(stud.getString("name").toUpperCase());%></td>
        <td><%out.print(stud.getString("user_name").toUpperCase());%></td>
          <td><%out.print(stud.getString("admin").toUpperCase());%></td>
    <form action="delfac" method="post">
      
     <%   String did=stud.getString("id"); %>
        <input type="hidden" name="id" value='<%=did%>'>         
        <td><input type="submit" name="del" value="Remove Now"  class=" btn-info" style="padding:5px;text-align: center;" onSubmit="return confirm('Do you really want to remove this Faculty?');" ></td></form>
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
       
  <h4>Faculty Registration form</h4>
  <form action="facreg" method="post">
    <div class="form-group">
        <label for="name">First Name:</label>
      <input type="text" required class="input-block-level" id="name" placeholder="Enter Faculty Name" name="name" style="width: 100%">
    </div>
      
      <div class="form-group">
        <label for="uname">User Name:</label>
      <input type="text" required class="input-block-level" id="uname" placeholder="Enter User Name" name="uname" style="width: 100%">
    </div>
       
      <div class="form-group"><h6><small>
                  
        Technical   <input type="radio" value="technical" required name="admin">
        Front Office   <input type="radio" value="front_office" required name="admin"></h6>
  
    </div>

      <input type="submit" name="sss" class="btn btn-primary" value="Add Faculty"></button>
  </form>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>