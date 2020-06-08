<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />
<script src="/DosiAir/js/bbs.js" charset = "UTF-8"></script>
<script src="/DosiAir/js/jquery-2.1.4.min.js" charset = "UTF-8"></script>

<script type="text/javascript" src="/kr/script/jquery-2.1.4.min.js"></script>
<c:set var="no" value="${param.no}"></c:set>
<c:set var="job" value="${param.job}"></c:set>
<script type="text/javascript">
 function load(){
	 //alert(no);
 }
 $(function(){
	 if("${job}"=='modify'){
		 $.ajax({
			 
			 type:'GET',
			 dataType:'json',
			 url:'infoCheck.do?no='+"${no}",
			 success:function(data){
				 //alert(data.title+' '+data.name+' '+data.contents+' '+data.no);
				 $("#writer").val(data.name);
				 $("#title").val(data.title);
				 $("#contents").val(data.contents);
				 $("#no").val(data.no);
				 $("#form").attr("action","modifyFree.do");
				 $("input[type=submit]").val('MODIFY');
				 $("input[value='수정']").hide();
			 }
		 });
	 }
 });
</script>

</head>
<body style="background:url('/DosiAir/img/airplane4.jpg') top no-repeat;" onload="load('${param.job}')" >

<!--Wrap-->
 <div id="wrap">
	<!--Header-->
		<jsp:include page="../include/topGnb.jsp"></jsp:include>
	<!--END Header-->

	<!--Container-->
	<div id="sub_container">
		<div class="sub_con3">
			<div class="board_form">	
				<div class="con_title">
					<p>문의게시판</p>	
				</div>
				<form action="boardInsert.do" method="post" enctype="multipart/form-data">
				<div class="board_form02">
					<div class="board_form03">
	                   <div class="board_l" style="background:url('../img/board02.jpg') top no-repeat; border:1px solid #ddd;">
                           
                       </div>
	                    <div class="board_r">
						   <ul class="board_title">
	                       		<li>작성자</li>
	                       		<li>	                       			
	                       			<input type="text" name="writer" id="writer" > 
	                       			<input type="hidden" name="id"  value="${id}">
	                       			<input type="hidden" name="no" id="no">                       			
	                       		</li>
	                       </ul>
	                       <ul class="board_title">
	                       		<li>제목</li>
	                       		<li><input type="text" name="title" id="title" value=''></li>
	                       </ul>
	                       	                       
	                     <!--   <ul class="board_pass">
	                       		<li>비밀번호</li>
	                       		<li><input type="text"></li>
	                       </ul> -->
		                   <ul class="board_contents">
	                       		<li style="margin-bottom:7px; ">내용</li>
	                       		<li><textarea rows="11" cols="60" name="contents" id="contents" style="border:1px solid #bbb;"></textarea></li>
	                       </ul>
	                       <ol style="position: absolute;left: 200px;">
	                       		<li>이미지</li>
	                       		<li><input type="file" name="file" align="middle"></li>
	                       </ol>	                       
	                       
	                       <ul class="board_writer">
	                       		<li id="writer">
	                       		<input type="submit" class="board_button01"  value="작성">
	                       		<input type="button" class="board_button01" onclick="location.href='board.jsp'" id="" name="" value="수정">
	                       		<input type="button" class="board_button02" onclick="location.href='board.jsp'" value="취소">
	                       		</li>
	                       </ul>
		                   
	                    </div>
                    </div>
                    
				</div>
				</form>
				<div>
				</div>
			</div>
		</div>	
	<!--END Container-->
	</div>
		
	<!--Footer-->
		<jsp:include page="../include/footer.jsp"></jsp:include>
	<!--END Footer-->
 </div><!--END Wrap-->
 	
</body>
</html>