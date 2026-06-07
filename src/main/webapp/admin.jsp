
<%@page import="com.emp.dao.DeptDAO"%>
<%@page import="com.emp.dao.impl.DeptDAOimpl"%>
<%@page import="com.emp.dao.EmployeeDAO"%>
<%@page import="com.emp.dao.impl.EmployeeDAOimpl"%>
<%@page import="com.emp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Employee Management</title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<style>
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
	</style>
</head>
<body class="bg-gray-100">

<%Employee e = (Employee)session.getAttribute("employee"); %>
    
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
    
    
    <nav class="bg-white shadow-md">
        <div class="max-w-7xl mx-auto px-4 py-3 flex justify-between items-center">
            <h1 class="text-xl font-bold text-orange-600">DCL Admin Dashboard</h1>
            <div class="text-sm text-gray-500">
            
            <a href="logout" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded">
			<i class="fa-solid fa-arrow-right-from-bracket"></i> Logout
			</a>
              
            </div>
        </div>
    </nav>

    <div class="max-w-7xl mx-auto px-4 py-6">
        
        <%EmployeeDAO edao = new EmployeeDAOimpl(); %>
        <%DeptDAO ddao = new DeptDAOimpl(); %>
        
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-8">
            <!-- Employee Count Card -->
            <div class="bg-white rounded-lg shadow p-5 border-l-4 border-orange-500">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-black-500 text-sm">Total Employees</p>
                        <p class="text-2xl font-bold" id="empCount"><%=edao.findAll().size() %></p>
                    </div>
                    <i class="fas fa-users text-3xl text-orange-400"></i>
                </div>
            </div>
            
            
            <div class="bg-white rounded-lg shadow p-5 border-l-4 border-orange-500">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-black-500 text-sm">Total Departments</p>
                        <p class="text-2xl font-bold" id="deptCount"><%=ddao.findAll().size() %></p>
                    </div>
                    <i class="fas fa-building text-3xl text-orange-400"></i>
                </div>
            </div>
        </div>

        
        <div class="flex flex-wrap gap-3 mb-6">
            <a href="register.jsp" class="bg-orange-600 text-white px-5 py-2 rounded-lg hover:bg-orange-700 transition flex items-center gap-2">
                <i class="fas fa-user-plus"></i> Add Employee
            </a>
            <a href="view.jsp" class="bg-orange-600 text-white px-5 py-2 rounded-lg hover:bg-orange-700 transition flex items-center gap-2">
                <i class="fas fa-eye"></i> View Employees
            </a>
            <a href="addDept.jsp" class="bg-orange-600 text-white px-5 py-2 rounded-lg hover:bg-orange-700 transition flex items-center gap-2">
                <i class="fas fa-plus-circle"></i> Add Department
            </a>
            <a href="viewDept.jsp" class="bg-orange-600 text-white px-5 py-2 rounded-lg hover:bg-orange-700 transition flex items-center gap-2">
                <i class="fas fa-list"></i> View Departments
            </a>
            <a href="dashboard.jsp" class="bg-orange-600 text-white px-5 py-2 rounded-lg hover:bg-orange-700 transition flex items-center gap-2">
                <i class="fas fa-user text-white-500"></i> My Profile
            </a>
        </div>

        
        <div id="contentArea" class="bg-white rounded-lg shadow p-6">
            <!-- Welcome Message -->
            <div class="text-center text-gray-500 py-10">
               
                <p>Welcome to Admin Dashboard</p>
                        <div class="overflow-x-auto">
                            <table class="w-full border text-sm">
                                <thead class="bg-gray-100">
                                    <tr>
                                        <th class="border p-2 text-left">Name</th>
                                        <th class="border p-2 text-left">Job</th>
                                        <th class="border p-2 text-left">Salary</th>
                                        <th class="border p-2 text-left">Dept</th>
                                        <th class="border p-2 text-left">Email</th>
                                    </tr>
                                </thead>
                                <tbody>
						<tr>
                            <td class="border p-2"><%=e.getName() %></td>
                            <td class="border p-2"><%=e.getJob() %></td>
                            <td class="border p-2"><%=e.getSal() %></td>
                            <td class="border p-2">HR</td>
                            <td class="border p-2"><%=e.getMail() %></td>
                        </tr>
								</tbody>
						</table>
				 </div>
            </div>
        </div>
    </div>
</body>
</html>