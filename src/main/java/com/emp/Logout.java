package com.emp;

import java.io.IOException;

import com.emp.dto.Employee;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class Logout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Employee e =(Employee)session.getAttribute("employee");
		
		if(e!=null) {
			session.invalidate();
			req.setAttribute("logout", "Logout successful!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);;
		
		}
		else {
			req.setAttribute("error","Session already expired");
			req.getRequestDispatcher("logout.jsp").forward(req, resp);
		}
	}
}
