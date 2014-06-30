package com.test.guestbook;

import java.util.Map;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
@Transactional
public class GuestbookServiceImpl implements GuestbookService{
	
	@Autowired
	private SqlMapClientTemplate sqlMapClientTemplate;
	  
	public void list(Map map) {
		map.put("guestbooklist",sqlMapClientTemplate.queryForList("list"));
	}

	public void insert(Guestbook guestbook) {
		sqlMapClientTemplate.insert("insert", guestbook);
	}
 
	public Guestbook select(String seq) { 
		return (Guestbook)sqlMapClientTemplate.queryForObject("select", seq);
	}

	public void delete(String seq) {
		sqlMapClientTemplate.delete("delete",seq);
	}

	public void update(Guestbook guestbook) {
		sqlMapClientTemplate.update("update", guestbook);
	}
}
