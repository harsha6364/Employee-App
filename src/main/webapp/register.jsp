<!doctype html>
<%@page import="com.emp.dto.Employee"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Employee</title>

    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
      }

      body {
        background: rgb(255, 255, 255);
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .container {
        width: 400px;
        background: #ffffff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 6px 15px rgba(74, 74, 74, 0.25);
        /* border-top:6px solid #cc0000; */
      }

      h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #cc5500;
      }

      .form-group {
        margin-bottom: 18px;
      }

      form {
        /* background-color:white; */
      }

      label {
        display: block;
        margin-bottom: 6px;
        font-weight: bold;
        color: #646464;
      }

      input,
      select {
        width: 100%;
        padding: 6px;
        border: 1px solid #949494;
        border-radius: 8px;
        font-size: 15px;
        outline: none;
        transition: 0.3s;
        /* background:linear-gradient(to right bottom,transparent,transparent,transparent, rgb(255, 76, 76)); */
      }

      input:focus,
      select:focus {
        border-color: #cc6600;
        box-shadow: 0 0 6px #ff9500;
      }

      option {
        color: #000;
      }

      .btn {
        width: 100%;
        padding: 8px;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
        font-weight: bold;
        margin-bottom: 10px;
      }

      .btn:hover {
        background: rgb(0, 98, 195);
      }

      #back {
      text-decoration:none;
        width: 100%;
        padding: 8px 150px;
        background: #929292f1;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s;
        font-weight: bold;
      }

      #back:hover {
        background: #7f7f7f;
      }

      .toast {
        position: fixed;
        top: 30px;
        right: 30px;
        background: #c7fdd685;
        color: #0f5132;
        width: 320px;
        padding: 20px;
        border: 1px solid hsla(152, 100%, 76%, 0.553);
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
        background: #198754;
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
        font-size: 22px;
      }

      .toast p {
        font-size: 18px;
      }
    </style>
  </head>

  <body>
  <%Employee emp = (Employee)session.getAttribute("employee"); %>

 <%if(emp == null){
		request.setAttribute("error","Session already expired");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}%>
    <div class="container">
      <h2>Add Employee</h2>

      <form action="register" method="POST">
        <div class="form-group">
          <label>Employee Name</label>
          <input
            type="text"
            name="name"
            placeholder="Enter employee name"
            required
          />
        </div>

        <div class="form-group">
          <label>Job</label>
          <select name="job" required>
            <option value="">-- Select Job --</option>
            <option value="Developer">Developer</option>
            <option value="HR">HR</option>
            <option value="Manager">Manager</option>
            <option value="Tester">Tester</option>
            <option value="Salesman">Salesman</option>
          </select>
        </div>

        <div class="form-group">
          <label>Salary</label>
          <input
            type="number"
            name="salary"
            placeholder="Enter salary"
            required
          />
        </div>

        <div class="form-group">
          <label>Department</label>
          <select name="department" required>
            <option value="">-- Select Department --</option>
            <option value="10">IT</option>
            <option value="20">HR</option>
            <option value="30">Sales</option>
          </select>
        </div>

        <div class="form-group">
          <label>Email</label>
          <input type="email" name="email" placeholder="Enter email" required />
        </div>

        <!--        <div class="form-group">
        <label>Password</label>
        <input type="password" name='password' placeholder="Enter password" required>
      </div>

      <div class="form-group">
        <label>Confirm Password</label>
        <input type="password" name='confirmpassword' placeholder="Confirm password" required>
      </div>
-->

        <button type="submit" class="btn" onclick="message()">Register</button>
        
      </form>
      <a href="admin.jsp" id="back">Back</a>

      <%String successMessage = (String) request.getAttribute("success");
      if(successMessage != null){%>

      <div id="toast" class="toast">
        <div class="icon">✔</div>
        <div>
          <h3>Success</h3>
          <p><%= successMessage %></p>
          <!-- <p>Employee added succesfully</p> -->
        </div>
      </div>

      <%}%>
    </div>
    <script type="text/javascript">

      setTimeout(() => {
        document.getElementById("msg").style.display = "none";
      }, 3000);

      setTimeout(() => {
        document.getElementById("toast").classList.add("show");
      }, 100);

      setTimeout(() => {
        document.getElementById("toast").classList.remove("show");
      }, 3000);
    </script>
  </body>
</html>
