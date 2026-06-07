package com.emp.test;

import java.util.List;
import java.util.Scanner;

import com.emp.dao.DeptDAO;
import com.emp.dao.EmployeeDAO;
import com.emp.dao.impl.DeptDAOimpl;
import com.emp.dao.impl.EmployeeDAOimpl;

import com.emp.dto.Dept;
import com.emp.dto.Employee;

public class Test {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		EmployeeDAO edao = new EmployeeDAOimpl();
		DeptDAO ddao = new DeptDAOimpl();
		Employee e = new Employee();
		Dept d = new Dept();
		
		
		System.out.println("WELCOME TO EMPLOYEE PORTAL 👨‍💻");
		
		System.out.println("Enter your mail 📧:");
		String mail = sc.next();
		System.out.println("Enter your password 🔑:");
		String password = sc.next();
		e = edao.findByMailAndPassword(mail,password) ;
		
		if(e != null) {
			if(e.getId() == 1) {
				System.out.println("WELCOME ADMIN "+e.getName()+"\n");
				
				System.out.println("1.Update Employee details");
				System.out.println("2.Update Department details");
				
				System.out.println("\nEnter your choice :");
				int choice = sc.nextInt();
				
				switch(choice) {
				case 1 :
					
					System.out.println("1.Add Employee\n"
							+ "2.Find employee by ID\n"
							+ "3.Find all employee's\n"
							+ "4.Find employee by mail and password\n"
							+ "5.Update employee details\n"
							+ "6.Delete employee by ID\n");
					
					System.out.println("Enter your choice :");
					int choice1  = sc.nextInt();
					
					switch(choice1) {
					case 1:
						System.out.println("Enter the name :");
						e.setName(sc.next());
					
						System.out.println("Enter the job role :");
						e.setJob(sc.next());
					
						System.out.println("Enter the salary :");
						e.setSal(sc.nextDouble());
					
						System.out.println("Enter the Dept no :");
						e.setDno(sc.nextInt());
					
						System.out.println("Enter the mail :");
						e.setMail(sc.next());
					
						System.out.println("Enter the password : ");
						e.setPassword(sc.next());
					
						edao.addEmployee(e);
						System.out.println("Data added successfully! ");
					
						break;
					
				
					case 2:
					
						System.out.println("Enter the ID:");
						Employee empl = edao.findById(sc.nextInt());
						System.out.println(empl);
						break;
					
					case 3:
					
						List<Employee> empList = edao.findAll();
						for(Employee e2:empList) {
						System.out.println(e2);
						}
						break;
					
					
					case 4:
					
						System.out.println("Enter the mail :");
						String mail2 = sc.next();
						System.out.println("Enter the password :");
						String password2 = sc.next();
						Employee emp = edao.findByMailAndPassword(mail2,password2);
						if(emp != null) {
							System.out.println("Login successful");
						}else {
							System.out.println("Failed to login");
						}
					
						break;
					
					case 5:
						/**
						System.out.println("Enter the employee ID");
						int id = sc.nextInt();
						
						Employee e1 = edao.findById(id);
						System.out.println(e1);
						edao.updateEmployee(e1);
						**/
						
						System.out.println("\nEnter the employee ID to be updated :");
						int id = sc.nextInt();
						Employee e1 = edao.findById(id);
						System.out.println("\nBefore update :");
						System.out.println(e1+"\n");

						
						System.out.println(""
								+ "1.NAME\n"
								+ "2.JOB\n"
								+ "3.SAL\n"
								+ "4.DNO\n"
								+ "5.MAIL\n"
								+ "6.PASSWORD");
						System.out.println("\nEnter the feild to be updated :");
						int choice11 = sc.nextInt();
						
						switch(choice11) {
						
						case 1:System.out.println("\nEnter the name to be updated :");
						e1.setName(sc.next());
						break;
						
						case 2:System.out.println("\nEnter the job to be updated :");
						e1.setJob(sc.next());
						break;
						
						case 3:System.out.println("\nEnter the Sal to be updated :");
						e1.setSal(sc.nextDouble());
						break;
						
						case 4:System.out.println("\nEnter the DNo to be updated :");
						e1.setDno(sc.nextInt());
						break;
						
						case 5:System.out.println("\nEnter the Mail to be updated :");
						e1.setMail(sc.next());
						break;
						
						case 6:System.out.println("\nEnter the Password to be updated :");
						e1.setPassword(sc.next());
						break;
						
						default: System.out.println("Invalid input");
						}
						
						edao.updateEmployee(e1);
						System.out.println("\nData after updating : ");
						System.out.println(e1);
						
						break;
							
					
					case 6 :
					
						System.out.println("Enter the ID to delete data :");
						int id2 = sc.nextInt();
						edao.deleteById(id2);
						break;
					
					default : System.out.println("Enter valid number 1-6");
					}
					
					
					break;
				case 2:
					
					System.out.println("1.Add Dept");
					System.out.println("2.Find Dept by id");
					System.out.println("3.Find Dept by Dno");
					System.out.println("4.Find all Dept");
					System.out.println("5.Update Dept");
					System.out.println("6.Delete Dept");
					System.out.println("7.Exit");
					System.out.println("Enter your choice:");
					
					int choice2 = sc.nextInt();
					
					switch(choice2) {
					
					case 1:
						System.out.println("\nEnter Dno :");
						d.setDno(sc.nextInt());
						sc.nextLine();
						System.out.println("\nEnter Dname :");
						d.setDname(sc.nextLine());
						System.out.println("Enter DLocation :");
						d.setLocation(sc.nextLine());
						ddao.addDept(d);
						System.out.println("\nDept added successfully");
						System.out.println(d);
						break;
					
					case 2:
						
						System.out.println("\nEnter Employee id to find dept details :");
					
						d.setDno(sc.nextInt());

						Dept result = ddao.findById(d);

						if (result != null) {
							System.out.println("\nDepartment Details :");
							System.out.println(result);
						} 
						else {
							System.out.println("\nNo Department Found for Employee ID : " + d.getDno());
						}
						break;
					
					case 3:
						
						System.out.println("\nEnter the Dno:");
						d.setDno(sc.nextInt());
						Dept dept = ddao.findByDno(d);
						System.out.println(dept);
						break;
						
					case 4 :
						List<Dept> dList = ddao.findAll();
						for(Dept d2: dList) {
							System.out.println(d2);
						}
						break;
					
					case 5:
						System.out.println("\nEnter Dno to be updated :");
						d.setDno(sc.nextInt());
						System.out.println("\nDept details before update :");
						Dept d1 = ddao.findByDno(d);
						System.out.println(d1);
//						System.out.println(d);
						
						System.out.println("1.Update Dno");
						System.out.println("2.Update Dname");
						System.out.println("3.Update DLocation");
						System.out.println("Enter your choice :");
						int choice3 = sc.nextInt();
						switch(choice3) {
						case 1:
							
							System.out.println("\nEnter the Dno to be updated");
							d1.setDno(sc.nextInt());
							break;
							
						case 2:
							
							System.out.println("\nEnter the Dname to be updated");
							d1.setDname(sc.next());
							break;
							
						case 3:
							System.out.println("\nEnter the Location to be updated");
							d1.setLocation(sc.next());
							break;
							
						default :System.out.println("\nInvalid Input");
						}
						
						ddao.updateDept(d1);
						System.out.println("\nDept details after update :");
						System.out.println(d1);
						
						break;
					
					case 6:
						System.out.println("Enter Dno to be deleted:");
						Integer Dno = sc.nextInt();
						ddao.deleteDept(Dno);
						System.out.println("Dept deleted successfully");
						break;
						
					default : System.out.println("\nInvalid input");
					}
					
					break;
				}
			}
				
			else {
				System.out.println("\nWELCOME "+e.getName());
				
				System.out.println(""
						+ "1.View my profile\n"
						+ "2.Update mail\n"
						+ "3.Update password\n"
						+ "4.View my Dept Details");
				
				System.out.println("Enter your choice :");
				int choice = sc.nextInt();
				
				switch(choice) {
				
				case 1:
					System.out.println(e);
					break;
				
				case 2:
					System.out.println("Enter mail to be updated :");
					e.setMail(sc.next());
					edao.updateEmployee(e);
					System.out.println("Mail updated successfully !");
					break;
					
				case 3:
					System.out.println("Enter password to be updated :");
					e.setPassword(sc.next());
					edao.updateEmployee(e);
					System.out.println("Password updated successfully!");
					break;
					
				case 4:
					System.out.println("\nEnter the Dno:");
					d.setDno(sc.nextInt());
					Dept dept = ddao.findByDno(d);
					System.out.println(dept);
					break;
					
				default:System.out.println("Invalid input");
				}
			
			}
		}
		else {
			System.out.println("Login failed !");
		}
		
	}

}
