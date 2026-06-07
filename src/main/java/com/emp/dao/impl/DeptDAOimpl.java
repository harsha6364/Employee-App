package com.emp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.emp.dao.DeptDAO;
import com.emp.dto.Dept;
import com.emp.utility.Connector;

public class DeptDAOimpl implements DeptDAO {
	
	private Connection con;

	public DeptDAOimpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addDept(Dept d) {
		String query = "INSERT INTO DEPT VALUES(?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, d.getDno());
			ps.setString(2, d.getDname());
			ps.setString(3, d.getLocation());
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to add Dept");
		}

	}

	@Override
	public Dept findById(Dept d) {
		Dept dept = null;
		
		String query = "SELECT D.* FROM EMPLOYEE E "
			     + "JOIN DEPT D ON E.DNO = D.DNO "
			     + "WHERE E.ID = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,d.getDno());
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				dept = new Dept();
				
				dept.setDno(rs.getInt("Dno"));
				dept.setDname(rs.getString("Dname"));
				dept.setLocation(rs.getString("Location"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to find details");
		}
		return dept;
	}
	
	@Override
	public Dept findByDno(Dept d) {
		Dept dept = null;
		
		String query = "SELECT * FROM DEPT WHERE DNO = ?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1,d.getDno());
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				dept = new Dept();
				
				dept.setDno(rs.getInt("Dno"));
				dept.setDname(rs.getString("Dname"));
				dept.setLocation(rs.getString("Location"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to find dept details");
		}
		return dept;
	}

	@Override
	public List<Dept> findAll() {
		List<Dept> dList = new ArrayList<>();
		Dept d = null;
		String query = "SELECT * FROM DEPT";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				d = new Dept();
				
				d.setDno(rs.getInt("Dno"));
				d.setDname(rs.getString("Dname"));
				d.setLocation(rs.getString("Location"));
				dList.add(d);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to fetch the data");
		}
		
		
		return dList;
	}

	@Override
	public void updateDept(Dept d) {
		String query = "UPDATE DEPT SET DNO = ?, DNAME = ?, LOCATION = ? WHERE DNO = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, d.getDno());
			ps.setString(2, d.getDname());
			ps.setString(3, d.getLocation());
			ps.setInt(4, d.getDno());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to update dept details");
		}
	}

	@Override
	public void deleteDept(Integer Dno) {
		String query = "DELETE FROM DEPT WHERE DNO = ?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, Dno);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to delete dept");
		}
		

	}

	

}
