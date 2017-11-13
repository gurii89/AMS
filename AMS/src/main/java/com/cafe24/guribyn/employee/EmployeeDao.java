package com.cafe24.guribyn.employee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {
	
	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.employee.EmployeeMapper.";

	public void employeeAdd(Employee employee) {
		SST.insert(NS+"employeeAdd", employee);
	}
}
