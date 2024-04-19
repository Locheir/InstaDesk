<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>Document</title>
    	<link rel="stylesheet" href="style/product.css">
    	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	</head>
	<body>
		<nav id="navbar" >
		<%@page import="java.sql.*"%>
        <%@page import="java.io.*" %>
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
        </label>-->
    
        <div id="logo">
            <img src="images/main_logo.jpg" alt="Arohan">
        </div>
    
        <ul class="items">
            <li class="item"><a href="home.jsp">Home</a></li>
            <li class="item"><a href="service.jsp">Services</a></li>
            <li class="item"><a href="about_us.jsp">About Us</a></li>
            <li class="item"><a href="#">PC Builder</a></li>
            <li class="item"><a href="contact.jsp">Contact Us</a></li>
            <button><a href="<%= str2 %>"><%= str %></a></button>
        </ul>
    	
    	</nav>
    <section class="search-bar">
        <div class="navbar-b">
            <div class="dropdown">
                    <form id="search_cat" action="categorie" method="post">
                    <select id="redirectSelect" name="categorie" onchange="redirectToPage()">
                        <option value="categorie">Categories</option>
                        <option value="processor" name="categorie">Processor</option>
                        <option value="ram" name="categorie">Ram</option>
                        <option value="motherboard" name="categorie">Motherboard</option>
                        <option value="categorie">Storage</option>
                        <option value="categorie">Power Supply</option>
                        <option value="graphicscard" name="categorie">Graphics Card</option>
                        <option value="categorie">Cooling Fan</option>
                    </select>
                </form>
            </div>
            <div class="search">
            	<form id="searchForm" action="search_result" method="POST">
                	<input type="search" id="searchInput" name="query" placeholder="Search..." >
                </form>
                <i class="fa-solid fa-magnifying-glass"></i>
                
            </div>
            <div class="cart">
            
            <%
            int count = 0;
            	try{
            		
            		Class.forName("com.mysql.cj.jdbc.Driver");
    				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
    			
    				Statement st = con.createStatement();
    				
    				ResultSet rs = st.executeQuery("SELECT * FROM cart");
    				
    				
    				while(rs.next()){
    					
    					int temp = rs.getInt(6);
    					count = count + temp;
    					
    				}
            		
    				st.close();
    				con.close();
    				
            	}catch(Exception e){
            		e.printStackTrace();
            	}
            %>
            
                <i class="fa-solid fa-cart-shopping"></i><p id="count"><%= count %></p>
            </div>
        </div>
    </section>
    	<section class="container">
        <div id="root1">
        	
        	<%
        	
        	try {
    			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
				
				String search_qry = session.getAttribute("search_info").toString();
				
				Statement st = con.createStatement();
				
				ResultSet rs = st.executeQuery("SELECT * FROM producttb WHERE prod_name LIKE '%"+search_qry+"%'");
				
				while(rs.next()) {
					
					out.print("<div class='box'>");
					out.print("	   <div class='img-box'>");
	                out.print("        <img src='img_into_db/"+rs.getString(3)+"'></img>");
	            	out.print("    </div>");
	            	out.print("    <div class='left'>");
	                out.print("        <p>"+rs.getString(2)+"</p>");
	                out.print("        <h2>Rs"+rs.getInt(5)+" Rs</h2>");
	                if(session.getAttribute("log_name")==null){
	                	out.print("        <a href='login.html' class='addtocart' >Add to Cart</a>");
	                }else{
	                	out.print("<form action='addtocart' method='post'>");
	                	out.print("        <input type='hidden' name='item_id' value="+rs.getInt(1)+">");
	                	out.print("        <button class='addtocart'>Add to Cart </button>");
	                	out.print("</form>");
	                }
	            	out.print("    </div>");
	        		out.print("</div>");
			
				}
				
				con.close();
			
			}catch(Exception e){
			
				e.printStackTrace();
			
			}
        	%>
        </div>
        <div class="sidebar">
            <div class="head">MyCart</div>
            <%
            
            if(session.getAttribute("prod_first")==null){
            	
            	out.print("<div id='cartItem'>Your cart is empty</div>");
            	
            }else{
            	
            	try{
            		Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
			
					Statement st = con.createStatement();
			
					ResultSet rs = st.executeQuery("SELECT * FROM cart");
					
					while(rs.next()) {
						
						out.print("<div class='cart-item'>");
	                    out.print("    <div class='row-item'>");
	                    out.print("        <img class='rowimg' src='img_into_db/"+rs.getString(3)+"'>");
	                    out.print("    </div>");
	                    out.print("	   <p style='font-size: 12px;'>"+rs.getString(2)+"</p>");
	                    out.print("	   <h2 style='font-size: 15px;'>"+rs.getString(5)+"</h2>");
	                    out.print("    <p style='font-size: 20px;'>"+rs.getInt(6)+"</p>");
	                    out.print("	   <form action='deletefromcart' method='post'>");
	                    out.print("        <input type='hidden' name='item_id' value="+rs.getInt(1)+">");
	                    out.print("        <button class='trash_btn'><i class='fa-solid fa-trash' ></i></button>");
	                    out.print("    </form>");
						out.print("</div>");
					}
					
            	}catch(Exception e){
            		e.printStackTrace();
            	}
            	
            }
            
            %>
            
            <div class="foot">
                <h3>Total</h3>
                
                <%
                
                    double total_price = 0.00;
                	
                	try{
                		
                		Class.forName("com.mysql.cj.jdbc.Driver");
        				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
        			
        				Statement st = con.createStatement();
        				
        				ResultSet rs = st.executeQuery("SELECT * FROM cart");
        				
        				
        				while(rs.next()){
        					
        					double temp = rs.getInt(5) * rs.getInt(6);
        					total_price += temp;
        				}
                		
                	}catch(Exception e){
                		e.printStackTrace();
                	}
                
                %>
                
                <h2 class="total">Rs <%= total_price %></h2>
            </div>
            <div>
            	<%
            			if(count>0){
            				
            				out.print("<form action='payment.jsp'>");
            				out.print("    <button class='addtocart'> Payment</button>");
            				out.print("</form>");
            				
            			}else{
            				
            				out.print("<button type='' class='addtocart'>Payment </button>");
            				
            			}
            	
            	%>
            	
            </div>
        </div>
    	</section>
    	<script>
    	function redirectToPage() {
        	var selectedPage = document.getElementById("redirectSelect").value
        	event.preventDefault(); // Prevent default form submission
        	document.getElementById('search_cat').submit(); 
    	}
    		
    		function redirectToSearch(event) {
    			  if (event.keyCode === 13) { // Check if Enter key is pressed
    			    event.preventDefault(); // Prevent default form submission
    			    var query = document.getElementById('searchInput').value;
    			    if (query.trim() !== '') {
    			      document.getElementById('searchForm').submit(); // Submit the form
    			    }
    			  }
    			}

    			// Add event listener to the input field
    			document.getElementById('searchInput').addEventListener('keypress', redirectToSearch);
    	</script>
	</body>
</html>