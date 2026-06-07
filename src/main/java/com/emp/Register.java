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

@WebServlet("/register")
public class Register extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = new EmployeeDAOimpl();
		Employee e = new Employee();
		
		e.setName(req.getParameter("name"));
		e.setJob(req.getParameter("job"));
		e.setDno(Integer.parseInt(req.getParameter("department")));
		e.setSal(Double.parseDouble(req.getParameter("salary")));
		e.setMail(req.getParameter("email"));
		
		String password = e.getName()+"@123";
		e.setPassword(password);
		
		edao.addEmployee(e);
		
		req.setAttribute("success", "Employee account created successfully!");
		RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
		rd.forward(req, resp);
	}
}
