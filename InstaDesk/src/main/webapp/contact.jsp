<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact</title>
    <link rel="stylesheet" href="style/contact.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap" rel="stylesheet">
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
        <!-- <input type="checkbox" id="check">
        <label for="check" class="checkbtn">
            <i class="fa-solid fa-bars"></i>
        </label> -->

        <div id="logo">
            <img src="images/main_logo.jpg" alt="Arohan">
        </div>
    
        <ul class="items">
            <li class="item"><a href="home.jsp">Home</a></li>
            <li class="item"><a href="service.jsp">Services</a></li>
            <li class="item"><a href="product.jsp">Our Products</a></li>
            <li class="item"><a href="about_us.jsp">About Us</a></li>
            <li class="item"><a href="#">PC Builder</a></li>
            <button><a href="<%= str2 %>"><%= str %></a></button>
        </ul>
    
    </nav>
    <section class="contact-section">
        <div class="contact-bg">
            <h3>Get in Touch with Us</h3>
            <h2>contact us</h2>
            <div class="line">
                <div></div>
                <div></div>
                <div></div>
            </div>
            <p class="text">You can freely contact us , you can easily access us the services and in case of any queries you can fill the form and request for help</p>
        </div>

        <div class="contact-body">
            <div class="contact-info">
                <div>
                    <span><i class="fas fa-solid fa-mobile-screen-button"></i></span>
                    <span>Phone No</span>
                    <span class="text">9307651681</span>
                </div>
                <div>
                    <span><i class="fas fa-solid fa-envelopes-bulk"></i></span>
                    <span>Email</span>
                    <span class="text">instadesk@gmail.com</span>
                </div>
                <div>
                    <span><i class="fas fa-solid fa-location-dot"></i></span>
                    <span>Address</span>
                    <span class="text">Aundh Road,Near Petrol Pump,Pune-411020</span>
                </div>
                <div>
                    <span><i class="fas fa-solid fa-clock"></i></span>
                    <span>Opening Hours</span>
                    <span class="text">24/7</span>
                </div>
            </div>

            <div class="contact-form">
                <form action="contact" method="post">
                    <div>
                        <input type="text" class="form-control" name="fname" required placeholder="First Name">
                        <input type="text" class="form-control" name="lname" required placeholder="Last Name">
                    </div>
                    <div>
                        <input type="email" class="form-control" name="email" required placeholder="E-mail">
                        <input type="number" class="form-control" name="phone" required placeholder="Phone">
                    </div>
                    <textarea name="msg" rows="5" 
                    placeholder="Message" class="form-control" required></textarea>
                    <input type="submit" class="send-btn" value="send message">
                </form>
                <div>
                    <img src="images/contact-png.png" alt="">
                </div>
            </div>
        </div>

        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15128.86020033048!2d73.8206225891141!3d18.564341044796375!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2bf579f0cfe3d%3A0xd2153149859872d5!2sSunshine%20Greens%2C%20Chikhalwadi%2C%20Bopodi%2C%20Pune%2C%20Maharashtra%20411020!5e0!3m2!1sen!2sin!4v1709807045280!5m2!1sen!2sin" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>

    <footer>
        <div class="center whi">
            Copyright &copy; www.instadesk.com. All rights reserved!
        </div>
        
    </footer>
</body>
</html>