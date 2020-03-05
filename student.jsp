
<%
 HttpSession sess=request.getSession(true);
 
     if(sess.getAttribute("user")==null)
            {%>
                
<jsp:forward page="index.html" />
          <%  }
%>
<%@page import="java.sql.*;" %>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.DriverManager;" %>
<%
     
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String s="jdbc:sqlserver://localhost;databaseName=niitkannur;user=sa;password=password123";
              Connection con=DriverManager.getConnection(s);
   
  
%>

  <%  
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
      String cd="";
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
                         
 cd=rs.getString("student_id");
                         
                         mob=rs.getString("mob");
                        
                         psd=rs.getString("password").toUpperCase();
        
        }
        
String SQL = "select * from student_batch where student_id like ?";
PreparedStatement prepareStatement = con.prepareStatement(SQL);
prepareStatement.setString(1,cd );

ResultSet rq = prepareStatement.executeQuery();
    
String SQ = "select distinct course_name from csddd where stude_id = ?";
PreparedStatement preparStatement = con.prepareStatement(SQ);
preparStatement.setString(1,a );

ResultSet rt = preparStatement.executeQuery();


String Q = "select distinct course_name from csddd where stude_id = ?";
PreparedStatement prepaStatement = con.prepareStatement(Q);
prepaStatement.setString(1,a );

ResultSet t = prepaStatement.executeQuery();


String qr = "select * from attendance where student_id = ?";
PreparedStatement Statement = con.prepareStatement(qr);
Statement.setString(1,cd );

ResultSet rc = Statement.executeQuery();

 
        String cst="";
             if(request.getParameter("submitc")!= null){
             cst=request.getParameter("courses");
           
             }
             else{
                  cst="";
             }
			 
			 
			 String mq = "select distinct course_name from csddd where stude_id = ?";
PreparedStatement st = con.prepareStatement(mq);
st.setString(1,a );
ResultSet l = st.executeQuery();




String tr = "select * from student_batch where student_id like ?";
PreparedStatement x = con.prepareStatement(tr);
x.setString(1,cd );
ResultSet xe = x.executeQuery();
      %>
	  
 
 
 
      
          
<html lang="en">
<style>
.a{}
.a:hover{text-decoration:none;}
</style>
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
          <div class="span9">
            <div class="navbar navbar-static-top" >
              <div class="navigation" >
                <nav >
                  <ul class="nav topnav">
                    <li>
                      <a href="index.html" style="font-weight:bold;" ><i class="icon-home"></i> <big>Home </big></a>

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
    </header>
    <!-- end header -->

    <!-- section featured -->
    <section id="featured">

      <!-- slideshow start here -->

      <div class="camera_wrap" id="camera-slide">

        <!-- slide 1 here -->
        <div data-src="img/niiiit.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
                <div class="span6">
                 
                </div>
              
              </div>
            </div>
          </div>
        </div>

        <!-- slide 2 here -->
        <div data-src="img/niiit.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              <div class="row">
               
                <div class="span6">
                 
                </div>

              </div>
            </div>
          </div>
        </div>

        <!-- slide 3 here -->
        <div data-src="img/niit.jpg">
          <div class="camera_caption fadeFromLeft">
            <div class="container">
              
            </div>
          </div>
        </div>

      </div>

      <!-- slideshow end here -->

    </section>
    <!-- /section featured -->

    <section id="content">
      <div class="container">


        <div class="row">
          <div class="span12">
            <div class="solidline"></div>
          </div>
        </div>

        <div class="row">
          <div class="span12">
		   <section id="courses">
            <div class="row">
              <div class="span12"  >
                  <div class="aligncenter"></center>
                  
                        <h4 class="title"> My <font style="color:#0FAACC">Courses</font></h4>
                  <hr/>
                
         
                  
         
                  <p><big><big>
                      </big></big>
                  </p>
                </div>
              </div>
            </div>

         <%
           
              
                       while(rq.next())
        {
    
        %>
            <div class="row">

              <div class="span3">
                <div class="pricing-box-wrap animated-fast flyIn">
                  <div class="pricing-heading">
                      <h3><strong><small>Batch Code<% out.print(rq.getString("batch_code").toUpperCase()); %></strong></h3></small>
                    <h5 style="color:white;font-family: kalinga;"><% out.print(rq.getString("session_name").toUpperCase()); %></h5>
                  </div>
                  
                  <div class="pricing-content">
                    <ul>
                        <%    String icon1="";
               String icon2="";
               String col="";
             
             
                           
                     
                        icon1="icon-Ok"; 
                 col="red";
                      
                     
                        %>
                      <li><i class="icon-time"></i> Start Date:<% out.print(rq.getString("start_date").toUpperCase()); %></li>
                     <li><i class="icon-time"></i> End Date: <% out.print(rq.getString("end_date").toUpperCase()); %></li>
                    </ul>
                  </div>
                  <div class="pricing-action">
                    <Button class="btn btn-medium btn-theme" style="pointer-events: none;"><i class="icon-chevron-down"></i> <% out.print(rq.getString("status").toUpperCase()); %> </button>
                  </div>
                </div>
              </div>
         
        <% } 
