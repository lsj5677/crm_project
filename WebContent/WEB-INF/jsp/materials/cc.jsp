<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page import="java.io.*" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  	request.setCharacterEncoding("utf-8"); // 한글처리(POST)
  	
    String fn = request.getParameter("fn");
    System.out.println(fn);
    
    String         savepath = "upload";
    ServletContext context  = this.getServletContext();
    String sDownloadPath    = context.getRealPath(savepath);
    String sFilePath        = sDownloadPath + "\\" + fn;
    
    byte [] b = new byte[4096];
    File oFile = new File(sFilePath);
    
    FileInputStream fis = new FileInputStream(oFile);
    
    String sMimeType = getServletContext().getMimeType(sFilePath);
    System.out.println("MimeType: " +  sMimeType); 
    
    if( sMimeType == null ) sMimeType = "application/octet-stream";
    response.setContentType(sMimeType);
    
    // 한글 파일명 깨지는 것 방지
    String sEncoding = new String(fn.getBytes("UTF-8"), "8859_1");
    // 이부분이 모든 파일 링크를 클릭했을 때 
    //   다운로드 화면이 출력되게 처리하는 부분
    response.setHeader("Content-Disposition", 
        "attachment; filename=" + sEncoding);
    out.clear();

    out=pageContext.pushBody(); 

    ServletOutputStream out2 = response.getOutputStream();
    int numRead;
    
    while((numRead = fis.read(b, 0, b.length))!= -1) {
        out2.write(b, 0, numRead);
    }
  
    out2.flush();
    out2.close();
    fis.close();    
  // 한글 파일이 다운로드 되지 않으면 \
  // server.xml : 
  //  <Connector /> 태그에 URIEncoding="utf-8" 추가하면된다
%>
