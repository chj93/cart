<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<!--  관리자페이지 구현 X  -->

<title>관리자</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<meta http-equiv="imagetoolbar" content="no" />
<!-- <link href="../css/contents.css" rel="stylesheet" type="text/css" /> -->
<link href="/web/css/default.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="../js/design.js">

</script>
<script src="/web/script/jquery-2.1.4.min.js"></script>
<script >
$(document).ready(function(){
	 $("#search").click(function(){		 
		 $("form").submit();		 
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
		               <p>상품 등록/보기/수정</p>   
		            </div>
	
				<div class="contents">
					<div class="btnSet clfix mgb15">
						<span class="fr"> <span class="button"><a href="#">목록</a></span>
						</span>
					</div>
                   <form action="clientList.do" method="post">
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
								<th>검색어</th>
<!-- 								<td><select style="width: 200px;">
										<option>선택하세요</option>
								</select></td> -->
								<th>
								<select id="query" name="query">
								  <option selected="selected">선택하세요</option>
								  <option value="productName">상품명</option>
								  <option value="productOrigin">원산지</option>
								  <option value="productCategory">카테고리</option>
								</select>
								</th>
								<td style="width:700px;">
									<input type="text" name="data" style="border:1px solid #ddd; height:20px; width:70%;" class="inputText" size="30" />
									<span class="button"><a href="#" id="search">검색</a></span>
									<span class="button"><a href="clientList.do" id="search">새로고침</a></span>
									
								</td>
							</tr>
						</tbody>
					</table>
					</form>
							<table class="bbsList">
								<colgroup>
									<col width="80" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
									<col width="170" />
								</colgroup>
								<thead>								
								
									<tr>
										<th scope="col">NO.</th>																				
										<th scope="col">상품명</th>
										<th scope="col">이미지</th>
										<th scope="col">원산지</th>
										<th scope="col">가격</th>
										<th scope="col">종류</th>
										<th scope="col">날짜</th>
										<th scope="col">판매자</th>									
										
									</tr>
								</thead>

								<tbody>
							      <c:forEach var="i" items="${productList}" varStatus="cnt">
									<tr>
										<td>${cnt.count}</td>
										<td>
										<a href="productInfo.do?pk=${i.pk}">
										${i.productName}
										</a>
										</td>
										<td><img src="/web/cartUp/${i.fileName}" width="50" height="50"></img></td>
										<td>${i.productOrigin }</td>
										<td>${i.productPrice }</td>
										<td>${i.productCategory }</td>
										<td>${i.regdate }</td>
										<td>${i.id}(${i.seller})</td>		
									</tr>
									</c:forEach>
								</tbody>
							</table>
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