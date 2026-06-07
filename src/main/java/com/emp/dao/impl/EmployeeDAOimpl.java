package com.emp.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.emp.dao.EmployeeDAO;
import com.emp.utility.Connector;

import com.emp.dto.Employee;

public class EmployeeDAOimpl implements EmployeeDAO {
	Scanner sc = new Scanner(System.in);
	private Connection con;

	public EmployeeDAOimpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addEmployee(Employee e) {
		String query  = "INSERT INTO EMPLOYEE VALUES(0,?,?,?,?,SYSDATE(),?,?)";
		try {
			PreparedStatement ps  = con.prepareStatement(query);
			
			ps.setString(1, e.getName());
			ps.setString(2, e.getJob());
			ps.setDouble(3, e.getSal());
			ps.setInt(4, e.getDno());
			ps.setString(5, e.getMail());
			ps.setString(6, e.getPassword());
			int i = ps.executeUpdate();
			if(i>0) {
				System.out.println("Employee Registered successfully!");
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to Register Employee");
		}
		

	}

	@Override
	public Employee findById(Integer id) {
		String query = "SELECT * FROM EMPLOYEE WHERE ID=?";
		Employee e=null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				e = new Employee();
				
				e.setId(rs.getInt("ID"));
				e.setName(rs.getString("NAME"));
				e.setJob(rs.getString("JOB"));
				e.setSal(rs.getDouble("SAL"));
				e.setDno(rs.getInt("DNO"));
				e.setCreated_at(rs.getString("CREATED_AT"));
				e.setMail(rs.getString("MAIL"));
				e.setPassword(rs.getString("PASSWORD"));
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to fetch the data!");
		}
		
		return e;
	}

	@Override
	public List<Employee> findAll() {
		List<Employee> eList = new ArrayList<>();
		Employee e =null;
		String query = "SELECT * FROM EMPLOYEE";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				e = new Employee();
				
				e.setId(rs.getInt("ID"));
				e.setName(rs.getString("NAME"));
				e.setJob(rs.getString("JOB"));
				e.setSal(rs.getDouble("SAL"));
				e.setDno(rs.getInt("DNO"));
				e.setCreated_at(rs.getString("CREATED_AT"));
				e.setMail(rs.getString("MAIL"));
//				e.setPassword(rs.getString("PASSWORD"));
				eList.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return eList;
	}

	@Override
	public Employee findByMailAndPassword(String mail, String password) {
		String query = "SELECT * FROM EMPLOYEE WHERE MAIL = ? AND PASSWORD = ?";
		Employee e = null;
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1, mail);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				e = new Employee();
				
