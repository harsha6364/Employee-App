package com.emp.dao;

import java.util.List;

import com.emp.dto.Dept;

public interface DeptDAO {
	
	void addDept(Dept d);
	
	Dept findById(Dept d);
	
	Dept findByDno(Dept d);
	
	List<Dept> findAll();
	
	void updateDept(Dept d);
	
	void deleteDept(Integer dno);
}
