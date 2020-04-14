package com.crm.common;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.crm.vo.ProductVO;;

public class JsoupParser {
	public final static String DEFAULT_DOWNLOAD_PATH = "D:/BITCAMP/02.workspace/crm/WebContent/resource/img/product_Image/";

	public static void main(String[] args) {
		try {
			getHref("https://www.hermes.com/us/en/women/accessories/#||Category");
		} catch (Exception e) {
			e.printStackTrace();
		}//try-catch
	}// main()
	
	//URL 가져오기
	public static List<ProductVO> getHref(String url) throws Exception {
		List<String> urls = new ArrayList<String>();
		
		Document doc = null;
		doc = Jsoup.connect(url).get();
		Elements elements = doc.select("div.product-item a");
		
		for(Element element : elements) {
			String href = element.attr("abs:href");
			urls.add(href);
		}// for
		System.out.println(urls.size());
		return connectUrls(urls);
	}// getHref();
	
	//URL 접속해서 값 가져오기
	public static List<ProductVO> connectUrls(List<String> urls) throws Exception {
		Document doc = null;
		List<ProductVO> product = new ArrayList<>();
		
		for(int i = 0; i < urls.size(); i++) {
			doc = Jsoup.connect(urls.get(i)).get();
			ProductVO productVO = new ProductVO();
			
			productVO.setC_id(doc.select("p.product-sku").text().replace("Product reference: ", ""));
			productVO.setC_name(doc.select("p.product-title").text());
			productVO.setC_price(doc.select("p.product-price").text());
			productVO.setC_info(doc.select("p.product-attribute-font-description").text());
			productVO.setC_stock("100");
			productVO.setC_category1("women");
			productVO.setC_category2("womenaccessories");

			Elements elements = doc.select("img.gallery-img");
			productVO.setC_image(downloadImage(elements, doc.select("p.product-sku").text().replace("Product reference: ", "")));

			product.add(productVO);
		}// for
		System.out.println(product.size());
		return product;
	}// connectUrls()
	
	//이미지 저장하기
	public static String downloadImage(Elements _elements, String _id) throws Exception {
		String folderName = DEFAULT_DOWNLOAD_PATH + _id;
		String filesNames = "";
		
		if(_elements != null ) {
			
			File folder = new File(folderName);
			if (!folder.exists()) {
				folder.mkdir();
			}
			
			for(Element element : _elements) {
				String src = element.attr("abs:src").replaceAll("130", "720");
				String strImageName = src.substring(src.lastIndexOf("--") + 1);
				filesNames += strImageName + ",";

		        Path target = Paths.get(folderName, strImageName); 
        		URL urlImage = new URL(src);
 		        InputStream in = urlImage.openStream();
 		        Files.copy(in, target, StandardCopyOption.REPLACE_EXISTING);
 		        in.close();
			}// for
			
		}// if
		return filesNames.substring(0, filesNames.length()-1);
	}// downloadImage()
	
}// Jsoup class
