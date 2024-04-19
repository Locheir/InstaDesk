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
	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Account</title>
    <link rel="stylesheet" href="style/account.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<%! String fname,lname,email,address="",state="",country="",contact="",zipcode="";
		
	%>
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
	<div class="container light-style flex-grow-1 container-p-y">
        <h4 class="font-weight-bold py-3 mb-4">
            Account settings
        </h4>
        <div class="card overflow-hidden">
            <div class="row no-gutters row-bordered row-border-light">
                <div class="col-md-3 pt-0">
                    <div class="list-group list-group-flush account-settings-links">
                        <a class="list-group-item list-group-item-action active" data-toggle="list"
                            href="#account-general">General</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-change-password">Change password</a>
                        <a class="list-group-item list-group-item-action" data-toggle="list"
                            href="#account-info">Information</a>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="tab-content">
                        <div class="tab-pane fade active show" id="account-general">
                            <hr class="border-light m-0">
                            <div class="card-body">
                                <form action="change_general" method="post">
                                    <div class="form-group">
                                        <label class="form-label">First Name</label>
                                        <input type="text" name="fname" class="form-control mb-1" value="<%= fname %>" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Last Name</label>
                                        <input type="text" name="lname" class="form-control" value="<%= lname %>" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">E-mail</label>
                                        <input type="email" name="email" class="form-control mb-1" value="<%= email %>" required>
                                        <!-- <div class="alert alert-warning mt-3">
                                            Your email is not confirmed. Please check your inbox.<br>
                                            <a href="javascript:void(0)">Resend confirmation</a>
                                        </div> -->
                                    </div>
                                    <div class="form-group text-right mt-3">
                                        <button type="submit" class="save_btn">Save changes</button>&nbsp;
                                        <!-- <button type="button" class="btn btn-default">Cancel</button> -->
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-change-password">
                            <div class="card-body pb-2">
                                <form action="change_password" method="post">
                                    <div class="form-group">
                                        <label class="form-label">Current password</label>
                                        <input type="password" name="cpassword"class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">New password</label>
                                        <input type="password" name="npassword"class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label class="form-label">Repeat new password</label>
                                        <input type="password" name="rnpassword" class="form-control">
                                    </div>
                                    <div class="text-right mt-3">
                                        <button type="submit" class="save_btn">Save changes</button>&nbsp;
                                        <!-- <button type="button" class="btn btn-default">Cancel</button> -->
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="account-info">
                        
                        <%
                        	
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
            		
                        
                        %>
                        
                            <form action="change_info" method="post">
                                <div class="card-body pb-2">
                                    <div class="form-group">
                                        <label class="form-label">Address</label>
                                        <textarea class="form-control"
                                            rows="5" name="address"><%= address %></textarea>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="form-label">Zip code</label>
                                        <input type="number" class="form-control" name="zipcode" value="<%= zipcode %>">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="form-label">State</label>
                                        <input type="text" class="form-control" name="state"value="<%= state %>">
                                    </div>
                                    
                                    <div class="form-group">
                                        <label class="form-label">Country</label>
                                        <select class="custom-select" name="country">
                                            <option value="USA" <% if(country.equals("USA")){out.print("selected");} %>>USA</option>
                                            <option value="Canada" <% if(country.equals("Canada")){out.print("selected");} %>>Canada</option>
                                            <option value="UK" <% if(country.equals("UK")){out.print("selected");} %>>UK</option>
                                            <option value="Germany" <% if(country.equals("Germany")){out.print("selected");} %>>Germany</option>
                                            <option value="France" <% if(country.equals("France")){out.print("selected");} %>>France</option>
                                            <option value="India" <% if(country.equals("India")){out.print("selected");} %>>India</option>
                                        </select>
                                    </div>
                                </div>
                                <hr class="border-light m-0">
                                <div class="card-body pb-2">
                                    <h6 class="mb-4">Contacts</h6>
                                    <div class="form-group">
                                        <label class="form-label">Phone</label>
                                        <input type="number" class="form-control" name="contact" value="<%= contact %>">
                                    </div>
                                </div>
                                <div class="text-right card-body pb-2">
                                    <button type="submit" class="save_btn">Save changes</button>&nbsp;
                                    <!-- <button type="button" class="btn btn-default">Cancel</button> -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-right row">
        <form action="logout" method="post">
        	<div class="text-right mt-3">
        		<button type="submit" class="save_btn">Logout</button>
        	</div>
        </form>
        <form action="home.jsp" method="post">
        	
            <div class="text-right mt-3">
                <button type="submit" class="save_btn">Return</button>&nbsp;
            </div> 
        </form>
        </div>
    </div>
    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript">

    </script>
</body>
</html>