%>
        </div> </div>
<div class="row">
          <div class="span12 aligncenter">
              <SECTION id="prg">
                  <h4 class="title"> Program <font style="color:#0FAACC">Performance</font></h4>
                  <hr/>
            <div class="blankline30"></div>

            <h6>Overall <font style="color:#0FAACC">Attendance</font> </h6> <div class="progress" style=" border-radius: 5px; ">
            <%     while(rc.next())
        {
           int y=Integer.parseInt(rc.getString("total"));
            int u=Integer.parseInt(rc.getString("attended"));
          int o=100/y;
              
          int p=u*o;%>
     
   
  <div class="progress-bar progress-bar-striped active" role="progressbar"
  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:<%=p%>%;background: #0FAACC">
      <span style="color: white"><%=p%>%</span>
        <% }%>
  </div>
  
            </div><br><br>
           <h6>Exam <font style="color:#0FAACC">Details </font> </h6>     
  
    
            
          </div>
        </div>
        
        
<div class="span12">
		   <section id="courses">
            <div class="row">
              <div class="span12"  >
                  <div class="aligncenter"></center>
                
              
                  <p><big><big>
                      </big></big>
                  </p>
                </div>
              </div>
            </div>

         <%
           
              
                       while(xe.next())
        {
 %>
      
      
            <div class="row"> 
                <div class="span3" style="">
                <div class="pricing-box-wrap animated-fast flyIn">
                  <div class="pricing-heading">
                    <h3><strong><% out.print(xe.getString("session_name").toUpperCase()); %></strong></h3>
              
                  </div>
                  
                  <div class="pricing-content">
                    <ul>
                    
                        <font style="font-weight:normal">
                        
                         <li style="text-align:left">&nbsp;<i class="icon-user"></i> Faculty  <% out.print(xe.getString("fac_name").toUpperCase()); %></li>

                        <li style="text-align:left">&nbsp;<i class="icon-bell"></i> Main Exam Date :<% out.print(xe.getString("end_date").toUpperCase()); %></li>

                    </ul>
                  </div>
                 
                </div>
              </div>
         
        <% } 
