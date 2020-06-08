<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/default.css" />
<script type="text/javascript" src="/kr/script/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("input[value='수정']").click(function() {
			//location.href='info.do?job=modify&no='+this.id;
			location.href='writer.jsp?job=modify&no='+this.id;

		});
	});
</script>

</head>
<body
	style="background: url('/DosiAir/img/airplane4.jpg') top no-repeat;">
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
					<div class="board_form04">
						<div class="board_form05">
							<form action="" name="modiFrm" method="get">
								<div class="board_top">
									<ul class="board_t">
										<li><strong>제목 ${info.title}</strong></li>
										<li>|</li>
										<li>작성자 ${info.writer }</li>
									</ul>
									<ul class="board_date">
										<li>${info.regdate}</li>
									</ul>
								</div>

								<div class="board_b">
									<ul>
										<li><strong>${info.contents}</strong></li>
										<li></li>
									</ul>
								</div>
								<div class="board_text">
									<ul>
										<li style="min-height: 200px;">
											<div>
											<a href="download.do?fileName=${info.fileName}">
												<img src="/kr/upload/${info.fileName}" width="200" height="300">											</div>
                                            </a>
										</li>
									</ul>
								</div>

								<div class="board_bottom">
									<div class="board_letter">
										<div class="letter_top">
											<ul>
												<li class="letter_f"><strong>작성자</strong></li>
												<li><span>|</span></li>
												<li class="letter_f02">
												<img alt="" src="../img/re.jpg" style="width: 10px; height: 10px;">&nbsp;답글</li>
												<li class="letter_cl">내용이들어갑니다.</li>
											</ul>

											<!-- 내가 작성한 부분만 수정 삭제 가능 -->
											<ul class="letter_r">
												<li><span>수정 </span></li>
												<li><span>|</span></li>
												<li><span>삭제</span></li>
											</ul>
										</div>
										<div class="letter_bottom">
											<ul>
												<li></li>
											</ul>
										</div>
									</div>

									<div class="board_writer02">
										<ul>
											<li><textarea rows="" cols=""></textarea>&nbsp;
											<input type="button" value="등록" onclick="location.href='.jsp'" /></li>
										</ul>
									</div>


									<div class="board_writer03" style="display: none;">
										<ul>
											<li><textarea rows="" cols=""></textarea>&nbsp;&nbsp;
											<input type="button" value="등록" onclick="location.href='.jsp'" /></li>
										</ul>
									</div>
								</div>
								<div class="board_button_bt">
									<ul>
										<li><input type="button" value="글쓰기"onclick="location.href='writer.jsp'" />&nbsp;&nbsp; 
										    <input type="button" id="${info.no}" value="수정" />&nbsp;&nbsp; 
											<input type="button" value="삭제" onclick="location.href='delete.do?no=${info.no}'" />&nbsp;&nbsp;
											<input type="button" value="목록" onclick="location.href='boardList.do'" /></li>
									</ul>
								</div>
							</form>
						</div>
					</div>
					<div></div>
				</div>
			</div>
			<!--END Container-->
		</div>

		<!--Footer-->
		<jsp:include page="../include/footer.jsp"></jsp:include>
		<!--END Footer-->
	</div>
	<!--END Wrap-->

</body>
</html>