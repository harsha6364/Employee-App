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

@WebServlet("/resetPassword")
public class Reset extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = new EmployeeDAOimpl();
		
		
		HttpSession session = req.getSession(false);

		if(session == null) {
		    resp.sendRedirect("login.jsp");
		    return;
		}

		Employee e = (Employee) session.getAttribute("employee");

		if(e == null) {
		    resp.sendRedirect("login.jsp");
		    return;
		}
		
		if(e.getPassword().equals(req.getParameter("currentPassword"))) {
			
			if(req.getParameter("newPassword").equals(req.getParameter("confirmPassword"))) {
				e.setPassword(req.getParameter("newPassword"));
				edao.updateEmployee(e);
				
				session.setAttribute("employee", e);
				req.setAttribute("resetSuccess", "Password reset successfully!");
				
				
				if(e.getJob().equals("HR")) {
					
					req.getRequestDispatcher("admin.jsp").forward(req, resp);
				}
				else {
					
					req.getRequestDispatcher("dashboard.jsp").forward(req, resp);
				}
				
			}
			else {
				req.setAttribute("passwordMissmatch","NewPassword and confirmPassword missmatched");
				req.getRequestDispatcher("reset.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("passwordMissmatch", "Current Password missmatched");
			req.getRequestDispatcher("reset.jsp").forward(req, resp);
		}
	}
}
