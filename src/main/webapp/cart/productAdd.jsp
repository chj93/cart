<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
 <link href="/web/css/contents.css" rel="stylesheet" type="text/css" /> 
<link href="/web/css/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.0.min.js"></script>
<script >
$(document).ready(function(){
	var pk;
	 $(".buttonFuc>a").click(function(){
		pk=this.id;
		$.ajax({
 			url:'adminInfo.do',
			dataType:'json',
			type:'post',
			data:{pk:this.id},
			success:function(data){	
				
				$("#productName").val(data.productName);
				$("#productOrigin").val(data.productOrigin);
				$("#productPrice").val(data.productPrice);
				$("#productCategory").val(data.productCategory);
				
				$("#pk").val(this.id);
				
				$("#save").text('수정');
			
			},error:function(){
				alert('error!');
			}
		});
	 });
	 $("#save").click(function(){
		 var state=$("#save").text();
		 if(state=='수정'){
			 //$("form").attr("action","adminModify.do");
			 $("input#job").val('modify'+"#"+pk);
		 }
/*  		 else if(state=='저장'){
			 $("form").attr("action","/web/productInsert.do");
		 } */
		 $("form").submit();		 
	 });	
	 
	 $("#chart").click(function(){
			$.ajax({
				url:'/web/chartAction.do',
				type:'GET',
				datatype:'script',
				success:function(v){
				 	eval(v);
				},
				error:function(){
					alert('error');
				}
				
				
			}) 
		 });
	 
});

</script>
</head>
<body> 
	<div id="wrap">
		<!-- header -->
		<jsp:include page="/include/topGnb.jsp"></jsp:include>
		<!--// header -->

		<div id="sub_container">
			<div id="contentsWrap" class="sub_con5">
				<div class="board_form">   
		            <div class="con_title">
		               <p>상품등록/보기/수정</p>   
		            </div>
			
			
			
				<div class="contents">
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="#">목록</a></span>
						</span>
					</div>

					<table class="bbsWrite mgb35">
						<caption></caption>
						<colgroup>
							<col width="95" />
							<col width="395" />
							<col width="95" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th>업체명</th>
								<td><select style="width: 200px;">
										<option>선택하세요</option>
								</select></td>
								<th>상품명</th>
								<td><input type="text" name="" style="border:1px solid #ddd; height:20px;" class="inputText" size="30" />
									<span class="button"><a href="#">검색</a></span></td>
							</tr>
						</tbody>
					</table>

					<div class="clfix">
						<div class="tbWrapLt">
							<table class="bbsList">
								<colgroup>
									<col width="30" />
									<col width="100" />
									<col width="100" />
									<col width="100" />
									<col width="100" />
								</colgroup>
								<thead>								
								
									<tr>
										<th scope="col">NO.</th>
										<th scope="col">이미지</th>
<!-- 										<th scope="col">카테고리</th>
										<th scope="col">원산지</th> -->
										<th scope="col">제품명</th>
										<th scope="col">가격</th>
										<th scope="col">-</th>
										
									</tr>
								</thead>

								<tbody>
									 <c:forEach var="i" items="${adminList}" varStatus="cnt">
										<tr>
											<td>${cnt.count}</td>
											<td><img src="/web/cartUp/${i.fileName}" width="50" height="50"></img></td>
<%-- 											<td>${i.productCategory}</td>
											<td>${i.productOrigin}</td> --%>
											<td><a href="productInfo.do?pk=${i.pk}">${i.productName}</a></td>	
											<td>${i.productPrice}</td>
											<td>
												<span class="buttonFuc"><a href="#" id="${i.pk}">수정</a></span>
												<span class="buttonFuc"><a href="#">삭제</a></span>
										</td>									
										</tr>
									 </c:forEach>
								
<!-- 								 
									<tr>
										<td></td>
										<td><img src="/web/cartUp/" width="50" height="50"/></td>
										<td> </td>
										<td> </td>										
										<td>
										<span class="buttonFuc"><a href="#">수정</a></span><span
											class="buttonFuc"><a href="#">삭제</a></span>
										</td>
									</tr>	
												 -->		

								</tbody>
							</table>
						</div>

						<div class="tbWrapRt">
							<ul class="tabA clfix mgb15">
								<li class="over"><a href="#info1">01. 상품등록</a></li>
							</ul>
 		              	<form action="productInsert.do" name="frm" method="post" enctype="multipart/form-data">
							<div id="info1" class="tbWrapCnt" style="display: block;">
								<table class="bbsWrite mgb10">
									<caption></caption>
									<colgroup>
										<col width="95" />
										<col />
									</colgroup>
									<tbody>
										<tr>
											<th>상품명</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="productName" id="productName" class="inputText"
												size="50" /></td>
										</tr>
										<tr>
											<th>원산지</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="productOrigin" id="productOrigin" class="inputText"
												size="50" />
												<input  type="hidden" id="job" name="job" value="new"/>
											</td>
												
										</tr>
										<tr>
											<th>상품가격</th>
											<td><input type="text" style="border:1px solid #ddd; height:20px;" name="productPrice" id="productPrice" class="inputText"
												size="50" />
												<input type="hidden" name="id"  value="${id}"/>
												<!-- <input type="hidden" name="pk" id="pk"/> -->
												</td>
										</tr>
										<tr>
											<th>카테고리</th>
											<td>
											<select style="width: 200px;" name="productCategory" id="productCategory">
												<option selected="selected">선택하세요</option>
												<option value="cloth">의류/잡화</option>
												<option value="electronic">전자제품</option>
												<option value="furniture">가구</option>
												<option value="cosmetic">화장품/향수</option>
												<option value="foods">식품/주류</option>
												<option value="car">차량용품</option>													
											</select>
											</td>
										</tr>
										<tr>
											<th>상품이미지1</th>
											<td class="alignM"><input type="file" name="file"
												class="inputText" size="10" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							</form>
						</div>

						<p class="agr">
							<span class="button"><a href="#" id="save">저장</a></span>
							<!-- <span class="button"><a href="#" id="modify">수정</a></span> -->
							<span class="button"><a href="#" id="chart">차트</a></span>
							<div id="piechart" style="width: 900px; height: 500px;"></div>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	
  <!--Footer-->
      <jsp:include page="/include/footer.jsp"></jsp:include>
   <!--END Footer-->	
   	</div>
	
</body>
</html>