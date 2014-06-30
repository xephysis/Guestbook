package com.test.guestbook;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GuestbookController {   
	      
	@Autowired 
	GuestbookService guestbookService;
	private static final Logger logger = LoggerFactory.getLogger(GuestbookController.class);
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)
	public String list(Map map) {
		logger.info("정상 실행~");
		guestbookService.list(map);  
		return "list";
	}// end list
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)
	public ModelAndView view(@RequestParam(value="seq")String seq){
		ModelAndView mav = new ModelAndView();
		
		Guestbook guestbook = guestbookService.select(seq);
		mav.addObject("guestbook_data", guestbook);
		mav.setViewName("view");
		
		return mav;
	}
	
	@RequestMapping(value = "/writeForm.do", method = RequestMethod.GET)
	public String writeForm(){
		 return "write";
	}// end writeForm
	  
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public ModelAndView write(HttpServletRequest request){
		Date dt = new Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String seq = request.getParameter("seq");
		String email = request.getParameter("email");
		String passwd  = request.getParameter("passwd");
		String content = request.getParameter("content");
		String createtime = sdf.format(dt);
		
		logger.info("email : "+ email + "passwd : "+ passwd + 
				"content : "+ content + "createtime : "+ createtime );
		
		ModelAndView mav =  new ModelAndView();
		Guestbook guestbook = new Guestbook();
		
		guestbook.setSeq(seq);
		guestbook.setEmail(email);
		guestbook.setPasswd(passwd);
		guestbook.setContent(content);
		guestbook.setCreatetime(createtime);
		
		guestbookService.insert(guestbook);
		mav.setViewName("redirect:/list.do");
			 
		return mav;
	}// end write
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam(value="seq", required = true)String seq){
		ModelAndView mav=  new ModelAndView();
		guestbookService.delete(seq);
		mav.setViewName("redirect:/list.do");  
		return mav;
	}// end delete
	
	@RequestMapping(value = "/updateForm.do", method = RequestMethod.GET)
	public ModelAndView updateForm(@RequestParam(value="seq",required = true)String seq ){
		ModelAndView mav = new ModelAndView();
		Guestbook guestbook = guestbookService.select(seq);
		mav.addObject("guestbook_data",guestbook);
		mav.setViewName("update");
		return mav;
	}// end updateForm
	
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public ModelAndView update(HttpServletRequest request){
		Date dt = new Date();
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		String seq = request.getParameter("seq");
		String content = request.getParameter("content");
		String passwd = request.getParameter("passwd");
		String modifiedtime = sdf.format(dt);
		
		ModelAndView mav =  new ModelAndView();
		Guestbook guestbook = guestbookService.select(seq);
		
		if(guestbook.getPasswd().compareTo(passwd)==0) {
			guestbook.setSeq(seq);
			guestbook.setContent(content);
			guestbook.setModifiedtime(modifiedtime);
					
			guestbookService.update(guestbook); 
			mav.setViewName("redirect:/list.do");
			return mav;
		} else {
			mav.setViewName("redirect:/list.do");
			return mav;
		}
	}// end update
}
