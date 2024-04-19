<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="style/payment.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <!-- Include Date Range Picker -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

    <script>
        $(document).ready(function(){
            var date_input=$('input[name="date"]'); //our date input has the name "date"
            var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'mm/dd/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
    </script>
  </head>
  <body>
    
    <%! 
    	String fname,lname,email,address="",state="",country="",contact="",zipcode="";
  		
		String date = java.time.LocalDate.now().toString();
	%>
    
    <div class="container">
         <div class="py-5 text-center">
          
          <h2 class="my_heading">SERVICE BOOKING</h2>
        </div>
        <div class="mohit_border">
        <div class="row">
          <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-muted">Your Service</span>
              <span class="badge badge-secondary badge-pill">1</span>
            </h4>
            <ul class="list-group mb-3">
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">PC Software Issues</h6>
                  <small class="text-muted">Rs 200 Visiting Charges</small>
                </div>
                <span class="text-muted">Start @ Rs 900</span>
              </li>
              
            </ul>
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
            <h4 class="mb-3">Customer Address</h4>
            <form class="needs-validation" action="book_pc_issue" method="post">
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
                  <input type="text" class="form-control" id="username" placeholder="Username" value="<%=email %>" required>
                  <div class="invalid-feedback" style="width: 100%;">
                    Your username is required.
                  </div>
                </div>
              </div>
      
              <div class="mb-3">
                <label for="email">Email <span class="text-muted">(Optional)</span></label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com">
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
      
              <div class="row">
                <div class="col-md-5 mb-3">
                  <label for="country">Country</label>
                  <select class="custom-select d-block w-100" id="country" required>
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
                  <input type="text" class="form-control" id="state" placeholder="" value="<%=state%>">
                  <div class="invalid-feedback">
                    Please provide a valid state.
                  </div>
                </div>
                <div class="col-md-3 mb-3">
                  <label for="zip">Zip</label>
                  <input type="text" class="form-control" id="zip" placeholder="" value="<%=zipcode %>" required>
                  <div class="invalid-feedback">
                    Zip code required.
                  </div>
                </div>
              </div>
              <hr class="mb-4">
      
              <h4 class="mb-3">Choose Date & Time</h4>
              <div class="row">
                <div class="col-md-5 mb-3">
                  <div class="form-group"> <!-- Date input -->
                    <label class="control-label" for="date">Date</label>
                    <input class="form-control" id="date" name="date" placeholder="MM/DD/YYY" type="text"/>
                  </div>
                </div>
                <div class="col-md-5 mb-3">
                  <div class="cs-form">
                    <label class="control-label" for="time">Time</label>
                    <input type="time" id="time" class="form-control" name="time" value="10:05 AM" />
                  </div>
                </div>
              </div>
              <hr class="mb-4">
              <div class="d-block my-3">
                <ul>
                  <li>The Charges are not Fixed</li>
                  <li>Charges can vary according to Service</li>
                  <li>Rs 200 fixed for Visiting Charges</li>
                </ul>
              </div>
              <div class="row">
              </div>
              <hr class="mb-4">
              <button class="save_btn btn-block" type="submit">BOOK</button>
            </form>
          </div>
        </div>
    </div>
         <footer class="my-5 pt-5 text-muted text-center text-small">
          <p class="mb-1">&copy; Instadesk</p>
        </footer>
      </div>
</body>
</html>