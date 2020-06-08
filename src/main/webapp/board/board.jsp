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
<script type="text/javascript" src="/kr/script/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
 $(function(){
	 $("input#refresh").click(function(){
		location.href='boardList.do?page=1' 
		 
	 });
	$("input#searchBtn").click(function(){
		if($("select#query").val()=='empty'
				|| $("input#search").val().length==0){
			alert('Search Not Found!');
			return false;
		}else{
			$("form").submit();
		}
	});
 });
</script>


</head>
<%--  <c:if test="${id eq null }">
  <c:redirect url="/member/login.jsp"></c:redirect>
</c:if>  --%>


<body style="background:url('/DosiAir/img/airplane4.jpg') top no-repeat;" >

<!--Wrap-->
 <div id="wrap">
   <!--Header-->
      <jsp:include page="../include/topGnb.jsp"></jsp:include>

   <!--Container-->
   <div id="sub_container">
      <div class="sub_con3">
         <div class="board_form">   
            <div class="con_title">
               <p>자유게시판</p>   
            </div>
            <div class="board_form01">
            <form action="boardList.do" method="POST">
               <div class="board_search">
                  <ul>
                     <li>
                        <select  name="query" id="query">
                           <option selected="selected" value="empty">선택하세요</option>
                           <option value="writer">작성자</option>
                           <option value="title">제목</option>
                           <option value="content">내용</option>
                                                      
                        </select>
                     </li>
                     <li>
                        <input type="text" id="search" name="search">
                        <input type="button" value="검색" id="searchBtn">
                        <input type="button" value="새로고침" id="refresh">
                     </li>
                  </ul>
               </div>
               </form>
            <table cellpadding="0" cellspacing="0">
                  <thead>
                     <th width="100px">NO</th>
                     <th width="100px">IMG</th>
                     <th width="100px">TITLE</th>
                     <th width="200px">WRITER</th>
                     <th width="380px">HIT</th>
                     <th width="100px">REGDATE</th>                     
                  </thead>
                  <tbody>
                  
                     <tr>                        
                       <td>${cnt.count}</td>
                       <td>
                       <a href="#">
                       <img src='/kr/upload/' width="50" height="50">
                       </a>
                       </td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td></td>
                     </tr>
                  
                  </tbody>
               </table>               
               ${sb}
               <!-- paging 시작 -->               
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