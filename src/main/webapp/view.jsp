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
<title>Co-Workers</title>
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
                    <% if(emp.getJob().equals("HR")){%>
                    	<a href="admin.jsp" >Back</a>
                    <%}
                    else{ %>
                    <a href="dashboard.jsp" >Back</a>
                    <% }%>
                    
                        <h2 class="text-xl font-bold text-white">My Co-workers</h2>
                    </div>
                    
                   
                    <div class="overflow-x-auto mt-4"> 
                    <%EmployeeDAO edao = new EmployeeDAOimpl(); %>
                    <%List<Employee> eList= edao.findAll();  %>
                    
                        <table class="w-full border-collapse">
                            <thead>
                            
                                <tr class="bg-gray-100">
                                    <th class="p-3 text-left text-sm font-semibold">ID</th>
                                    <th class="p-3 text-left text-sm font-semibold">Name</th>
                                    <th class="p-3 text-left text-sm font-semibold">Job</th>
                                    <th class="p-3 text-left text-sm font-semibold">Mail</th>
                                    <th class="p-3 text-left text-sm font-semibold">IT</th>
                                 </tr>
                             
                            </thead>
                            <tbody>
                            <%for(Employee e:eList){ %>
                            <% if(e != null && !eList.isEmpty()){%>
                                <tr class="border-b hover:bg-gray-50">
                                    <td class="p-3">EMP00<%=e.getId() %></td>
                                    <td class="p-3 font-medium"><%=e.getName() %></td>
                                    <td class="p-3"><%=e.getJob() %></td>
                                    <td class="p-3"><%=e.getMail() %></td>
                                    <td class="p-3">IT</td>
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