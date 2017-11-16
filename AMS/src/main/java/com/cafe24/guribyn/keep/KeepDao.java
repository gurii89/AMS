package com.cafe24.guribyn.keep;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.guribyn.guest.Guest;
import com.cafe24.guribyn.keep.Keep;

@Repository
public class KeepDao {

	@Autowired
	SqlSessionTemplate sst;
	
	private final String NS="com.cafe24.guribyn.keep.KeepMapper";
	
	// 전체 보관품(+페이징)
		public List<Keep> keepList(Map<String, Integer> map){
			return sst.selectList(NS+"keepList", map);
		}
		
	// 보관품 수
		public int keepCount() {
			return sst.selectOne(NS+"keepCount");
		}
	// 보관품 하나 select
	public Keep keepOne(int kCode) {
		return sst.selectOne(NS+"keepOne", kCode);
	}
	//보관품 등록처리
	public int KeepAdd(Keep keep) {
		System.out.println("보관품 등록처리 KeepDao");
		return sst.insert(NS+".keepAdd", keep);
	}
	//보관품 전체 리스트
	public List<Keep> keepList(){
		System.out.println("보관품 전체 리스트 KeepDao");
		return sst.selectList(NS+".keepList");
	}
	//보관품 수정폼
	public Keep keepOneSelect(String kCode) {
		System.out.println("KeepDao 보관품 수정폼"+ kCode + "<--보관품 코드");
		return sst.selectOne(NS+".KeepOneSelect", kCode);
	}
	
	//보관품 수정처리
	public int KeepMod(Keep keep) {
		System.out.println("KeepDao 보관품 수정처리");
		return sst.update(NS+".keepMod", keep );
	}
}
