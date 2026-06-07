<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>

    <style>
      body {
        margin: 0;
        padding: 0;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: Arial, sans-serif;

        /* Glass background */
        background: linear-gradient(135deg, #ffffff, rgb(255, 255, 255));
      }
      h2{
      text-align: center;
        }
      

      form {
        background: rgba(255, 255, 255, 0.2);
        backdrop-filter: blur(2px);
        -webkit-backdrop-filter: blur(2px);

        padding: 40px;
        border-radius: 15px;

        border: 1px solid rgb(255, 255, 255);

        box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.2);

        width: 320px;
      }

      table {
        width: 100%;
      }

      td {
        padding: 10px 0;
        font-size: 16px;
        color: #333;
      }

      input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        outline: none;
        transition: 0.3s;
        box-sizing: border-box;
      }

      input:focus {
        border-color: #fe864f;
        box-shadow: 0 0 8px #ff9500;
      }

      button {
        width: 100%;
        padding: 12px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
        margin-top: 10px;
      }

      button:hover {
        background: rgb(0, 98, 195);
        transform: scale(1.03);
      }

      #forgotPassword {
        /* text-decoration: none; */
        /* color: black; */
      }

      .error {
        color: red;
        text-align: center;
        font-size: 14px;
      }
      
      .success {
        color: green;
        text-align: center;
        font-size: 14px;
      }

      img {
        position: absolute;
        top: 10%;
        right: 5%;
        z-index: 0;
      }
    </style>
  </head>

  <body>
    <form action="login" method="POST">
      <table>
      <tr><h2>Log into Your Account</h2></tr>
        <tr>
          <td>Enter your mail</td>
        </tr>

        <tr>
          <td>
            <input type="email" name="mail" placeholder="Mail" />
          </td>
        </tr>

        <tr>
          <td>Enter your password</td>
        </tr>

        <tr>
          <td>
            <input type="password" name="password" placeholder="Password" />
          </td>
        </tr>

        <tr>
          <td>
            <button type="submit">Login</button>
          </td>
        </tr>
        
        <% String success = (String)request.getAttribute("login"); 
        if(success !=null){ %>
        <tr>
          <td class="success"><%= success %></td>
        </tr>
        <% } %>

        <% String error = (String)request.getAttribute("error"); 
        if(error != null){ %>
        <tr>
          <td class="error"><%= error %></td>
        </tr>
        <% } %>
        <% String error2 = (String)request.getAttribute("sessionExpired"); 
        if(error2 != null){ %>
        <tr>
          <td class="error"><%= error2 %></td>
        </tr>
        <% } %>
      </table>

      <a id="forgotPassword" href="forgot.jsp"> Forgot password </a>
    </form>
  </body>
</html>
