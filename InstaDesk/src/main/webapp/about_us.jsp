<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>About Us</title>
		<link rel="stylesheet" href="style/about_us.css">
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
            <li class="item"><a href="#">About Us</a></li>
            <li class="item"><a href="#">PC Builder</a></li>
            <li class="item"><a href="contact.jsp">Contact Us</a></li>
            <button><a href="<%= str2 %>"><%= str %></a></button>
        </ul>
    
    </nav>
    
    <div class="about_us">
        <div class="about_us_img">
            <img src="images/about-us.jpeg" alt="">
        </div>
        
        
      </div>
      <div class="about_us_desc">
       	<h2>We Manage Your Devices, So You Can Keep Gaming!!</h2>
       	<p>We at INSTADESK pride in completing 1 years of our existence.
            Known in the IT market as a innovator of technology, provider of services, Our Journey has truly been justified to our name.</p>
        <p>We are dedicated to 100% customer delight ensuring that everything from placing your order to delivering it right to your doorstep is smooth and hassle-free. When it comes to online transactions, Mohit And Yash INFOTECH ensures that all credit/debit card and net banking transactions are done through secure and trusted gateways. All your bank details are safe and secure, and will not be shared with any third-party.</p>
        <p>We are one of the leading IT distribution companies in Maharashtra operating since its inception in 2023.</p>
            
        <p>The company is heading to provide full range of PC components to all customers through its wide sales channels</p>
        
         <p>To provide customers superior quality and well-known brand products with best support & excellent after sale services are companys motto.</p>
            
            <p>Currently we are acting as the authorized dealer for all global leading brands e.g. AMD, ASUS ,Cooler Master MSI, Gigabyte, Intel, Logitech , Sapphire, Acer for Maharashtra</p>
 
            <p>We follow through on our commitment to exceptional customer service. Our tech support and service team members are available via phone & e-mail to ensure your utmost satisfaction.</p>
      
            
      </div>
</body>
</html>