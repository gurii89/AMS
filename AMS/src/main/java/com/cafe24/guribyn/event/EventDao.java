package com.cafe24.guribyn.event;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EventDao {
	
	@Autowired
	private SqlSessionTemplate SST;
	
	private String NS = "com.cafe24.guribyn.event.EventMapper.";
	
	// 행사 등록
	public void eventAdd(Event event) {
		SST.insert(NS+"eventAdd", event);
	}
	
	// 행사 목록
	public List<Event> eventList(){
		return SST.selectList(NS+"eventList");
	}
	
	// 비수기 성수기 검사
	public List<Event> eventCheck(Map<String, String> map){
		return SST.selectList(NS+"eventCheck", map);
	}
	
	// 기본 행사 fx 중복 검사
	public int eventFx(double fx) {
		return SST.selectOne(NS+"eventFx", fx);
	}
	
}
