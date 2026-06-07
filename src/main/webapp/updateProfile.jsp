<%@page import="com.emp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tailwindcss.com"></script>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
</head>
<body class="bg-gray-100 min-h-screen">
<%Employee e=(Employee)session.getAttribute("employee");
	if(e == null){
		request.setAttribute("sessionExpired","Session already expired");
		request.getRequestDispatcher("login.jsp").forward(request,response);
	}%>
	
<div class="update-section">

            <div class="max-w-3xl mx-auto px-4 py-8">
                <div class="bg-white rounded-lg shadow-md p-6">
                    <div class="bg-orange-500 -m-6 mb-6 rounded-t-lg p-4">
                        <h2 class="text-xl font-bold text-white">Update Account</h2>
                    </div>
                    <form action="update" method="POST" class="mt-4 space-y-4">
                    <%String success=(String)request.getAttribute("success");%>
					<%if(success!=null){%>
						<p style="align-item:center; color:green;"><%=success %></p>
					<%}%>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="block text-gray-700 font-medium mb-1">Full Name</label>
                                <input type="text" name="name" value="<%=e.getName()%>" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                            </div>
                            <div>
                                <label class="block text-gray-700 font-medium mb-1">Email Address</label>
                                <input type="email" name="mail" value="<%=e.getMail()%>" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                            </div>
                    <%if(e.getJob().equals("HR")){%>
                            <div>
                                <label class="block text-gray-700 font-medium mb-1">Job</label>
                                <select name="job" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
                    <option><%=e.getJob()%></option>
                    <option value="Developer">Developer</option>
                    <option value="Tester">Tester</option>
                    <option value="HR">HR</option>
                    <option value="Salesman">Salesman</option>
                </select>
                            </div>
                            <div>
                                <label class="block text-gray-700 font-medium mb-1">Dept</label>
                                <select name="dno" required
                        class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-blue-500">
                    <option value=""><%=e.getDno()%></option>
                    <option value="10">HR</option>
                    <option value="20">IT</option>
                    <option value="30">Sales</option>
                </select>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <label class="block text-gray-700 font-medium mb-1">Salary</label>
                            <input type="number" name="sal" value="<%=e.getSal()%>" class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                        </div>
                        <%}%>
                        <div>
                                <label class="block text-gray-700 font-medium mb-1">Password</label>
                                <input type="password" name="password" value="<%=e.getPassword() %>"  class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:border-blue-500 focus:ring-1 focus:ring-blue-500">
                            </div>
                        </div>
                        <div class="flex gap-3 pt-2">
                            <button type="submit" class="bg-blue-600 text-white px-5 py-2 rounded-lg hover:bg-blue-700 transition">Save Changes</button>
                            <a href="dashboard.jsp" class="bg-gray-300 text-gray-700 px-5 py-2 rounded-lg hover:bg-gray-400 transition">Back</a>
                        </div>
                        <input type="hidden" name="eid" value="<%=e.getId()%>">
                    </form>
                </div>
            </div>
        </div>
</body>
</html>