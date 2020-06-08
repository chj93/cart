package sist.com.dao;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import sist.com.bean.AdminProductBean;

@Component
public class CartDao extends SqlSessionDaoSupport {

	@Resource
	protected void initDao(SqlSessionTemplate st) throws Exception {
		// TODO Auto-generated method stub
		this.setSqlSessionTemplate(st);
	}

	public boolean loginPwCheck(String id, String pw) {
		String dbPw = this.getSqlSession().selectOne("loginPwCheck", id);
		//System.out.println(dbPw != null && dbPw.equals(pw));
		return dbPw != null && dbPw.equals(pw);
	}

	public List<AdminProductBean>selectAdmin(String id){
		return this.getSqlSession().selectList("selectAdmin",id);
	}

	public void insertProduct(AdminProductBean bean) {
		this.getSqlSession().insert("insertProduct", bean);	     
	}
	
	public Object adminProductInfo(int pk) {
		return this.getSqlSession().selectOne("adminProductInfo",pk);
	}
	
	public void adminProductAdd(AdminProductBean bean) {
		this.getSqlSession().insert("adminProductAdd",bean);
	}
	
	public void adminProductModify(AdminProductBean bean) {
		 this.getSqlSession().update("adminProductModify", bean);
	}
	
	public List<AdminProductBean> selectProductList() {
		return this.getSqlSession().selectList("selectProductList");
	}
}
