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

@WebServlet("/update")
public class UpdateProfile extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EmployeeDAO edao = new EmployeeDAOimpl();
		HttpSession session = req.getSession();
		Employee e = (Employee) session.getAttribute("employee");
		
		if(e.getId()==Integer.parseInt(req.getParameter("eid"))) {
			e.setName(req.getParameter("name"));
			e.setMail(req.getParameter("mail"));
			e.setPassword(req.getParameter("password"));
			
			if(e.getJob().equals("HR")) {
				e.setJob(req.getParameter("job"));
				e.setDno(Integer.parseInt(req.getParameter("dno")));
			}
			edao.updateEmployee(e);
			req.setAttribute("success", "Data updated succesfully!");
			req.getRequestDispatcher("updateProfile.jsp").forward(req, resp);;
		}
		else {
			req.setAttribute("error", "Invalid form");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		
	}
}
