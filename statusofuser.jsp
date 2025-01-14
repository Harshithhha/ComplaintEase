<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ComplainEase</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.webmanifest">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="assets/css/gijgo.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/animated-headline.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css">
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">


        <script>

            function checkDegree() {
                var select = document.getElementById("degree").value;
                window.location.replace("user_register.jsp?deg_JS=" + select);
            }

            window.onload = function() {
                
                var dept = sessionStorage.getItem("dept");
                if (dept !== null) $('#dept').val(dept);

                var address = sessionStorage.getItem("address");
                if (address !== null) $('#address').val(address);

                var des = sessionStorage.getItem("des");
                if (des !== null) $('#des').val(des);
                
            }

            window.onbeforeunload = function() {
                sessionStorage.setItem("dept", $('#dept').val());
                sessionStorage.setItem("address", $('#address').val());
                sessionStorage.setItem("des", $('#des').val());
                
            }
        </script>

    </head>

    <body>

        <%
		if(session.getAttribute("user") == null)									// check if admin is already patient in to the system
		{
			response.sendRedirect("user_login.jsp");								// if not logged in, take patient to login page
		}
%>

            <!-- ? Preloader Start -->
            <div id="preloader-active">
                <div class="preloader d-flex align-items-center justify-content-center">
                    <div class="preloader-inner position-relative">
                        <div class="preloader-circle"></div>
                        <div class="preloader-img pere-text">
                            <img src="assets/img/logo/logo2_footer.png" height="100px"  alt="">
                        </div>
                    </div>
                </div>
            </div>
            <!-- Preloader Start -->
            <header>
                <!-- Header Start -->
                <div class="header-area header-transparent">
                    <div class="main-header ">
                        <div class="header-bottom  header-sticky">
                            <div class="container-fluid">
                                <div class="row align-items-center">
                                    <!-- Logo -->
                                    <div class="col-xl-2 col-lg-2">
                                        <div class="logo">
                                            <a href="index.jsp"><img src="assets/img/logo/logo2_footer.png" height="100px"  alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-xl-10 col-lg-10">
                                        <div class="menu-wrapper d-flex align-items-center justify-content-end">
                                            <!-- Main-menu -->
                                            <div class="main-menu d-none d-lg-block">
                                                <nav>
                                                    <ul id="navigation">
                                                        <li class="active"><a href="user_dashboard.jsp">Home</a></li>
                                                        <li><a href="./statusofuser.jsp">My Status</a></li>
                                                           <!-- Button -->
                                                        <li class="button-header"><a href="user_logout.jsp" class="btn btn3">Log Out</a></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Mobile Menu -->
                                    <div class="col-12">
                                        <div class="mobile_menu d-block d-lg-none"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header End -->
            </header>
            <main>
                  
                <!--? slider Area Start-->
                <section class="slider-area ">
                    <div class="slider-active">
                        <!-- Single Slider -->
                        <div class="single-slider slider-height d-flex align-items-center">
                            <div class="container">
                                <div class="row">
                                    <div class="col-xl-6 col-lg-7 col-md-12">
                                        <div class="hero__caption">
                                            <h1 data-animation="fadeInLeft" data-delay="0.2s">Welcome<br>
                                                <% out.println(session.getAttribute("user")); %>
                                                 <% out.println(session.getAttribute("roll_no")); %>
                                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </main>
        <div class="section-top-border" width="10000px">
            <h3 class="mb-30 request">Your problems are sent .Administration will be taking action </h3>
            
                <div class="progress-table" width="5000px">
                    <form class="form-default" action="adminstration_problems_approved.jsp" method="POST">
                        <div class="table-head">
                            <div class="roll_no">Description</div>
                            <div class="name">Address</div>

                            <div class="accept">Proof</div>
                        </div>
                                   
                                    <%@ page import="java.sql.*" %>
                                    <%@ page import="java.io.*" %>
                                   
                                    <%@ page import="java.util.Base64" %>

                                    <%
                                        String url = "jdbc:mysql://your_mysql_server:3306/your_database";
                                        String user = "your_username";
                                        String password = "your_password";
                                        Connection  connection = null;
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            
                                            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
                                            Statement statement = connection.createStatement();
                                            PreparedStatement  pst =  connection.prepareStatement("SELECT * FROM problems  where isApproved=0 and user_id = ?");
                                            pst.setString(1, (String)session.getAttribute("roll_no"));

                                            ResultSet resultSet = pst.executeQuery();
                                            
                                             //statement.executeQuery("SELECT * FROM problems");
                                            while (resultSet.next()) {                                      
                                                String dept = resultSet.getString("dept");
                                                String address = resultSet.getString("Location");
                                                String des = resultSet.getString("des");
                                                Blob blob = resultSet.getBlob("image");
                                                byte[] imageData = blob.getBytes(1, (int) blob.length());
                                                String base64Image = Base64.getEncoder().encodeToString(imageData);
                                                
                                    %>
                                                <div class="ml-5000 mr-4000">
                                                    <div class="table-row">
                                                        
                                                        <div class="roll_no"> <%= des %> </div>
                                                        <div class="roll_no"> <%= address %></div>
                                                        
                                                    <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Image" width="120px" class="roll_no"/>
                                                    
                                                    <!-- <div class="accept"><input type="checkbox" name="selectedIds" value="<%= resultSet.getInt(1)%>"></div> -->
                                                </div>
                                                </div>
                                    <%
                                            }
                                            
                                        } catch (ClassNotFoundException | SQLException e) {
                                            e.printStackTrace();
                                        }
                                        
                                    %>

                    </form>
                </div>
            </div>

