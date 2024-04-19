<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Service Booked...</title>
    <!-- <script>var time = '' || 5000;
      if ('https://www.google.com') {
        setTimeout(function () {
          //- window.location = "https://www.google.com"
        }, time);
      }
    </script> -->
    <style type="text/css">
      *,
      *:after,
      *:before {
        box-sizing: border-box;
        font-family: Sans-Serif;
      }
      .tick {
        display: inline-block;
        transform: rotate(45deg);
        height: 36px;
        width: 18px;
        border-bottom: solid 3px #0D1F23;
        border-right: solid 3px #0D1F23;
        margin-bottom: 8px;
      }
      .tick-container {
        padding: 20px;
        border-radius: 100px;
        height: 56px;
        width: 56px;
        display: inline-flex;
        justify-content: center;
        align-items: center;
        background: #fff;
        margin-bottom: 12px;
      }
      body {
        background: white;
        margin: 0;
        background: #0D1F23;
        text-align: center;
      }
      .heading {
        font-size: 1.5rem;
        display: flex;
        align-items: center;
        flex-direction: column;
        margin-bottom: 32px;
      }
      .container {
        color: #fff;
        margin: auto;
        padding: 32px 16px 16px;
      }
      .text-container {
        line-height: 1.8em;
      }
      .primary-button {
        color:#0D1F23;
        background-color: #fff;
        padding: 12px 16px;
        display: inline-block;
        margin-top: 32px;
        border-radius: 6px;
        text-decoration: none;
        text-transform: uppercase;
      }
    </style>
  </head>
  <body style="font-family:sans-serif;">
    <div class="container">
      <div class="heading"><span class="tick-container"><i class="tick" style="color:green;">&nbsp;</i></span><span>Service is Booked...</span></div>
      <div class="text-container">
        <div>Click the button to redirected to the website.</div><a class="primary-button" href="home.jsp">Go to Website</a>
      </div>
    </div>
  </body>
</html>