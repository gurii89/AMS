package com.cafe24.guribyn.notice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	private final String NS="com.cafe24.guribyn.notice.NoticeMapper";
	
	//공지사항 등록처리
	public int NoticeAdd(Notice notice) {
		System.out.println("---공지사항 등록처리---------from dao");
		return sqlSessionTemplate.insert(NS+".insertNotice", notice);
	}
}
