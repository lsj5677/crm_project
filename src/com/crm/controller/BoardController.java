package com.crm.controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.crm.common.FileUploadUtil;
import com.crm.common.page.Paging;
import com.crm.common.util.util;
import com.crm.service.BoardService;
import com.crm.vo.BoardVO;

@Controller
@RequestMapping(value="/board")

public class BoardController {
	Logger logger =Logger.getLogger(BoardController.class);
	
	@Autowired
	
	private BoardService boardService;
	
	/*글목록 구현
	 * 
	 */
	@RequestMapping(value="/boardList")
	public String boardList(@ModelAttribute BoardVO bvo, Model model,HttpServletRequest req) {
		System.out.println("req.getContentType() >>>  "+req.getContentType());
		System.out.println("req.getCharacterEncoding() >>>  "+req.getCharacterEncoding());
		String startDate = "";
		String endDate = "";
		startDate = req.getParameter("startDate");
		endDate = req.getParameter("endDate");
		if(startDate != null && endDate != null){
			System.out.println("ss");
			bvo.setStartDate(startDate);
			bvo.setEndDate(endDate);
			bvo.setSearch("c_board_insertdate");
		}
		
		System.out.println(">>>"+startDate);
		System.out.println(">>>>"+endDate);
		
		String url ="";
		logger.info("boardList 호출 성공");
		logger.info("order_by="+bvo.getOrder_by());
		logger.info("order_sc="+bvo.getOrder_sc());
		
		//검색 데이터 확인
		System.out.println("search="+bvo.getSearch());
		System.out.println("keyword="+bvo.getKeyword());

		//페이지 셋팅
		Paging.setPage(bvo);
		//전체 레코드 수 구현
		int total = boardService.boardListCnt1(bvo);
		System.out.println("total="+total);
		
		//글번호 재설정
		int count = total -(util.nvl(bvo.getPage())-1)*util.nvl(bvo.getPageSize());
		logger.info("cont="+ count);
		url = "board/boardList";
		String abc = bvo.getC_board_select();
		if(abc == null){
			abc = "";
		}
		if(abc.equals("0")){
			abc = "공지사항";
			bvo.setC_board_select("공지사항");
		}
		if(abc.equals("1")){
			abc = "자유게시판";
			bvo.setC_board_select("자유게시판");
		}
		System.out.println("abc>> : "+ abc);
			
		if(abc.equals("공지사항") ){
			System.out.println("111>> :");
			url = "board/admin";
		}
		if(abc.equals("자유게시판")){
			System.out.println("222>> :");
			url = "board/freeboard";
		}

		List<BoardVO> boardList = boardService.boardList(bvo);
		System.out.println("list");
		System.out.println("url >> : " + url);
		
		model.addAttribute("boardList",boardList);
		model.addAttribute("count",count);
		model.addAttribute("total",total);
		model.addAttribute("data",bvo);
	
		return url;
		
				
	}
	/*
	 * 글쓰기 폼 출력하기
	 */
	@RequestMapping(value="/writeForm", method=RequestMethod.GET)
	public String writeForm(){
		logger.info("writeForm 호출 성공");
		
		return "board/writeForm";
		
	}
	/*
	 * 글쓰기 구현하기
	 * 
	 */
	@RequestMapping(value="/boardInsert",method=RequestMethod.POST)
	public String boardInsert(@ModelAttribute BoardVO bvo,HttpServletRequest request)
										throws IllegalStateException, IOException{
		request.setCharacterEncoding("UTF-8");
		System.out.println("req.getCharacterEncoding() >>>  "+request.getCharacterEncoding());
		logger.info("boardInsert 호출성공");
		logger.info("fileName : " + bvo.getFile().getOriginalFilename());
		logger.info("b_title:"+ bvo.getC_board_title());
		int chaebun = boardService.chaebunBoard3();
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
		bvo.setC_board_no(chaebun2);
		int result = 0;
		String url ="";
		
		String setC_board_img = FileUploadUtil.fileUpload(bvo.getFile(),request);
		bvo.setC_board_img(setC_board_img);
		System.out.println("No33 >> ");
		result = boardService.boardInsert(bvo);
		System.out.println("No44 >> ");
		String a = bvo.getC_board_select();
		
		if(a.equals("공지사항")){
			url = "/board/boardList.crm?c_board_select=0";
		}
		if(a.equals("자유게시판")){
			url = "/board/boardList.crm?c_board_select=1";
		}
		System.out.println("url >> : "+ url);
		return "redirect:"+url;
	}
	
