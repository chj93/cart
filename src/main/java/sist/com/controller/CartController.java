package sist.com.controller;

import java.io.FileOutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sist.com.bean.AdminProductBean;
import sist.com.dao.CartDao;

@Controller
public class CartController {
	
	@Inject
	private CartDao dao;
	
	@RequestMapping(value="adminlogin.do")
	public String adminLoginCheck(String id, String pw,HttpSession session) {
		//System.out.println(id+" "+pw);
		session.setAttribute("id", id);
		return dao.loginPwCheck(id, pw)? "redirect:adminProductList.do":"redirect:admin/jsp/adminLogin.jsp" ;
		
		//return "redirect:adminProductList.do";
	}
	
	@RequestMapping(value="adminProductList.do")
	public String productListProcess(Model model,HttpSession session) {
		model.addAttribute("adminList",dao.selectAdmin(((String)session.getAttribute("id"))));
		return "cart/productAdd";
	}
	
	@RequestMapping(value="productInsert.do")
	public String productInsertProcess(AdminProductBean bean,@RequestParam(value="file",required=false)MultipartFile file) {
		String locations="C:\\Users\\USER\\Desktop\\import\\Cart\\web\\src\\main\\webapp\\cartUp\\";
		FileOutputStream fos=null;
		String fileName=file.getOriginalFilename();
		if(fileName.length()>0) {
			try {
				fos=new FileOutputStream(locations.concat(fileName));
				fos.write(file.getBytes());
				bean.setFileName(fileName);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}finally {
				try {
					if(fos!=null)fos.close();
				} catch (Exception e2) {
					// TODO: handle exception
					e2.printStackTrace();
				}
			}
		}
		//if 끝- upload
		//System.out.println(bean);
		bean.setPk(bean.getJob().startsWith("modify")?Integer.parseInt(bean.getJob().split("#")[1]):0);
		
		if(fileName.length()==0&&bean.getJob().equals("new")) {
			bean.setFileName("noimg.jpg");
		}
		
   		System.out.println(bean);
   		if(bean.getJob().equals("new")) {
   			dao.adminProductAdd(bean);    			
   		}else {
   			dao.adminProductModify(bean);	
   		}

		//dao.insertProduct(bean);
		
		return "redirect:adminProductList.do";
	}
/*	
	@RequestMapping(value="adminModify.do")
	public String modifyProductAdmin(AdminProductBean bean,@RequestParam(value="file",required=false)MultipartFile file) {
		System.out.println(bean);
		System.out.println(file);
		return "redirect:adminProductList.do";
	}
	*/
	@RequestMapping(value="chartAction.do")
	public String chartProcess(Model model) {
		model.addAttribute("title","항목별 판매");
		model.addAttribute("chartList",dao.selectAdmin("admin"));
		return "cart/chart";
	}
	
	@RequestMapping(value="clientList.do")
	public String clientProcessList(Model model) {
		//dao.selectProductList
		model.addAttribute("productList",dao.selectProductList());
		return "cart/productList";
	}
	
}
