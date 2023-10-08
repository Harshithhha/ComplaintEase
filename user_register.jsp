<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*, java.lang.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

    <html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>user Registration</title>
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
            var check = function() {
                if (document.getElementById("password").value == document.getElementById("confirm_password").value) {
                    document.getElementById("message").style.color = "green";
                    document.getElementById("message").innerHTML = "Password matched!";
                } else {
                    document.getElementById("message").style.color = "red";
                    document.getElementById("message").innerHTML = "Password does not match!";
                }
            }

            function checkDegree() {
                var select = document.getElementById("degree").value;
                window.location.replace("user_register.jsp?deg_JS=" + select);
            }

            window.onload = function() {
                if (sessionStorage.getItem('roll_no') == 'roll_no') {
                    return;
                }
                var roll_no = sessionStorage.getItem("roll_no");
                if (roll_no !== null) $('#roll_no').val(roll_no);
                var name = sessionStorage.getItem("name");
                if (name !== null) $('#name').val(name);
                var email = sessionStorage.getItem("email");
                if (email !== null) $('#email').val(email);
                var password = sessionStorage.getItem("password");
                if (password !== null) $('#password').val(password);
                var confirm_password = sessionStorage.getItem("confirm_password");
                if (confirm_password !== null) $('#confirm_password').val(confirm_password);
                var degree = sessionStorage.getItem("degree");
                if (degree !== null) $('#degree').val(degree);
            }

            window.onbeforeunload = function() {
                sessionStorage.setItem("roll_no", $('#roll_no').val());
                sessionStorage.setItem("name", $('#name').val());
                sessionStorage.setItem("email", $('#email').val());
                sessionStorage.setItem("password", $('#password').val());
                sessionStorage.setItem("confirm_password", $('#confirm_password').val());
                sessionStorage.setItem("degree", $('#degree').val());
            }
        </script>
    </head>

    <body>
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
        <!-- Preloader Start-->


        <!-- Register -->

        <main class="login-body">
            <!-- Login Admin -->
            <form class="form-default" name="myform" action="user_register.jsp" method="POST">

                <div class="login-form reg">
                    <!-- logo-login -->
                    <div class="logo-login">
                        <a href="index.jsp"><img src="assets/img/logo/logo2_footer.png" height="100px"  alt=""></a>
                    </div>
                    <h2>Register Here</h2>
                    <p>*All fields are mandatory</p>

                    <div class="form-input">
                        <input type="text" name="roll_no" id="roll_no" placeholder="user ID"  title="Enter valid roll number" required>
                    </div>
                    <div class="form-input">
                        <input type="text" name="name" id="name" placeholder="Full name"  title="Enter First Name and Last Name" required>
                    </div>
                    <div class="form-input">
                        <input name="email" id="email" placeholder="Email ID"  title="Must be like : characters@characters.domain" required>
                    </div>
                    <div class="form-input">
                        <input type="password" id="password" name="password" placeholder="Password"  title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                    </div>
                    <div class="form-input">
                        <input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" onkeyup="check();" required>
                        <span id="message"></span>
                    </div>

                    
                            <div class="form-input pt-30">
                                <input type="submit" name="submit" value="Send Request">
                            </div>
                            <!-- Forget Password -->
                            <a href="user_login.jsp" class="registration">Already have an account?<b> Login here </b> </a>
                </div>

                <%
	// getting all required fields of registration of user for validation
	String no = request.getParameter("roll_no");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	String degree = "btech";
	String course = "btech";
	String year = "2";
	try
	{
		// register the driver
		Class.forName("com.mysql.jdbc.Driver");

		// establish the connection
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/complaint","root","");

		// create a SQL statement
		Statement stmt = con.createStatement();
		String sql = "insert into user (roll_no, name, email_id, password, degree, course, year) values('" + no + "','" + name + "','" + email + "',SHA1('" + password + "'),'" + degree + "','" + course + "','" + year + "')"; 

		// execute the SQL statement
		stmt.executeUpdate(sql);

		// close the connection
		stmt.close();
		con.close();

		// redirects to home page
		response.sendRedirect("index.jsp");
	}
	catch(Exception e)
	{
		out.println(e);
	}
%>
            </form>
            <!-- /end login form -->
        </main>

        <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
        <!-- Jquery, Popper, Bootstrap -->
        <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
        <script src="./assets/js/popper.min.js"></script>
        <script src="./assets/js/bootstrap.min.js"></script>
        <!-- Jquery Mobile Menu -->
        <script src="./assets/js/jquery.slicknav.min.js"></script>

        <!-- Video bg -->
        <script src="./assets/js/jquery.vide.js"></script>

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