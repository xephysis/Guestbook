package com.test.guestbook;

import java.util.Map;

public interface GuestbookService {
	
	public void list(Map map);
	
	public void insert(Guestbook guestbook);
	
	Guestbook select(String seq);
	
	public void delete(String seq);
	
	public void update(Guestbook guestbook);
	
}