	/*
	 * 글 상세보기 구현
	 */
	@RequestMapping(value="/boardDetail", method=RequestMethod.GET)
	public String boardDetail(@ModelAttribute BoardVO pvo, Model model,HttpServletRequest req){
		logger.info("boardDetail 호출 성공");
		logger.info("b_num ="+ pvo.getC_board_no());
		String a = "";
		Object obj = req.getParameter("a");
		if(obj != null){
			a = req.getParameter("a");
		}
		System.out.println("a >>> : "+a);
		String url = "";
		
		if(a.equals("a")){
			System.out.println("들어옴");
			int cnt = boardService.updateViewCnt0(pvo);
			BoardVO detail = new BoardVO();
			
			detail = boardService.boardDetail(pvo);
			
			if(detail !=null && (!detail.equals(""))){
				detail.setC_board_content(detail.getC_board_content().toString().replaceAll("\n", "<br>"));
				
			}
			url = "board/aa";
			model.addAttribute("detail",detail);
		
		}else{
			
			int cnt = boardService.updateViewCnt0(pvo);
			BoardVO detail = new BoardVO();
			
			detail = boardService.boardDetail(pvo);
			
			if(detail !=null && (!detail.equals(""))){
				detail.setC_board_content(detail.getC_board_content().toString().replaceAll("\n", "<br>"));
				
			}
			url = "board/boardDetail";
			model.addAttribute("detail",detail);
		}
		
		return url;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/pwdConfirm",method=RequestMethod.POST)
	public String pwdConfirm(@ModelAttribute BoardVO bvo){
		logger.info("pwdConfirm 호출 성공");
	//아래 변수에는 입력 성공에 대한 상태값 저장 (1 or 0)
		
		int result = 0;
		result = boardService.pwdConfirm(bvo);
		
		logger.info("result = " +result);
		return result + "";
	}
	/*
	 * 글수정 폼 출력하기
	 * @param : b_num
	 * @return BoardVO
	 */
	@RequestMapping(value="/updateForm",method=RequestMethod.POST)
	public String updateForm(@ModelAttribute BoardVO pvo,Model model){
	
		logger.info("updateForm 호출 성공");
		logger.info("b_num ="+ pvo.getC_board_no());
		
		BoardVO updateData = new BoardVO();
		updateData = boardService.boardDetail(pvo);
		
		model.addAttribute("updateData",updateData);
		return "board/updateForm";
		
		
	}		
		/*
		 * 글수정 구현하기
		 * 
		 */
	@RequestMapping(value="/boardUpdate",method=RequestMethod.POST)
	public String boardUpdate(@ModelAttribute BoardVO bvo,HttpServletRequest request)
						throws IllegalStateException,IOException{
		
		
		logger.info("boardUpdate 호출성공");
		
		int result =0;
		String url="";
		String c_board_img="";
		
		if(!bvo.getFile().isEmpty()){
			FileUploadUtil.fileDelete(bvo.getC_board_img(), request);
			c_board_img = FileUploadUtil.fileUpload(bvo.getFile(), request);
			bvo.setC_board_img(c_board_img);
		}else{
			logger.info("첨부파일 없음");
			bvo.setC_board_img("");
		}
		logger.info("b_file ="+ bvo.getC_board_img());
		result = boardService.boardUpdate(bvo);
		
		if(result == 1){
			url="/board/boardList.crm"; //수정후 목록으로 이동
			//아래 url은 수정후 상세페이지로 이동
			//url="/board/boardDetail.do?b_num="+bvo.getB_num();
			
			
		}
		return "redirect:"+url;
		
		
	}
	
	@RequestMapping(value="/boardDelete")
	public String boardDelete(@ModelAttribute BoardVO bvo,HttpServletRequest request)
													throws IOException{
		logger.info("boardDelete 호출 성공");
		// 아래 변수에는 삭제 성공에 대한 상태값 담습니다.(1 or 0)
		int result = 0;
		String url="";
		FileUploadUtil.fileDelete(bvo.getC_board_img(),request);
		result = boardService.boardDelete(bvo.getC_board_no());
		
		if(result ==1){
			url="/board/boardList.crm";
			
			
		}
		return"redirect:"+url;
	}
	
	@RequestMapping(value="/boardNotice")
	@ResponseBody
	public List<BoardVO> boardNotice() throws IOException{
		logger.info("BoardController.boardNotice >>> start");
		return boardService.boardNotice();
	}// boardNotice()
	
	}
	
	