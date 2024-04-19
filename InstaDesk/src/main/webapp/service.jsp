<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Services</title>
    <link rel="stylesheet" href="style/services.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script>
        // When the user scrolls the page, execute myFunction
        window.onscroll = function() {myFunction()};
    
        // Get the navbar
        var navbar = document.getElementById("navbar");
    
        // Get the offset position of the navbar
        var sticky = navbar.offsetTop;
    
        // Add the sticky class to the navbar when you reach its scroll position. Remove "sticky" when you leave the scroll position
        function myFunction() {
            if (window.pageYOffset >= sticky) {
                navbar.classList.add("sticky")
            } else {
                navbar.classList.remove("sticky");
            }
        }
    </script>

</head>
<body>
	<nav id="navbar" >
	
		<% 
    		String str,str2;
        	
    		if(session.getAttribute("log_name")==null){
    			str = "Login/SignUp";
    			str2 = "login.html";
    		}else{
    			str = session.getAttribute("log_name").toString();
    			str2 = "account.jsp";
    		}
    		
    	%>
	
        <div id="logo">
            <img src="images/main_logo.jpg" alt="Arohan">
        </div>
    
        <ul>
            <li class="item"><a href="home.jsp">Home</a></li>
            <li class="item"><a href="product.jsp">Our Products</a></li>
            <li class="item"><a href="about_us.jsp">About Us</a></li>
            <li class="item"><a href="#">PC Builder</a></li>
            <li class="item"><a href="contact.jsp">Contact Us</a></li>
            <button><a href="<%= str2 %>"><%= str %></a></button>
        </ul>
    
    </nav>
    <div class="container">
        <section class="repair">
            <div class="repair-image">
             <img src="images/repair_service.jpg" alt="desktop repair">
            </div>
            <div class="repair-content">
                <h2>Desktop Repair</h2>
                <p>In the fast-paced world of technology, desktop computers remain steadfast as indispensable tools for work, communication, entertainment, and beyond. Yet, like any complex machine, desktops are susceptible to wear, damage, and malfunctions over time. Desktop repair, therefore, emerges as a critical discipline, combining technical expertise, problem-solving skills, and meticulous attention to detail to restore functionality and prolong the lifespan of these essential devices.</p>
                <%
                	if(session.getAttribute("log_name")==null){
                		out.println("<a href='login.html' class='book-now'>Book Now</a>");
                	}else{
                		out.println("<a href='pc_repair.jsp' class='book-now'>Book Now</a>");
                	}
                %>
            </div>
        </section>
        <section class="repair">
            <div class="repair-image">
             <img src="images/destop_clean.jpg" alt="desktop repair">
            </div>
            <div class="repair-content">
                <h2>Desktop Cleaning</h2>
                <p>In the bustling world of modern computing, desktop computers serve as the nerve center of productivity, creativity, and connectivity. However, amidst the flurry of emails, documents, and applications, desktops often accumulate dust, debris, and clutter that can impede performance, compromise hygiene, and shorten the lifespan of components. Thus, the art of desktop cleaning emerges as a vital practice, combining meticulous attention to detail, effective tools, and proactive strategies to ensure that these essential machines remain efficient, hygienic, and reliable.</p>
                <%
                	if(session.getAttribute("log_name")==null){
                		out.println("<a href='login.html' class='book-now'>Book Now</a>");
                	}else{
                		out.println("<a href='pc_clean.jsp' class='book-now'>Book Now</a>");
                	}
                %>
                
            </div>
        </section>
        <section class="repair">
            <div class="repair-image">.
             <img src="images/software_issue.jpeg" alt="desktop repair">
            </div>
            <div class="repair-content">
                <h2>Resolve Software Issues</h2>
                <p>In today's interconnected world, software serves as the backbone of modern computing, enabling communication, productivity, entertainment, and beyond. Yet, amidst the convenience and efficiency of software-driven solutions, users often encounter a myriad of issues ranging from glitches and bugs to crashes and errors. Resolving software issues requires a combination of technical expertise, problem-solving skills, and a systematic approach to troubleshooting. </p>
                <%
                	if(session.getAttribute("log_name")==null){
                		out.println("<a href='login.html' class='book-now'>Book Now</a>");
                	}else{
                		out.println("<a href='pc_issue.jsp' class='book-now'>Book Now</a>");
                	}
                %>
            </div>
        </section>
    </div>

	<footer>
    	<div class="center whi">
        	Copyright &copy; www.instadesk.com. All rights reserved!
    	</div>
    
	</footer>
</body>
</html>