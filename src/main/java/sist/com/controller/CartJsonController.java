package sist.com.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import sist.com.dao.CartDao;

@RestController
public class CartJsonController {
	
	@Inject
	private CartDao dao;
	
	
	@RequestMapping(value="adminInfo.do")
	public Object adminInfo(int pk) {
		return dao.adminProductInfo(pk);
		
	}
	
	
}
