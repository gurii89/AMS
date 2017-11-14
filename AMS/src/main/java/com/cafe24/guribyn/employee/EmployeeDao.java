package com.cafe24.guribyn.employee;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {
	
	@Autowired
	private SqlSessionTemplate SST;
	private String NS = "com.cafe24.guribyn.employee.EmployeeMapper.";
	
	// 직원 등록 처리
	public void employeeAddPro(Employee employee) {
		SST.insert(NS+"employeeAdd", employee);
	}
	
	// 직원 수정 폼
	public Employee employeeMod(String eId) {
		return SST.selectOne(NS+"employeeMod", eId);
	}
	
	// 직원 수정 처리
	public void employeeModPro(Employee employee) {
		SST.update(NS+"employeeModPro", employee);
	}
}
