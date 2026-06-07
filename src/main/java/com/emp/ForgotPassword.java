package com.emp;

import java.io.IOException;

import com.emp.dao.EmployeeDAO;
import com.emp.dao.impl.EmployeeDAOimpl;
import com.emp.dto.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EmployeeDAO edao = new EmployeeDAOimpl();

        String mail = req.getParameter("mail");
        String newPassword = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword)) {

            Employee e = edao.findByMail(mail);

            if (e != null) {

                e.setPassword(newPassword);

                edao.updatePassword(e);

                req.getSession().setAttribute(
                        "success",
                        "Password Reset Successful");

                resp.sendRedirect("forgot.jsp");

            } else {

                req.getSession().setAttribute(
                        "error",
                        "Mail not found");

                resp.sendRedirect("forgot.jsp");
            }

        } else {

            req.getSession().setAttribute(
                    "error",
                    "Password Mismatch");

            resp.sendRedirect("forgot.jsp");
        }
    }
}