%>
        </div> </div>


        <div class="row">
          <div class="span12 aligncenter">
            <h3 class="title">What Students <strong>saying</strong> about us</h3>
            <div class="blankline30"></div>

            <ul class="bxslider">
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/1.png" alt="" />
                  <h4>Hillary Doe</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/2.png" alt="" />
                  <h4>Michael Doe</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/3.png" alt="" />
                  <h4>Mark Donovan</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
              <li>
                <blockquote>
                  Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis feugiat.Suspendisse eu erat quam. Vivamus porttitor eros quis nisi lacinia sed interdum lorem vulputate. Aliquam a orci quis nisi sagittis sagittis. Etiam adipiscing, justo quis
                  feugiat
                </blockquote>
                <div class="testimonial-autor">
                  <img src="img/dummies/testimonial/4.png" alt="" />
                  <h4>Marry Doe Elliot</h4>
                  <a href="#">www.companyname.com</a>
                </div>
              </li>
            </ul>

          </div>
        </div>

      </div>
    </section>


    <section id="works">
	 <section id="gallery">
      <div class="container">
        <div class="row">
          <div class="span12">
		  
            <h4 class="title">NIIT <strong>Gallery</strong></h4>
            <div class="row">

              <div class="grid cs-style-4">
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/niit.jpg" alt="" / style="height:200px;"></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/niit.jpg" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                          
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/niiiit.jpg" alt="" style="height:200px;" /></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/niiiit.jpg" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/niiit.jpg" alt="" style="height:200px;" /></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/niiit.jpg" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
                <div class="span3">
                  <div class="item">
                    <figure>
                      <div><img src="img/niit.jpg" alt="" style="height:200px;"/></div>
                      <figcaption>
                        <div>
                          <span>
								<a href="img/niit.jpg" data-pretty="prettyPhoto[gallery1]" title="Portfolio caption here"><i class="icon-plus icon-circled icon-bglight icon-2x"></i></a>
								</span>
                          <span>
								<a href="#"><i class="icon-file icon-circled icon-bglight icon-2x"></i></a>
								</span>
                        </div>
                      </figcaption>
                    </figure>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </section>

    <footer>
      <div class="container">
        <div class="row">
          <div class="span4">
            <div class="widget">
              <h5 class="widgetheading">Browse pages</h5>
              <ul class="link-list">
                <li><a href="#">Our company</a></li>
                <li><a href="#">Terms and conditions</a></li>
                <li><a href="#">Privacy policy</a></li>
                <li><a href="#">Press release</a></li>
                <li><a href="#">What we have done</a></li>
                <li><a href="#">Our support forum</a></li>
              </ul>

            </div>
          </div>
          <div class="span4">
            <div class="widget">
              <h5 class="widgetheading">Get in touch</h5>
              <address>
							<strong>NIIT KANNUR</strong><br>
							ASHOKA BUILDING<br>
							THALIKKAVU ,KANNUR
						</address>
              <p>
                <i class="icon-phone"></i> (123) 456-7890 - (123) 555-7891 <br>
                <i class="icon-envelope-alt"></i> niitcnr@gmail.com
              </p>
            </div>
          </div>
         
        </div>
      </div>
      <div id="sub-footer">
        <div class="container">
          <div class="row">
            <div class="span6">
              <div class="copyright">
                <p><span>&copy; Eterna company. All right reserved</span></p>
              </div>

            </div>

            <div class="span6">
              <div class="credits">
                <!--
                  All the links in the footer should remain intact.
                  You can delete the links only if you purchased the pro version.
                  Licensing information: https://bootstrapmade.com/license/
                  Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=Eterna
                -->
                Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="js/jquery.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/bootstrap.js"></script>

  <script src="js/modernizr.custom.js"></script>
  <script src="js/toucheffects.js"></script>
  <script src="js/google-code-prettify/prettify.js"></script>
  <script src="js/jquery.bxslider.min.js"></script>
  <script src="js/camera/camera.js"></script>
  <script src="js/camera/setting.js"></script>

  <script src="js/jquery.prettyPhoto.js"></script>
  <script src="js/portfolio/jquery.quicksand.js"></script>
  <script src="js/portfolio/setting.js"></script>

  <script src="js/jquery.flexslider.js"></script>
  <script src="js/animate.js"></script>
  <script src="js/inview.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="js/custom.js"></script>
  <link href="/your-path-to-fontawesome/css/fontawesome.css" rel="stylesheet">
  <link href="/your-path-to-fontawesome/css/brands.css" rel="stylesheet">
  <link href="/your-path-to-fontawesome/css/solid.css" rel="stylesheet">
</body>
</html>
