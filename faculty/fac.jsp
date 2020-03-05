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
 
      
              String selectSQ = "select * from batch where fac_id = ?";     
     
   
PreparedStatement preparedStatemen = con.prepareStatement(selectSQ);
preparedStatemen.setString(1,a );
ResultSet r = preparedStatemen.executeQuery();

     
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
                      <a href="exams.jsp"> <big><span style="color:#0FAACC;">Activate </span>Exams </big> </i></a>
                   
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
<section id="batch">
  <p><h6>Faculty Name: <%=name%> <br><br>

  </div>
  <table class="table table-striped"  style="border: 1px solid grey" >
    <thead><font >
    <% String sty="style='font-family: kalinga; font-size: 18px;font-weight: normal;border:0px solid #000'";%>
        <tr>
               <th <%=sty%> >Record ID</th>
                       <th <%=sty%> >Batch Code</th>
               
        <th <%=sty%> >Student Id</th>
        <th <%=sty%> >Student Name</th>
        <th <%=sty%> >Course Name</th>
       <th <%=sty%> width="20%" >Update Course Status</th>
      </tr>
    </thead>
    <tbody  style="font-family: kalinga; font-size: 15px;font-weight: normal">
   <% int j=0; while(r.next())
        { st=r.getString("student_id");
            String selectS = "select * from stud_info where id = ?";  
        PreparedStatement preparedStatem = con.prepareStatement(selectS);
preparedStatem.setString(1,st );
ResultSet z = preparedStatem.executeQuery();
      
   %>
      <tr style="font-family: kalinga; font-size: 18px;font-weight: normal;border:1px solid #000">
           <td <%=sty%> ><%= j+1%></td>
        <td <%=sty%> ><% out.println(r.getString("id").toUpperCase());%>
        </td>
            <% while(z.next())
        {%>
         <td <%=sty%> ><% out.println(z.getString("student_id").toUpperCase());%>
        </td>
      
       
                      
        <td <%=sty%> ><% out.println(z.getString("fname").toUpperCase());%>
        </td>                 

        
      <%  }%>
          <td <%=sty%> ><% out.println(r.getString("course").toUpperCase());%>
        </td>    
        <td <%=sty%> >
            
            <%
            if(r.getString("status").trim().equals("completed"))
            {
            out.print("<button style='padding:5px' class='btn-success'>Completed</button>");
            }else{%>
            <form action="updatecoursestatus" method="post">
                <input type="hidden" name="sid" value="<%= st %>">
                <input type="hidden" name="fid" value="<%= a %>">
                <input type="hidden" name="scs" value="<%= r.getString("course") %>">
                <input type="submit" value="mark as Completed" style="padding:5px" class="btn-info">
            </form><%}%></td>

      </tr>
<%}%>
    </tbody>
  </table>
</body>
</html>
