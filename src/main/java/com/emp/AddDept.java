package com.emp;

import java.io.IOException;
import com.emp.dao.DeptDAO;
import com.emp.dao.impl.DeptDAOimpl;
import com.emp.dto.Dept;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addDepartment")
public class AddDept extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		DeptDAO ddao = new DeptDAOimpl();
		Dept d = new Dept();
		HttpSession session = req.getSession();
		
		d.setDno(Integer.parseInt(req.getParameter("dNo")));
		d.setDname(req.getParameter("dName"));
		d.setLocation(req.getParameter("dLocation"));
		
		ddao.addDept(d);
		
		req.setAttribute("success", "Department added successfully");
		req.getRequestDispatcher("addDept.jsp").forward(req, resp);
	}
}
