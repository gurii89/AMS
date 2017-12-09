package com.cafe24.guribyn.employee;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.cafe24.guribyn.CommonService;
import com.cafe24.guribyn.login.Login;

@Service
public class EmployeeService {

	@Autowired
	EmployeeDao employeeDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CommonService commonService;
	
	// 직원 등록 처리
	public void employeeAddPro(Employee employee) {
		if(employee.geteLanguage().equals("")) {
			employee.seteLanguage(null);
		}
		Login result = (Login)session.getAttribute("loginfor");
		employee.setmId(result.geteId());
		employeeDao.employeeAddPro(employee);
	}
	
	// 직원 수정 폼
	public void employeeOne(Model model, String eId) {
		model.addAttribute("employee", employeeDao.employeeOne(eId));
	}
	
	// 직원 수정 처리
	public void employeeMod(Employee employee) {
		if(employee.geteLanguage().equals("")) {
			employee.seteLanguage(null);
		}
		employeeDao.employeeMod(employee);
	}
	
	// 직원 목록
	public void employeeList(Model model, String cate, String input, int currentPage) {
		Map<String, String> map;
		if(cate != "") { 
			map = new HashMap<String, String>();
			map.put("cate", cate);
			map.put("input", input);
		}else {
			map = null;
		}
		map = commonService.paging(model, currentPage, 10, employeeDao.employeeCount(map), map);
		model.addAttribute("employeeList", employeeDao.employeeList(map));
	}
	
	// 직원 상세보기(매니저이거나 정보를 보려는 본인이 로그인 상태일 경우만 허용)
	public boolean employeeDetail(Model model, String eId) {
		Login result = (Login)session.getAttribute("loginfor");
		if(!result.geteDepartment().equals("manager")) {
			if(!result.geteId().equals(eId)) {
				return false;
			}
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("cate", "employee.e_id");
		map.put("input", eId);
		model.addAttribute("employee", employeeDao.employeeList(map).get(0));
		return true;
	}
	
	// 직원 비밀번호 변경
	public String employeePw(String now, String after) {
		Login result = (Login)session.getAttribute("loginfor");
		Map<String, String> map = new HashMap<String, String>();
		map.put("now", now);
		map.put("after", after);
		map.put("eId", result.geteId());
		return "" + employeeDao.employeePw(map);
	}
	
}
