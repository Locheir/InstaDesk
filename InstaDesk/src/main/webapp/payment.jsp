<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<title>Checkout</title>
    	<link rel="stylesheet" href="style/payment.css">
    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<%! String fname,lname,email,address="",state="",country="",contact="",zipcode="";
		
			String date = java.time.LocalDate.now().toString();
		
		%>
		
		<div class="container">
        <div class="py-5 text-center">
          
          <h2 class="my_heading">Checkout Form</h2>
        </div>
        <div class="mohit_border">
        <div class="row">
          <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-muted">Your cart</span>
              
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
              <span class="badge badge-secondary badge-pill"><%=count %></span>
            </h4>
            <ul class="list-group mb-3">
            
            <%
            
            try{
        		Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
		
				Statement st = con.createStatement();
		
				ResultSet rs = st.executeQuery("SELECT * FROM cart");
				
				while(rs.next()) {
					
					out.print("<li class='list-group-item d-flex justify-content-between lh-condensed'>");
                    out.print("    <div>");
                    out.print("        <h6 class='my-0'>"+rs.getString(2)+"</h6>");
                    out.print("    	   <small class='text-muted'>"+rs.getString(4)+"</small>");
                    out.print("	   </div>");
                    out.print("	   <span class='text-muted'>"+rs.getInt(6)+"</span>");
                    out.print("    <span class='text-muted'>Rs "+rs.getInt(5)+"</span>");
                    out.print("</li>");
				}
				
        	}catch(Exception e){
        		
        		e.printStackTrace();
        		
        	}
            
            %>
              
              <!-- <li class="list-group-item d-flex justify-content-between bg-light">
                <div class="text-success">
                  <h6 class="my-0">Promo code</h6>
                  <small>EXAMPLECODE</small>
                </div>
                <span class="text-success">-$5</span>
              </li> -->
              <li class="list-group-item d-flex justify-content-between">
                <span>Total Price</span>
                
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
                
                <strong>Rs <%= total_price %></strong>
              </li>
            </ul>
      
            <!--  <form class="card p-2">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Promo code">
                <div class="input-group-append">
                  <button type="submit" class="btn btn-secondary">Redeem</button>
                </div>
              </div>
            </form>-->
          </div>
          
          <%
          
          int id = (Integer)session.getAttribute("first");
  		try{
  			
  			Class.forName("com.mysql.cj.jdbc.Driver");
  			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
  		
  			Statement st = con.createStatement();
  		
  			ResultSet rs = st.executeQuery("SELECT * FROM logintb WHERE cust_id = "+id+"");
  			
  			while(rs.next()){
  				
  				fname=rs.getString(2);
  				lname=rs.getString(3);
  				email=rs.getString(4);
  			}
  			
  		}catch(Exception e){
  			
  			e.printStackTrace();
  			
  		}
          
          %>
          
          <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" action="payment_process" method="post">
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="firstName">First name</label>
                  <input type="text" class="form-control" id="firstName" placeholder="" value="<%=fname %>" required>
                  <div class="invalid-feedback">
                    Valid first name is required.
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="lastName">Last name</label>
                  <input type="text" class="form-control" id="lastName" placeholder="" value="<%=lname %>" required>
                  <div class="invalid-feedback">
                    Valid last name is required.
                  </div>
                </div>
              </div>
      
              <div class="mb-3">
                <label for="username">Username</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">@</span>
                  </div>
                  <input type="text" class="form-control" id="username" placeholder="Username" value="<%= email %>" required>
                  <div class="invalid-feedback" style="width: 100%;">
                    Your username is required.
                  </div>
                </div>
              </div>
      
              <div class="mb-3">
                <label for="email">Email <span class="text-muted">(Optional)</span></label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com" value="<%=email%>">
                <div class="invalid-feedback">
                  Please enter a valid email address for shipping updates.
                </div>
              </div>
      
      			<%
      			try{
      			Class.forName("com.mysql.cj.jdbc.Driver");
    			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/instadest_db","root","mohitgupta@64!");
    		
    			Statement st = con.createStatement();
    			
    			ResultSet rs = st.executeQuery("SELECT * FROM custinfo WHERE cust_id = "+id+"");
    			int i;
    			if(rs.next()){
    				
    				address=rs.getString(2);
    				state=rs.getString(3);
    				country = rs.getString(4);
    				long l = rs.getLong(5);
    				contact = ""+l;
    				long z = rs.getInt(7);
    				zipcode = ""+z;
    				
    			}
    			
    			
    			rs.close();
    			con.close();
    			
      			}catch(Exception e){
      				
      				
      			}
      			%>
      
              <div class="mb-3">
                <label for="address">Address</label>
                <input type="text" class="form-control" id="address" placeholder="" value="<%=address %>" required>
                <div class="invalid-feedback">
                  Please enter your shipping address.
                </div>
              </div>
      
              <!--  <div class="mb-3">
                <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
                <input type="text" class="form-control" id="address2" placeholder="">
              </div> -->
      
              <div class="row">
                <div class="col-md-5 mb-3">
                  <label for="country">Country</label>
                  <select class="custom-select d-block w-100" id="country" name="country" required>
                    <option value="">Choose...</option>
                    <option value="USA" <% if(country.equals("USA")){out.print("selected");} %>>USA</option>
                    <option value="Canada" <% if(country.equals("Canada")){out.print("selected");} %>>Canada</option>
                    <option value="UK" <% if(country.equals("UK")){out.print("selected");} %>>UK</option>
                    <option value="Germany" <% if(country.equals("Germany")){out.print("selected");} %>>Germany</option>
                    <option value="France" <% if(country.equals("France")){out.print("selected");} %>>France</option>
                    <option value="India" <% if(country.equals("India")){out.print("selected");} %>>India</option>
                  </select>
                  <div class="invalid-feedback">
                    Please select a valid country.
                  </div>
                </div>
                <div class="col-md-4 mb-3">
                  <label for="state">State</label>
                  <input type="text" class="form-control" id="state" value="<%=state %>" placeholder="">
                  <!-- <select class="custom-select d-block w-100" id="state" required>
                    <option value="">Choose...</option>
                    <option>California</option>
                  </select> -->
                  <div class="invalid-feedback">
                    Please provide a valid state.
                  </div>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="zip">Zip</label>
                  <input type="text" class="form-control" id="zip" placeholder="" value="<%=zipcode%>"required>
                  <div class="invalid-feedback">
                    Zip code required.
                  </div>
                </div>
              </div>
              <hr class="mb-4">
              <!-- <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="same-address">
                <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
              </div>
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input" id="save-info">
                <label class="custom-control-label" for="save-info">Save this information for next time</label>
              </div>
              <hr class="mb-4"> -->
      
              <h4 class="mb-3">Payment</h4>
      
              <div class="d-block my-3">
                <div class="custom-control custom-radio">
                  <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                  <label class="custom-control-label" for="credit">Credit card</label>
                </div>
                <div class="custom-control custom-radio">
                  <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="debit">Debit card</label>
                </div>
                <!-- <div class="custom-control custom-radio">
                  <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                  <label class="custom-control-label" for="paypal">PayPal</label>
                </div> -->
              </div>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="cc-name">Name on card</label>
                  <input type="text" class="form-control" id="cc-name" placeholder="" name="name_on_card" required>
                  <small class="text-muted">Full name as displayed on card</small>
                  <div class="invalid-feedback">
                    Name on card is required
                  </div>
                </div>
                <div class="col-md-6 mb-3">
                  <label for="cc-number">Credit/Debit card number</label>
                  <input type="number" class="form-control" id="cc-number" placeholder="" name="card_num" required>
                  <div class="invalid-feedback">
                    Credit/Debit card number is required
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-3 mb-3">
                  <label for="cc-expiration">Expiration</label>
                  <input type="text" class="form-control" id="cc-expiration" placeholder="" name="expirey" required>
                  <div class="invalid-feedback">
                    Expiration date required
                  </div>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="cc-cvv">CVV</label>
                  <input type="number" class="form-control" id="cc-cvv" placeholder="" name="cvv" required>
                  <div class="invalid-feedback">
                    Security code required
                  </div>
                </div>
              </div>
              <hr class="mb-4">
              <button class="save_btn btn-block" type="submit">PAY</button>
              <input type="hidden" value="<%=total_price%>" name="total_price">
              <input type="hidden" value="<%=count %>" name="count">
            </form>
          </div>
        </div>
    </div>
         <footer class="my-5 pt-5 text-muted text-center text-small">
          <p class="mb-1">&copy; Instadesk</p>
          <!-- <ul class="list-inline">
            <li class="list-inline-item"><a href="#">Privacy</a></li>
            <li class="list-inline-item"><a href="#">Terms</a></li>
            <li class="list-inline-item"><a href="#">Support</a></li>
          </ul> -->
        </footer>
      </div>
	</body>
</html>