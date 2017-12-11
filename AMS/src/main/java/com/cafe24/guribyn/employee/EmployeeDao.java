package com.cafe24.guribyn.employee;

import java.util.List;
import java.util.Map;

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
	public Employee employeeOne(String eId) {
		return SST.selectOne(NS+"employeeOne", eId);
	}
	
	// 직원 수정 처리
	public void employeeMod(Employee employee) {
		SST.update(NS+"employeeMod", employee);
	}
	
	// 직원 목록
	public List<Employee> employeeList(Map<String, String> map){
		return SST.selectList(NS+"employeeList", map);
	}
	
	// 비밀번호 변경
	public int employeePw(Map<String, String> map) {
		return SST.update(NS+"employeePw", map);
	}
	
	// 직원 수
	public int employeeCount(Map<String, String> map) {
		return SST.selectOne(NS+"employeeCount", map);
	}
	
}
