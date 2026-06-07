package com.emp;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;

@WebServlet("/VerifyOTP")
public class VerifyOTP extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int userOtp = Integer.parseInt(
                request.getParameter("otp"));

        HttpSession session =
                request.getSession();

        int sessionOtp =
                (int) session.getAttribute("otp");

        if(userOtp == sessionOtp) {

            response.sendRedirect(
                    "forgotPassword.jsp?step=password");

        } else {

            request.setAttribute(
                    "msg",
                    "Invalid OTP");

            request.getRequestDispatcher(
                    "forgotPassword.jsp?step=otp")
                    .forward(request, response);
        }
    }
}