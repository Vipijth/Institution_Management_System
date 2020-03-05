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
            String studid="";
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
                         
 studid=rs.getString("student_id");
                       
            psd=rs.getString("password");                                     
 mob=rs.getString("mob");
                        
        
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
  <h2>My Profile</h2>
  <p><h6>Student Name: <%=fname%> <%= lname%><br><br>Student Id:<%=studid%>
  <br><br>Email Id:<%=emailid%>
  <br><br>Address :<%=add%><br><br>Mobile Number:<%=mob%></h6>  
  
  
  
    <table class="table table-striped" style="font-family: kalinga; font-size: 18px;font-weight: normal">
    <thead><font >
    <tr class="active" style="border:1px solid black"><form action="edit" method="post" onsubmit="return confirm('Do you really want to Edit Now?');" > 
        <td >FIRST NAME</td>
        <td><input type="text" required value="<%= fname%>" name="name" style=" padding:20px ;"></td>
        <input type="hidden" value="fname" name="hid">
        <td><input type="submit" name="fname" class="btn-success" value="edit" style="width:100%; padding:3px ;"> </td>
    </form>
      </tr>
      <tr  style="border:1px solid black"><form action="edit" method="post" onsubmit="return confirm('Do you really want to Edit Now?');" >
        <td >LAST NAME</td>
 <td><input type="text" required value="<%= lname%>"  name="name"  style=" padding:20px ;"></td>
       <input type="hidden" value="lname" name="hid">  <td><input type="submit" name="lname"   class="btn-success" value="edit" style="width:100%; padding:3px ;"> </td>
    </form>
      </tr>
      <tr class="active"  style="border:1px solid black"><form action="edit" method="post" onsubmit="return confirm('Do you really want to Edit Now?');" >
        <td >EMAIL ID</td>
<td><input type="text" required value="<%= emailid%>" name="name" style=" padding:20px ;"></td>
     <input type="hidden" value="email" name="hid">    <td><input type="submit" name="email"  class="btn-success" value="edit" style="width:100%; padding:3px ;"> </td>
    </form>
      </tr><tr  style="border:1px solid black"><form action="edit" method="post" onsubmit="return confirm('Do you really want to Edit Now?');" >
        <td > ADDRESS</td>
      <td><input type="text" required value="<%= add%>" name="name"  style=" padding:40px ; width:80%"></td>
   <input type="hidden" value="add" name="hid">      <td><input type="submit" name="add"  class="btn-success" value="edit" style="width:100%; padding:3px ;"> </td>
    </form>
      </tr><tr class="active" style="border:1px solid black"><form action="edit" method="post" onsubmit="return confirm('Do you really want to Edit Now?');" >
        <td >MOBILE NUMBER</td>
    <td><input type="text" required value="<%= mob%>" name="name"  style=" padding:20px ;"></td>
    <input type="hidden" value="mob" name="hid">     <td><input type="submit" name="mob"  class="btn-success" value="edit" style="width:100%; padding:3px ;"> </td>
    </form>
      </tr><tr  style="border:1px solid black"><form action="edit" method="post" onsubmit="return confirm('Do you really want to Edit Now?');" >
        <td > PASSWORD</td>  
       <td><input type="password" required value="<%= psd%>" name="name"  style=" padding:20px ;"></td>
    <input type="hidden" value="psd" name="hid">     <td>
        <input type="submit" name="psd"  class="btn-success" value="edit" style="width:100%; padding:3px ;" > </td>
    </form>
      </tr>
      
      
      
      
    </thead>
    <tbody  style="font-family: kalinga; font-size: 15px;font-weight: normal">
   
    

    </tbody>
  </table>
</div>

</body>
</html>
