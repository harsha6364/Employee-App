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
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        EmployeeDAO edao = new EmployeeDAOimpl();

        HttpSession session = req.getSession();

        // Get mail from session
        String mail = (String) session.getAttribute("email");

        String newPassword = req.getParameter("password");

        String confirmPassword =
                req.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword)) {

            Employee e = edao.findByMail(mail);

            if (e != null) {

                e.setPassword(newPassword);

                edao.updatePassword(e);

                session.setAttribute(
                        "success",
                        "Password Reset Successful");

                // remove otp after success
                session.removeAttribute("otp");

                resp.sendRedirect("login.jsp");

            } else {

                session.setAttribute(
                        "error",
                        "Mail not found");

                resp.sendRedirect(
                        "forgotPassword.jsp?step=password");
            }

        } else {

            session.setAttribute(
                    "error",
                    "Password Mismatch");

            resp.sendRedirect(
                    "forgotPassword.jsp?step=password");
        }
    }
}