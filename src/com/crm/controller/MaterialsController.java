package com.crm.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;



import com.crm.common.page.Paging;
import com.crm.common.util.util;
import com.crm.service.MaterialsService;
import com.crm.vo.MaterialsVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
@RequestMapping(value="/materials")
public class MaterialsController {
	public static final String PATH="materials/";
	@Autowired
	private MaterialsService boardService;
	
	@RequestMapping(value="/chaebunBoard2")
	public ModelAndView chaebunBoard2(@ModelAttribute MaterialsVO param){
		System.out.println("chaebunBoard() start");
		
		String list = boardService.chaebunBoard2();
		System.out.println("list >>> : "+list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName(PATH+"insert");
		System.out.println("mav >>> : "+mav);
		System.out.println("chaebunBoard() end");
		return mav;
	}// end of chaebunBoard()
	
	@RequestMapping(value="/listBoard")
	public ModelAndView listBoard(MaterialsVO bvo , Model model){
		
		System.out.println("listBoard() start");
		Paging.setPage(bvo);
		int total = boardService.materialsCnt(bvo);
		
		int count = total -(util.nvl(bvo.getPage())-1)*util.nvl(bvo.getPageSize());

		List<MaterialsVO> list = boardService.listBoard(bvo);
		
	//	System.out.println("list.toString() >> : "+list.toString());
		model.addAttribute("boardList",list);
		model.addAttribute("count",count);
		model.addAttribute("total",total);
		model.addAttribute("data",bvo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName(PATH+"board");
		
	//	System.out.println("mav >>> : "+mav);
		System.out.println("listBoard() end");
		return mav;
	}// end of listBoard()

	@RequestMapping(value="/insertMaterials")
	public ModelAndView insertBoard(@ModelAttribute MaterialsVO materialsVO,HttpServletRequest request){
		System.out.println("insertBoard() start");
	
		int size = 15 * 1024 * 1024 ; // 최대 Upload 크기 15M byte
		String c_materials_no = "";
		String c_materials_title = "";
		String c_materials_name = "";
		String c_materials_memo = "";
		String c_materials_file = "";
		String c_materials_pw = "";
		String resultStr = "";
		String c_materials_oFile;
		System.out.println("c_materials_no"+c_materials_no);
		System.out.println("c_materials_title"+c_materials_title);
		String savepath = request.getRealPath("upload");
		MaterialsVO bvo = null;
		ModelAndView mav = null;
		
		try{

			System.out.println("try");
			MultipartRequest mt = new MultipartRequest(request,
														savepath,
														size,
														"UTF-8",
														new DefaultFileRenamePolicy());
			
			c_materials_no = mt.getParameter("c_materials_no");
			System.out.println("1 > "+c_materials_no);
			c_materials_title = mt.getParameter("c_materials_title");
			System.out.println("2 > "+c_materials_title);
			c_materials_name = mt.getParameter("c_materials_name");
			System.out.println("3 > "+c_materials_name);
			c_materials_memo = mt.getParameter("c_materials_memo");
			System.out.println("4 > "+c_materials_memo);
			c_materials_pw = mt.getParameter("c_materials_pw");
			System.out.println("5 > "+c_materials_pw);
			c_materials_file = mt.getFilesystemName("c_materials");
			System.out.println("6 > "+c_materials_file);
			c_materials_oFile = mt.getOriginalFileName("c_materials");
			System.out.println("7 > "+c_materials_oFile);
			System.out.println("c_materials_oFile >>> : "+c_materials_oFile);
			System.out.println("yno >>> : "+c_materials_no);
			if(c_materials_no.length() == 1){
				c_materials_no = "000"+c_materials_no;
		}
			if(c_materials_no.length() == 2){
				c_materials_no = "00"+c_materials_no;
		}
		if(c_materials_no.length() == 3){
			c_materials_no = "0"+c_materials_no;
		}
		if(c_materials_no.length() == 4){
			c_materials_no = ""+c_materials_no;
			}
			
			bvo = new MaterialsVO();
			bvo.setC_materials_no(c_materials_no);
			bvo.setC_materials_title(c_materials_title);
			bvo.setC_materials_memo(c_materials_memo);
			bvo.setC_materials_name(c_materials_name);
			bvo.setC_materials_pw(c_materials_pw);
			bvo.setC_materials_file(c_materials_file);
			bvo.setC_materials_oFile(c_materials_oFile);
			int result = boardService.insertBoard(bvo);
			
			if(result > 0) resultStr = "입력이 완료되었습니다.";
			else resultStr = "입력에 실패하였습니다.";
			System.out.println("resultStr > "+resultStr);
			
			mav = new ModelAndView();
//			mav.addObject("result", resultStr);
			mav.setViewName("redirect:/materials/listBoard.crm");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("오류 >>> : "+e.getMessage());
		}
		System.out.println("mav >>> : "+mav);
		System.out.println("insertBoard() end");
		
		return mav;
		
	}// end of insertBoard()
	@RequestMapping(value="/selectBoard")
	public ModelAndView selectBoard(@ModelAttribute MaterialsVO param,HttpServletRequest request){
		System.out.println("selectBoard() start");
		System.out.println("MaterialsVO = " + param.toString());
		int cnt = boardService.ViewCnt(param);
		System.out.println("param > "+param);
		List<MaterialsVO> list = boardService.selectBoard(param);
		System.out.println("list >>> : "+list);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		
		String isud = request.getParameter("ISUD_TYPE");
		
		if(isud.equals("S")){
			mav.setViewName(PATH+"boardOne");
		}
		if(isud.equals("U")){
			mav.setViewName(PATH+"updateBoard");
		}
		if(isud.equals("D")){
			mav.setViewName(PATH+"deleteBoard");
		}
		System.out.println("selectBoard() end");
		return mav;
	}//end of selectBoard()
	
	@RequestMapping("/updateBoard")
	public ModelAndView updateBoard(@ModelAttribute MaterialsVO param, HttpServletRequest request){
		System.out.println("updateBoard() start");
		int size = 102400;
		String c_materials_no = "";
		String c_materials_title = "";
		String c_materials_name = "";
		String c_materials_memo = "";
		String c_materials_file = "";
		String c_materials_pw = "";
		String resultStr = "";
		String c_materials_oFile;
		MaterialsVO bvo = null;
		ModelAndView mav = null; 
		String savepath = request.getRealPath("upload");
		try{
			MultipartRequest mt = new MultipartRequest(request,
																							savepath,
																		                    size,
																		                    "UTF-8",
																		                    new DefaultFileRenamePolicy());
			c_materials_no = mt.getParameter("c_materials_no");
			c_materials_title = mt.getParameter("c_materials_title");
			c_materials_name = mt.getParameter("c_materials_name");
			c_materials_memo = mt.getParameter("c_materials_memo");
			c_materials_pw = mt.getParameter("c_materials_pw");
			c_materials_file = mt.getFilesystemName("c_materials_file");
			c_materials_oFile = mt.getOriginalFileName("c_materials_file");
			System.out.println("c_materials_file >>> : "+c_materials_file);
			System.out.println("c_materials_oFile >>> : "+c_materials_oFile);
			bvo = new MaterialsVO();
			bvo.setC_materials_no(c_materials_no);
			bvo.setC_materials_title(c_materials_title);
			bvo.setC_materials_memo(c_materials_memo);
			bvo.setC_materials_name(c_materials_name);
			bvo.setC_materials_pw(c_materials_pw);
			bvo.setC_materials_file(c_materials_file);
			bvo.setC_materials_oFile(c_materials_oFile);
			int result = boardService.updateBoard(bvo);
			
			if(result > 0) resultStr = "수정이 완료되었습니다.";
			else resultStr = "수정에 실패하였습니다.";
			
			mav = new ModelAndView();
			mav.addObject("result", resultStr);
			mav.setViewName("redirect:/materials/listBoard.crm");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("오류 >>> : "+e.getMessage());
		}
		System.out.println("mav >>> : "+mav);
		
		
		System.out.println("updateBoard() end");
		return mav;
	}// end of updateBoard()
	
	@RequestMapping("/deleteBoard")
	public ModelAndView deleteBoard(@ModelAttribute MaterialsVO bvo){
		System.out.println("deleteBoard() start");
		String resultStr = "";
		int result = boardService.deleteBoard(bvo);
		if(result > 0) resultStr = "삭제가 완료되었습니다.";
		else resultStr = "삭제에 실패하였습니다.";
		ModelAndView mav = new ModelAndView();
		
		mav = new ModelAndView();

		mav.setViewName("redirect:/materials/listBoard.crm");
		System.out.println("deleteBoard() end");
		return mav;
	}// end of deleteBoard()
	
	
	@RequestMapping("/ss")
	public ModelAndView ss(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		MultipartRequest multi = null;
	    String savepath = request.getRealPath("upload");
	    // WebContent 폴더에 upload 폴더를 생성하고 실행할 것
	    // D:\ws\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TestPrj16\"upload"
	    System.out.println(savepath);
	    int limitSize = 15 * 1024 * 1024 ; // 최대 Upload 크기 15M byte
	    
	    String comment      = "";
	    String filename1    = "";
	    String orgFileName1 = "";
	    String filename2    = "";
	    String orgFileName2 = "";
	    try {
	        multi = new MultipartRequest(request,  // 일반 request (text) 정보 
	            savepath,    // 업로드된 파일의 저장 경로
	            limitSize,   // 파일 최대 크기 제한
	            "UTF-8",     // encoding
	            new DefaultFileRenamePolicy()); // 중복파일 처리
	        comment = multi.getParameter("comment");
	        // comment = request.getParameter("comment"); // null
	        // 이유는 request를 MultipartRequest() 가 가로챈다
	        
	        
	        // 여러파일 처리
	        Enumeration files = multi.getFileNames();
	        
	        String file1 = (String) files.nextElement();
	        filename1    = multi.getFilesystemName(file1);
	        orgFileName1 = multi.getOriginalFileName(file1);
	        
	        String file2 = (String) files.nextElement();
	        filename2    = multi.getFilesystemName(file2);
	        orgFileName2 = multi.getOriginalFileName(file2);
	            
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    MaterialsVO mvo = null;
	    mvo = new MaterialsVO();
	    mvo.setComment(comment);
	    mvo.setFilename1(filename1);
	    mvo.setFilename2(filename2);
	    mvo.setOrgFileName1(orgFileName1);
	    mvo.setOrgFileName2(orgFileName2);
	    
	    mav.addObject("mvo", mvo);
	    mav.setViewName("materials/ee");
		return mav;
	}
	
	
	@RequestMapping("/cc")
	public ModelAndView cc(HttpServletRequest request){
	
		ModelAndView mav = new ModelAndView();
	
		mav.addObject("request", request);
	
		mav.setViewName("materials/cc");
		
		return mav;
	}
}// end of class

