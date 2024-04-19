<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instadesk</title>
    <link rel="stylesheet" href="style/home.css">
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
   
</head>
<body>
   
    <nav id="navbar" >

        <!-- <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fa-solid fa-bars"></i>
        </label>-->

        <div id="logo">
            <img src="images/main_logo.jpg" alt="Arohan">
        </div>
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
        <ul class="items">
            <li class="item"><a href="service.jsp">Services</a></li>
            <li class="item"><a href="product.jsp">Our Products</a></li>
            <li class="item"><a href="about_us.jsp">About Us</a></li>
            <li class="item"><a href="#">PC Builder</a></li>
            <li class="item"><a href="contact.jsp">Contact Us</a></li>
            <button><a href="<%= str2 %>"><%= str %></a></button>
        </ul>
    
    </nav>

    <section class="header">
        <div class="about-us">
            <h1>Ultimate Destination for High Quality Second Hand Product</h1>
            <p>
                Best Place to buy PC Products that are very high quality and you can easily have maintainence of these products as well as we also provide maintainence related services.
            </p>
            <a href="service.jsp" class="hero-btn">Book Now for More Details</a>
        </div>
    </section>
	
    <section class="products">
        <h1>Products We Offer</h1>
        <p>We offer 3 Categories of Products </p>

        <div class="row">
            <div class="prod_col">
                <h3>PC Build</h3>
                <p>In the realm of technology, where innovation is relentless and performance is paramount, the creation of a high-quality PC build is akin to crafting a masterpiece. It entails a meticulous selection of components, an understanding of cutting-edge technologies</p>
            </div>
            <div class="prod_col">
                <h3>2nd Hand Parts</h3>
                <p>In the ever-evolving landscape of technology, the allure of the latest and greatest hardware often overshadows the hidden gems that lie within the realm of second-hand computer parts. While the allure of brand-new components is undeniable, the world of refurbished.</p>
            </div>
            <div class="prod_col">
                <h3>New Parts</h3>
                <p>In the digital age, the personal computer (PC) stands as a cornerstone of modern life, facilitating communication, productivity, entertainment, and beyond. Yet, behind the sleek exteriors and intuitive interfaces lie a myriad of intricate components working in harmony to power these indispensable machines. </p>
                </p>
            </div>
        </div>
    </section>

    <section class="services">

        <h1>Services We Offer</h1>
        <p>We provide 3 Types of Services</p>

        <div class="row">
            <div class="services_col">
                <img src="images/service11.jpg" alt="Desktop Repair">
                <div class="layer">
                    <h3>Desktop Repair</h3>
                </div>
            </div>
            <div class="services_col">
                <img src="images/service2.jpg" alt="Desktop Repair">
                <div class="layer">
                    <h3>Desktop Cleaning</h3>
                </div>
            </div>
            <div class="services_col">
                <img src="images/service3.jpg" alt="Desktop Repair">
                <div class="layer">
                    <h3>Resolve Software Issues</h3>
                </div>
            </div>
        </div>
        
        
    </section>

    <section class="queries">
        <h1>For Any Queries Related To Our Software & Hardware <br> You Can Reach Us</h1>
        <a href="contact.jsp" class="hero-btn">CONTACT US</a>
    </section>

    <section class="socials">
        <h3>You Can Find Us At</h3>
        <p>We are available on LinkedIn, Instagram as well as Whatsapp.</p> 
        <div class="icons">
            <a href=""><i class="fa fa-brands fa-instagram"></i></a>
            <a href=""><i class="fa fa-brands fa-linkedin"></i></a>
            <a href=""><i class="fa fa-brands fa-whatsapp"></i></a>
        </div>

    </section>
    <footer>
        <div class="center whi">
            Copyright &copy; www.instadesk.com. All rights reserved!
        </div>
        
    </footer>
    
</body>
</html>