<form action="">

            <div class="section-top-border" width="10000px">
                <h3 class="mb-30 request">Problems which are successfully addressed by the administartion </h3>
                
                    <div class="progress-table" width="5000px">
                        <form class="form-default" action="" method="POST">
                            <div class="table-head">
                                <div class="roll_no">Description</div>
                                <div class="name">Address</div>
    
                                <div class="accept">Proof</div>
                            </div>
                                       
                                        <%@ page import="java.sql.*" %>
                                        <%@ page import="java.io.*" %>
                                       
                                        <%@ page import="java.util.Base64" %>
    
                                        <%
                                            //String url = "jdbc:mysql://your_mysql_server:3306/your_database";
                                           // String user = "your_username";
                                           // String password = "your_password";
                                            //Connection  connection = null;
                                            try {
                                            //    Class.forName("com.mysql.jdbc.Driver");
                                                
                                              //  connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");
                                                Statement statement = connection.createStatement();
                                                PreparedStatement  pst =  connection.prepareStatement("SELECT * FROM problems  where isApproved=1 and user_id = ?");
                                                pst.setString(1, (String)session.getAttribute("roll_no"));
    
                                                ResultSet resultSet = pst.executeQuery();
                                                
                                                 //statement.executeQuery("SELECT * FROM problems");
                                                while (resultSet.next()) {                                      
                                                    String dept = resultSet.getString("dept");
                                                    String address = resultSet.getString("Location");
                                                    String des = resultSet.getString("des");
                                                    Blob blob = resultSet.getBlob("image");
                                                    byte[] imageData = blob.getBytes(1, (int) blob.length());
                                                    String base64Image = Base64.getEncoder().encodeToString(imageData);
                                                    
                                        %>
                                                    <div class="ml-5000 mr-4000">
                                                        <div class="table-row">
                                                            
                                                            <div class="roll_no"> <%= des %> </div>
                                                            <div class="roll_no"> <%= address %></div>
                                                            
                                                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="Image" width="120px" class="roll_no"/>
                                                        
                                                        <!-- <div class="accept"><input type="checkbox" name="selectedIds" value="<%= resultSet.getInt(1)%>"></div> -->
                                                    </div>
                                                    </div>
                                        <%
                                                }
                                                
                                            } catch ( SQLException e) {
                                                e.printStackTrace();
                                            }
                                            
                                        %>
    
                        </form>
                    </div>
                </div>
            <footer>
                <div class="footer-wrappper footer-bg">
                    <!-- Footer Start-->
                    <div class="footer-area footer-padding">
                        <div class="container">
                            <div class="row justify-content-between">
                                <div class="col-xl-4 col-lg-5 col-md-4 col-sm-6">
                                    <div class="single-footer-caption mb-50">
                                        <div class="single-footer-caption mb-30">
                                            <!-- logo -->
                                            <div class="footer-logo mb-25">
                                                <a href="index.jsp"><img src="assets/img/logo/logo2_footer.png"  height="100px"alt=""></a>
                                            </div>
                                            <div class="footer-tittle">
                                                <div class="footer-pera">
                                                    <p>The automated process starts here.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- footer-bottom area -->
                                <div class="footer-bottom-area">
                                    <div class="container">
                                        <div class="footer-border">
                                            <div class="row d-flex align-items-center">
                                                <div class="col-xl-12 ">
                                                    <div class="footer-copy-right text-center">
                                                        <p>
                                                            Copyright &copy;
                                                            <script>
                                                                document.write(new Date().getFullYear());
                                                            </script> All rights reserved
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Footer End-->
                            </div>
            </footer>
            <!-- Scroll Up -->
            <div id="back-top">
                <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
            </div>

            <!-- JS here -->
            <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
            <!-- Jquery, Popper, Bootstrap -->
            <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
            <script src="./assets/js/popper.min.js"></script>
            <script src="./assets/js/bootstrap.min.js"></script>
            <!-- Jquery Mobile Menu -->
            <script src="./assets/js/jquery.slicknav.min.js"></script>

            <!-- Jquery Slick , Owl-Carousel Plugins -->
            <script src="./assets/js/owl.carousel.min.js"></script>
            <script src="./assets/js/slick.min.js"></script>
            <!-- One Page, Animated-HeadLin -->
            <script src="./assets/js/wow.min.js"></script>
            <script src="./assets/js/animated.headline.js"></script>
            <script src="./assets/js/jquery.magnific-popup.js"></script>

            <!-- Date Picker -->
            <script src="./assets/js/gijgo.min.js"></script>
            <!-- Nice-select, sticky -->
            <script src="./assets/js/jquery.nice-select.min.js"></script>
            <script src="./assets/js/jquery.sticky.js"></script>
            <!-- Progress -->
            <script src="./assets/js/jquery.barfiller.js"></script>

            <!-- counter , waypoint,Hover Direction -->
            <script src="./assets/js/jquery.counterup.min.js"></script>
            <script src="./assets/js/waypoints.min.js"></script>
            <script src="./assets/js/jquery.countdown.min.js"></script>
            <script src="./assets/js/hover-direction-snake.min.js"></script>

            <!-- contact js -->
            <script src="./assets/js/contact.js"></script>
            <script src="./assets/js/jquery.form.js"></script>
            <script src="./assets/js/jquery.validate.min.js"></script>
            <script src="./assets/js/mail-script.js"></script>
            <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

            <!-- Jquery Plugins, main Jquery -->
            <script src="./assets/js/plugins.js"></script>
            <script src="./assets/js/main.js"></script>

    </body>

    </html>