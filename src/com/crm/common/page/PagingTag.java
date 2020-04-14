package com.crm.common.page;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class PagingTag extends TagSupport{

	private static final long serialVersionUID = 1L;
	
	private int page = 1;
	private int total = 1;
	private int list_size =10;
	private int page_size =5;

	@Override
	public int doStartTag() throws JspException{
		try{
			pageContext.getOut().println(getPaging());
			
		}catch(IOException e){
			e.printStackTrace();
		}
		return super.doStartTag();
		
	}
	public void setPage(int page){
		this.page = page;
	}
	public void setTotal(int total){
		this.total = total;
	}
	public void setList_size(int list_size){
		this.list_size = list_size;
	}
	public void setPage_size(int Page_size){
		this.page_size = Page_size;
	}
	
	public String getPaging(){
		String ret = "";
		
		if(page < 1)
			page = 1;
		if(total < 1)
			return "";
		//page �� 1 �������� page_size�� 2�̸� 
		int currentFirst = ((page-1)/page_size) * page_size +1;
		
		int currentlast = ((page-1)/page_size)*page_size +page_size;
		
		int nextFirst = (((page-1)/page_size)+1)*page_size +1;
		
		int prevLast = (((page-1)/page_size)-1)*page_size +1;
		
		int lastPage =1;
		lastPage = total / list_size;
		if (total%list_size != 0) lastPage = lastPage +1;
		
		currentlast = (currentlast>lastPage)?lastPage:currentlast;
		
		ret += "<div class='paginate'>";
		
		if(page>1){
			ret += " <a href=\"javascript:goPage('1')\"></a>";
			
		}
	else{
		ret += "";
	}
	if(prevLast > 0){
		ret += "<a href=\"javascript:goPage('"+prevLast+"');\"><</a>";
		
	}
	else{
		ret +="";
	}
	
	for(int j=currentFirst;j<currentFirst+page_size &&j<=lastPage;j++){
		if(j <=currentlast){
			if(j==page){
				ret += "<a href='#'class='on textAn'>"+j+"</a>";
				
			}else{
				ret +="<a href=\"javascript:goPage('"+j+"');\" class='textAn'>"+j+"</a>";
			}
		}
	}
	if(nextFirst <= lastPage){
		ret +="<a href=\"javascript:goPage('"+nextFirst+"')\">></a>";
	}
	else{
		ret +=">";
		
	}
	if( page<lastPage){
		ret +="<a href=\"javascript:goPage('"+lastPage+"')\"></a>";
		
	}
	else{
		ret +="";
		
	}
	ret +="</div>";
	return ret;
}


}
