package sist.com.bean;

public class AdminProductBean {
	private String id;
	private int 	pk;
	private String productName;
	private int productPrice;
	private String productOrigin;
	private String productCategory;
	private String fileName;
	private String regdate;
	private String seller;
	private String job; 
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getPk() {
		return pk;
	}


	public void setPk(int pk) {
		this.pk = pk;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public String getProductOrigin() {
		return productOrigin;
	}


	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}


	public String getProductCategory() {
		return productCategory;
	}


	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public String getSeller() {
		return seller;
	}


	public void setSeller(String seller) {
		this.seller = seller;
	}


	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	@Override
	public String toString() {
		return "AdminProductBean [id=" + id + ", pk=" + pk + ", productName=" + productName + ", productPrice="
				+ productPrice + ", productOrigin=" + productOrigin + ", productCategory=" + productCategory
				+ ", fileName=" + fileName + ", regdate=" + regdate + ", seller=" + seller + ", job=" + job + "]";
	}
	
	
}
