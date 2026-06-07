
<%@page import="com.emp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import= "com.emp.dto.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Hide radio buttons */
        .tab-radio {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }
        
        /* Hide all sections by default */
        .profile-section, .coworkers-section, .update-section, .reset-section {
            display: none;
        }
        
        /* Show sections when radio is checked */
        #tab-profile:checked ~ .main-wrapper .profile-section {
            display: block;
        }
        #tab-coworkers:checked ~ .main-wrapper .coworkers-section {
            display: block;
        }
        #tab-update:checked ~ .main-wrapper .update-section {
            display: block;
        }
        #tab-reset:checked ~ .main-wrapper .reset-section {
            display: block;
        }
        
       
      
        
        .nav-label {
            transition: all 0.2s ease;
            cursor: pointer;
        }
        
        .nav-label:hover {
            background-color: #e5e7eb;
        }
        
        /* Login success message*/
        .toast {
        position: fixed;
        top: 60px;
        right: 30px;
        background: #d4ffe089;
        color: #0f5132;
        width: 320px;
        padding: 20px;
        border: 1px solid rgb(0, 255, 0);
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
    </style>
</head>
<body class="bg-gray-100 min-h-screen">
	
	<%Employee e =(Employee)session.getAttribute("employee"); %>
	<%

if(e == null){
    response.sendRedirect("login.jsp");
    return;
}
%>
	
    <input type="radio" name="tab" id="tab-profile" class="tab-radio" checked>

	<%String success = (String)request.getAttribute("success"); %>
	<%if(success != null){ %>
		<div id="toast" class="toast">
        	<div class="icon">✔</div>
        	<div>
          		<h3>Success</h3>
          		<p><%= success %></p>
       		</div>
  		</div>
	<%} %>
	
	<%String resetSuccess = (String)request.getAttribute("resetSuccess"); %>
	<%if(resetSuccess != null){ %>
		<div id="toast" class="toast">
        	<div class="icon">✔</div>
        	<div>
          		<h3>Success</h3>
          		<p><%= resetSuccess %></p>
       		</div>
  		</div>
	<%} %>

   
    <div class="nav-bar bg-white shadow-md">
        <div class="max-w-6xl mx-auto px-4">
            <div class="flex flex-wrap">
                <label for="tab-profile" class="nav-label px-5 py-4 text-gray-700 font-medium flex items-center gap-2">
                    <i class="fas fa-user text-orange-500"></i> My Profile
                </label>
                <%if(e.getJob().equals("HR")){ %>
                <a href="admin.jsp" class="ml-auto px-5 py-4 text-orange-600 font-medium flex items-center gap-2 hover:bg-orange-50">
                    <i class="fas fa-user text-orange-500"></i> My Dashboard
                </a>
                <%} %>
                <a href="view.jsp" class="ml-auto px-5 py-4 text-orange-600 font-medium flex items-center gap-2 hover:bg-orange-50">
                    <i class="fas fa-users text-orange-500"></i> My Co-workers
                </a>
                <a href="updateProfile.jsp" class="ml-auto px-5 py-4 text-orange-600 font-medium flex items-center gap-2 hover:bg-orange-50">
                    <i class="fas fa-edit text-orange-500"></i> Update Account
                </a>
               <a href="reset.jsp" class="ml-auto px-5 py-4 text-orange-600 font-medium flex items-center gap-2 hover:bg-orange-50">
                    <i class="fas fa-key text-orange-500"></i> Reset Password
                </a>
                <a href="logout" class="ml-auto px-5 py-4 text-red-600 font-medium flex items-center gap-2 hover:bg-red-50">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
            </div>
        </div>
    </div>

    <!-- Main Wrapper -->
    <div class="main-wrapper">
        
        
        <div class="profile-section">
            <div class="max-w-4xl mx-auto px-4 py-8">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="bg-orange-600 -m-6 mb-6 rounded-t-lg p-4">
                        <h2 class="text-xl font-bold text-white">My Profile</h2>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-5 mt-4">
                        <div class="bg-gray-50 p-4 rounded-lg border-l-4 border-orange-500">
                            <p class="text-xs text-gray-500 uppercase">Employee ID</p>
                            <p class="text-xl font-bold text-gray-800">EMP001<%=e.getId() %></p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg border-l-4 border-orange-500">
                            <p class="text-xs text-gray-500 uppercase">Full Name</p>
                            <p class="text-xl font-bold text-gray-800"><%=e.getName() %></p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg border-l-4 border-orange-500">
                            <p class="text-xs text-gray-500 uppercase">Job Position</p>
                            <p class="text-xl font-bold text-gray-800"><%=e.getJob() %></p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg border-l-4 border-orange-500">
                            <p class="text-xs text-gray-500 uppercase">Salary</p>
                            <p class="text-xl font-bold text-gray-800"><%=e.getSal() %><span class="text-sm font-normal">/ month</span></p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg border-l-4 border-orange-500">
                            <p class="text-xs text-gray-500 uppercase">Department</p>
                            <p class="text-xl font-bold text-gray-800"><%=e.getDno() %></p>
                        </div>
                        <div class="bg-gray-50 p-4 rounded-lg border-l-4 border-orange-500">
                            <p class="text-xs text-gray-500 uppercase">Email ID</p>
                            <p class="text-xl font-bold text-gray-800"><%=e.getMail() %></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
    <div class="text-center text-gray-400 text-sm py-6 border-t mt-4">
        DCL Employee Management System | Punith B | J2EE Session
    </div>
    
    <script>
    setTimeout(() => {
        document.getElementById("toast").classList.add("show");
      }, 100);

      setTimeout(() => {
        document.getElementById("toast").classList.remove("show");
      }, 3000);
    </script>
</body>
</html>