				e.setId(rs.getInt("ID"));
				e.setName(rs.getString("NAME"));
				e.setJob(rs.getString("JOB"));
				e.setSal(rs.getDouble("SAL"));
				e.setDno(rs.getInt("DNO"));
				e.setCreated_at(rs.getString("CREATED_AT"));
				e.setMail(rs.getString("MAIL"));
				e.setPassword(rs.getString("PASSWORD"));				
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Failed to fetch the data!");
		}
		return e;
	}
	
	@Override
	public void updateEmployee(Employee e) {
		String query = "UPDATE EMPLOYEE SET NAME = ?, JOB = ?, SAL = ?, DNO = ?, MAIL = ?, PASSWORD = ? WHERE ID = ?";
		
		try {
			
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, e.getName());
			ps.setString(2, e.getJob());
			ps.setDouble(3, e.getSal());
			ps.setInt(4, e.getDno());
			ps.setString(5, e.getMail());
			ps.setString(6, e.getPassword());
			ps.setInt(7, e.getId());
			
			ps.executeUpdate();
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.out.println("Fialed to update data");
		}
		
		
	}

	/**
	@Override
	public void updateEmployee(Employee e) {
		System.out.println("1.Update name\n2.Update Job role\n3.Update sal\n4.Update Dno\n5.Update Mail\n6.Update Password");
		System.out.println("Enter your choice :");
		int choice = sc.nextInt();
		
		switch(choice) {
		case 1:{
			String query = "UPDATE EMPLOYEE SET NAME = ? WHERE ID = ?";
			
			try {
				System.out.println("Enter the employee ID :");
				int id = sc.nextInt();
				sc.nextLine();
				System.out.println("Enter the new name :");
				String name = sc.nextLine();
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1,name);
				ps.setInt(2,id);
				
				int res = ps.executeUpdate();
				if(res > 0) {
					System.out.println("Name updated successfully :)");
				}else {
					System.out.println("Failed to update name :(");
				}
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			break;
			
		}
		case 2:{
			
			String query = "UPDATE EMPLOYEE SET JOB = ? WHERE ID = ?";
			
			try {
				
				System.out.println("Enter the ID:");
				int id = sc.nextInt();
				System.out.println("Enter new job role:");
				String job = sc.next();
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setInt(1,id);
				ps.setString(2,job);
				
				int res = ps.executeUpdate();
				
				if(res > 0) {
					System.out.println("Job role updated successfully :)");
				}else {
					System.out.println("Failed to update job role :(");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		}
		case 3:{
			
			String query = "UPDATE EMPLOYEE SET SAL = ? WHERE ID = ?";
			
			try {
				
				System.out.println("Enter the ID:");
				int id = sc.nextInt();
				System.out.println("Enter the new sal:");
				Double sal = sc.nextDouble();
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setInt(1, id);
				ps.setDouble(2,sal);
				
				int res = ps.executeUpdate();
				
				if(res > 0) {
					System.out.println("Sal updated successfully :)");
				}
				else {
					System.out.println("Failed to update sal :(");
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			break;
		}
		case 4:{
			
			String query = "UPDATE EMPLOYEE SET DNO = ? WHERE ID = ?";
			
			try {
				System.out.println("Enter the ID :");
				int id = sc.nextInt();
				System.out.println("Enter new Dno :");
				int dno = sc.nextInt();
				
				PreparedStatement ps = con.prepareStatement(query);
				ps.setInt(1, dno);
				ps.setInt(2, id);
				
				int res = ps.executeUpdate();
				if(res > 0) {
					System.out.println("Dno updated successfully!");
				}
				else {
					System.out.println("Failed to update Dno");
				}
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			break;
		}
		case 5:{
			
			System.out.println("Enter the id");
			int id = sc.nextInt();
			System.out.println("Enter the mail:");
			String mail = sc.next();
			
			String query = "UPDATE EMPLOYEE SET MAIL = ? WHERE ID = ?";
			
			try {
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1,mail);
				ps.setInt(2, id);
				
				int res = ps.executeUpdate();
				if(res  > 0) {
					System.out.println("Mail updated successfully!");
				}
				else {
					System.out.println("Failed to update mail");
				}
				
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			break;
		}
		case 6:{
			
			String query = "UPDATE EMPLOYEE SET PASSWORD = ? WHERE ID = ?";
			
			try {
				
				System.out.println("Enter the ID:");
				int id = sc.nextInt();
				System.out.println("Enter the new password:");
				String password = sc.next();
				
				PreparedStatement ps = con.prepareStatement(query);
				
				ps.setString(1, password);
				ps.setInt(2, id);
				
				int res = ps.executeUpdate();
				if(res > 0) {
					System.out.println("Password updated successfully :)");
				}
				else {
					System.out.println("Failed to update password :(");
				}
				
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			break;
		}
		default : System.out.println("Enter the valid input");
		}
	}
	
	**/
	
	@Override
	public void deleteById(Integer id) {
		String query = "DELETE FROM EMPLOYEE WHERE ID = ?";
//		Employee e = null;

		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);

			int res = ps.executeUpdate();
			if(res > 0) {
				System.out.println("Data successfully deleted");
			}
			else {
				System.out.println("Failed to delete the data");
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}

	@Override
	public Employee findByMail(String mail) {
		String query = "SELECT * FROM EMPLOYEE WHERE MAIL = ?";
		Employee e = new Employee();
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, mail);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setJob(rs.getString("job"));
				e.setDno(rs.getInt("dno"));
				e.setSal(rs.getDouble("sal"));
				e.setMail(rs.getString("mail"));
				e.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return e;
	}

	@Override
	public void  updatePassword(Employee e) {
		
		String query = "UPDATE EMPLOYEE SET PASSWORD = ? WHERE MAIL = ?";

	    try {
	        
	        PreparedStatement ps = con.prepareStatement(query);

	        ps.setString(1, e.getPassword());
	        ps.setString(2, e.getMail());

	        ps.executeUpdate();

	    } catch (SQLException e2) {
	        e2.printStackTrace();
	    }

	}

}
