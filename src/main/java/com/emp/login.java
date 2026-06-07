package com.emp;

import java.io.IOException;
import com.emp.dao.EmployeeDAO;
import com.emp.dao.impl.EmployeeDAOimpl;
import com.emp.dto.Employee;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = new EmployeeDAOimpl(); 
		Employee e = new Employee();
		
		String mail = req.getParameter("mail");
		String password = req.getParameter("password");
		e = edao.findByMailAndPassword(mail, password);
		
		if(e != null) {
			HttpSession session = req.getSession();
			session.setAttribute("employee", e);
			
			if(e.getJob().equals("HR")) {
				req.setAttribute("employee", e);
				resp.sendRedirect("admin.jsp");
			}
			else {
	//			resp.sendRedirect("dashboard.jsp");
				req.setAttribute("success", "Login Successfull!");
				RequestDispatcher rd = req.getRequestDispatcher("dashboard.jsp");
				rd.forward(req, resp);
			}
			
		}
		else {
			req.setAttribute("error", "Invalid credintials");
			RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		
	
	}
}
