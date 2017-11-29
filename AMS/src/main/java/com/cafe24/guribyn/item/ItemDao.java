package com.cafe24.guribyn.item;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ItemDao {

	@Autowired
	SqlSessionTemplate sst;

	private final String NS = "com.cafe24.guribyn.item.ItemMapper.";

	// 물품 등록처리
	public void itemAddPro(Item item) {
		sst.insert(NS + "itemAdd", item);
	}
	
	// 물품 목록
	public List<Item> itemList() {
		return sst.selectList(NS+"itemList");
	}
}
