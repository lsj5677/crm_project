package com.crm.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.service.ReplyService;
import com.crm.vo.ReplyVO;


@Controller
@RequestMapping(value="/replies")
public class ReplyController {
	Logger log = Logger.getLogger(ReplyController.class);
	
	@Autowired
	private ReplyService replyService;
	
	//댓글 글목록 구현
	@ResponseBody
	@RequestMapping(value="/all/{c_board_no}.crm",method= RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>>list(@PathVariable("c_board_no") String c_board_no)
	{
		ResponseEntity<List<ReplyVO>> entity = null;
		try{
			entity = new ResponseEntity<>(replyService.replyList(c_board_no),HttpStatus.OK);
			
			
		} catch (Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			
		}
		System.out.println("entity >>> : "+entity);
	
		return entity;
		
		
		
	}
	//댓글 글쓰기 구현
	@ResponseBody
	@RequestMapping(value="/replyInsert")
	public ResponseEntity<String> replyInsert(@RequestBody ReplyVO rvo){
			log.info("replyInsert 호출 성공");
			
			ResponseEntity<String> entity = null;
			int chaebun = replyService.chaebunBoard8();
			String chaebun2 = chaebun+"";
			System.out.println("No >> " + chaebun2);
			if(chaebun2.length() == 1){
				chaebun2 = "000" + chaebun2;
			}	
			if(chaebun2.length() == 2){
				chaebun2 = "00" + chaebun2;
			}	
			if(chaebun2.length() == 3){
				chaebun2 = "0" + chaebun2;
			}	
			if(chaebun2.length() == 4){
				chaebun2 = ""+ chaebun2;
			}	
			System.out.println("No >> " + chaebun2);	
			rvo.setC_comment_no(chaebun2);
			
			int result;
			try{
				result = replyService.replyInsert(rvo);
				if(result==1){
					entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
					
					
				}
				
				
			}catch(Exception e){
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
				
			}
			return entity;
			
	}
//댓글 수정
	@ResponseBody
	@RequestMapping(value = "/{C_COMMENT_NO}.crm",method = {RequestMethod.PUT,RequestMethod.PATCH})
		public ResponseEntity<String> replyUpdate(@PathVariable("C_COMMENT_NO")String c_comment_no, @RequestBody ReplyVO rvo){
		log.info("replyUpdate 호출 성공");

		System.out.println("no > : "+rvo.getC_comment_no());
		System.out.println("content > : "+rvo.getC_comment_content());
		System.out.println("replyUpdate 호출 성공");
		ResponseEntity<String> entity = null;

		try{
			rvo.setC_comment_no(c_comment_no);
				int result = replyService.replyUpdate(rvo);
				entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			
		}
		return entity;
		
	}
// 댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/{c_comment_no}.crm",method = RequestMethod.DELETE)
	public ResponseEntity<String> replyDelete(@PathVariable("c_comment_no")String c_comment_no) {

	log.info("replyDelete 호출 성공");
	ResponseEntity<String> entity = null;
	try{
	replyService.replyDelete(c_comment_no);
	entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}catch(Exception e){
		e.printStackTrace();
		entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);

	}
	return entity;
	}
}