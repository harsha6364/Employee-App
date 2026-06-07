<%@page import="com.emp.dto.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Department</title>
    <style>
        body{
            height: 57vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: "Segoe UI", sans-serif;
            .container{
                .header{
                    width: 650px;
                    padding: 1px 0;
                    text-align: center;
                    background-color: rgb(255, 94, 0);
                    color:white;
                    /* padding: 1px 200px; */
                    /* border: 2px solid rgb(206, 206, 206); */
                    border-bottom: none;
                    border-radius: 10px 10px 0 0;
                    box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.2);
                }
                form{
                    width: 650px;
                    height: 350px;
                    /* padding: 20px 60px; */
                    border: 1px solid rgb(255, 255, 255);
                    border-top: none;
                    border-radius: 0 0 10px 10px;
                    box-shadow: 0px 0px 40px rgba(0, 0, 0, 0.2);
                    display: flex;
                    flex-direction: column;
                    gap: 10px;
                    justify-content: center;
                    /* align-items: center; */
                    div{
                        margin-left: 30px;
                        label{
                            color: rgb(64, 64, 64);
                            
                        }
                        input{
                            /* padding: 8px 400px 8px 10px; */
                            width: 570px;
                            padding: 10px;
                            margin-top: 5px;
                            border: 1px solid rgb(223, 223, 223);
                            border-radius: 5px;
                        }
                        input:focus{
                            border-color:  blue;
                        }
                        button,a{
                            padding: 10px 70px;
                            border:none;
                            border-radius: 5px;
                            background-color: rgb(255, 94, 0);
                            color: white;
                            font-size: 15px;
                            font-weight: 600;

                        }
                        button:hover{
                        background-color: rgb(186, 31, 0);
                        }
                        #back{
                            background-color: rgb(0, 81, 255);
                            padding: 10px 30px;
                            text-decoration: none;
                        }
                        #back:hover{
                            background-color: rgb(0, 0, 180);
                        }
                        
                        
                    }

                }
        }
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
        <div class="header">
            <h2>Add Department</h2>
        </div>
        <form action="addDepartment" method="post">
        
        <%String success=(String)request.getAttribute("success"); %>
        <% if(success != null){%>
        <p  style="align-item:center; color:green;"><%=success %></p>
        <% }%>
       
            
            <div >
                <label for="dno">Dept No</label><br>
                <input type="number" name="dNo" id="dno" placeholder="Enter dept no">
            </div>
            <div>
                <label for="dname">Dept Name</label><br>
                <input type="text" name="dName" id="dname" placeholder="Enter dept name">
            </div>
            <div>
                <label for="dLocation">Dept Location</label><br>
                <input type="text" name="dLocation" id="dLocation" placeholder="Enter dept location">
            </div>
            <div>
                <a href="admin.jsp" id="back">Back</a>
                <button type="submit">Add</button>
            </div>
        </form>
    </div>
</body>
</html>