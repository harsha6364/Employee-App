<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

<style>

body{
    font-family:Arial;
    background:#f3f4f6;
}

.container{
    width:350px;
    margin:100px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,0.2);
}

input{
    width:100%;
    padding:10px;
    margin-top:10px;
}

button{
    width:100%;
    padding:10px;
    margin-top:15px;
    background:#2563eb;
    color:white;
    border:none;
}

.msg{
    color:red;
    margin-top:10px;
}

</style>

</head>
<body>

<div class="container">

<%

String step = request.getParameter("step");


// ================= ENTER EMAIL =================

if(step == null){

%>

<h2>Forgot Password</h2>

<form action="SendOTP" method="post">

    <input type="email"
    name="email"
    placeholder="Enter Email"
    required>

    <button>Send OTP</button>

</form>

<%
}


// ================= VERIFY OTP =================

else if(step.equals("otp")){

%>

<h2>Verify OTP</h2>

<form action="VerifyOTP" method="post">

    <input type="text"
    name="otp"
    placeholder="Enter OTP"
    required>

    <button>Verify OTP</button>

</form>

<%

String msg = (String)request.getAttribute("msg");

if(msg != null){
%>

<div class="msg"><%=msg%></div>

<%
}

}


// ================= NEW PASSWORD =================

else if(step.equals("password")){

%>

<h2>Set New Password</h2>

<form action="UpdatePassword" method="post">

    <input type="password"
    name="password"
    placeholder="Enter New Password"
    required>

    <input type="password"
    name="confirmPassword"
    placeholder="Confirm Password"
    required>

    <button>Update Password</button>

</form>

<%

String error = (String)session.getAttribute("error");

if(error != null){
%>

<div class="msg"><%=error%></div>

<%
session.removeAttribute("error");
}

}
%>

</div>

</body>
</html>