<%@page import="com.emp.dto.Dept"%>
<%@page import="com.emp.dao.DeptDAO"%>
<%@page import="com.emp.dao.impl.DeptDAOimpl"%>
<%@page import="com.emp.dao.EmployeeDAO" %>
<%@page import="com.emp.dao.impl.EmployeeDAOimpl"%>
<%@page import="java.util.List"%>
<%@page import="com.emp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Department's List</title>
<script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
    a{
    border-radius:5px;
    height:20px;
    background-color: #007bff;
    padding:5px 10px;
    
    }
    </style>
</head>
<body class="bg-gray-100 min-h-screen">
	
	
	
<%Employee emp = (Employee)session.getAttribute("employee"); %>

 <!-- Co-workers Section -->
 <%if(emp == null){
		request.setAttribute("error","Session already expired");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}%>
        <div class="coworkers-section">
            <div class="max-w-5xl mx-auto px-4 py-8">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="bg-green-600 -m-6 mb-6 rounded-t-lg p-4">
                    
                    <a href="admin.jsp" class="text-white ">Back</a>
                    
                    
                        <h2 class="text-xl font-bold text-white">Department's List</h2>
                    </div>
                    
                   
                    <div class="overflow-x-auto mt-4"> 
                    <%DeptDAO ddao = new DeptDAOimpl(); %>
                    <%List<Dept> dList= ddao.findAll();  %>
                    
                        <table class="w-full border-collapse">
                            <thead>
                            
                                <tr class="bg-gray-100">
                                    <th class="p-3 text-left text-sm font-semibold">Dept No</th>
                                    <th class="p-3 text-left text-sm font-semibold">Dept Name</th>
                                    <th class="p-3 text-left text-sm font-semibold">Location</th>
                                    
                                 </tr>
                             
                            </thead>
                            <tbody>
                            <%for(Dept d:dList){ %>
                            <% if(d != null && !dList.isEmpty()){%>
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="p-3">EMP00<%=d.getDno() %></td>
                                    <td class="p-3 font-medium"><%=d.getDname()%></td>
                                    <td class="p-3"><%=d.getLocation() %></td>
                                    
                                 </tr>
                                   <%}
                            }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>