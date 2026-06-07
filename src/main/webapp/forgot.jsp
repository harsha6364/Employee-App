<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Reset Password</title>
	<style type="text/css">
	@charset "UTF-8";
*{
	margin:0;
	padding:0;
}

body{
	font-family: "Segoe UI", sans-serif;
}

.container{
    height: 100vh;
	display:flex;
	justify-content:center;
    align-items: center;
	background-color:#fff;
    

}

form{
    display: flex;
    justify-content: center;
    align-items: center;
    background:white;
    padding:40px;
    border-radius:15px;
    width:350px;
    box-shadow:0 0px 30px rgba(0,0,0,0.2);
}
td{
    padding:8px 0;
}

input{
    width:100%;
    padding:4px;
    border:1px solid #ccc;
    border-radius:8px;
    font-size:15px;
    box-sizing:border-box;
}

input:focus{
    outline:none;
    border-color:#ea6666;
    box-shadow:0 0 5px rgba(234, 102, 102, 0.5);
}

button{
    width:100%;
    padding:10px;
    border:none;
    border-radius:8px;
    /* margin-top:10px; */
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

button[type="submit"]{
    background:#fe741d;
    color:white;
}

button[type="submit"]:hover{
    background:#ff5f09;
}

#back{
    width:100%;
    padding:10px;
    border:none;
    background:#b9b9b9;
    border-radius:8px;
    /* margin-top:10px; */
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

.toast {
        position: fixed;
        top: 30px;
        right: 30px;
        background: #d4ffe089;
        color: #0f5132;
        width: 320px;
        padding: 20px;
        border: 1px solid hsla(6, 100%, 76%, 0.553);
        border-radius: 10px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        display: flex;
        align-items: flex-start;
        gap: 15px;
        transform: translateX(120px);
        opacity: 0;
        transition: 0.5s ease;
        z-index: 999;
      }

      .toast.show {
        transform: translateY(0);
        opacity: 1;
      }

      .toast .icon {
        width: 35px;
        height: 35px;
        background: #0dff72;
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 18px;
      }

      .toast h3 {
        margin-bottom: 5px;
        font-size: 30px;
      }

      .toast p {
        font-size: 18px;
      }


      /* for error message */
      .etoast {
        position: fixed;
        top: 30px;
        right: 30px;
        background: #fdcdc785;
        color: #510f0f;
        width: 320px;
        padding: 20px;
        border: 1px solid hsla(15, 100%, 76%, 0.553);
        border-radius: 10px;
        box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        display: flex;
        align-items: flex-start;
        gap: 15px;
        transform: translateX(120px);
        opacity: 0;
        transition: 0.5s ease;
        z-index: 999;
      }

      .etoast.show {
        transform: translateY(0);
        opacity: 1;
      }

      .etoast .icon {
        width: 35px;
        height: 35px;
        background: #872b19;
        color: white;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        font-size: 18px;
      }

      .etoast h3 {
        margin-bottom: 5px;
        font-size: 22px;
      }

      .etoast p {
        font-size: 18px;
      }
	
	</style>   
  </head>
  <body>
    <div class="container">
      <form action="forgotPassword" method="POST">
        <table>
			<tr><td><h1>Reset Password</h1></td></tr>
          
			<%
			String error = (String)session.getAttribute("error");%>
			<% if(error != null){ %>

			<div id="etoast" class="etoast">
			    <div class="icon">✖</div>
			    <div>
			        <h3>Error</h3>
			        <p><%= error %></p>
			    </div>
			</div>

			<% } 
			session.removeAttribute("error");%>
			
			<%
			String success = (String)session.getAttribute("success");
			session.removeAttribute("success");
			%>
			<%if(success != null){ %>
			<div id="toast" class="toast">
        		<div class="icon">✔</div>
        		<div>
          		<h3>Success</h3>
          		<p><%= success %></p>
        		</div>
      		</div>
			<%} %>
			
			
          <tr>
            <td>Enter your mail</td>
          </tr>
          
          <tr>
            <td><input type="mail" name="mail" /></td>
          </tr>
          

          <tr>
            <td>Enter new password</td>
          </tr>
          <tr>
            <td><input type="password" name="password" /></td>
          </tr>

          <tr>
            <td>Confirm password</td>
          </tr>
          <tr>
            <td><input type="password" name="confirmPassword" /></td>
          </tr>
			
          <tr>
            <td><button type="submit">Reset Password</button></td>
          </tr>
          <tr>
    		<td>
        		<button type="button" id="back" onclick="window.location.href='dashboard.jsp'">Back</button>
    		</td>
		</tr>
        </table>
          
      </form>
    </div>
    
    <script type="text/javascript">
    const toast = document.getElementById("toast");

    if (toast) {

        setTimeout(() => {
            toast.classList.add("show");
        }, 100);

        setTimeout(() => {
            toast.classList.remove("show");
        }, 3000);
    }


    const etoast = document.getElementById("etoast");

    if (etoast) {

        setTimeout(() => {
            etoast.classList.add("show");
        }, 100);

        setTimeout(() => {
            etoast.classList.remove("show");
        }, 3000);
    }
    </script>
  </body>
</html>
