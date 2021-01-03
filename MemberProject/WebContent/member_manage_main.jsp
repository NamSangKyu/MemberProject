<%@page import="service.MemberService"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<style>
.container{
	width:1200px;
	margin:0px auto;
	padding-top:30px;
	box-sizing: border-box;
}
#menu_bar{
	width:1200px;
	box-sizing: border-box;
	text-align: center;
}
#menu_bar > select{
	width:150px;
	padding:5px;
	margin-right:5px;
}
#menu_bar > input{
	width:200px;
	padding:5px;
	margin-right:5px;
}
#menu_bar > button{
	width:100px;
	padding:5px;
}
#title{
	font-size:0px;
}
#title > li {
	width: 230px;
	font-size:16px;
	display: inline-block;
	text-align: center;
	font-weight: bold;
	padding:10px;
	box-sizing: border-box;
}

</style>
</head>
<body>
	<%
		if(session.getAttribute("login") == null || !session.getAttribute("grade").equals("master")){
			%>
				<script>
					location.href="main.jsp";
				</script>
			<%
		}
	
		//전체 회원 목록 읽어옴
		ArrayList<MemberVO> list = MemberService.getInstance().selectAllMemberVO();
	%>
	<jsp:include page="template/header.jsp"></jsp:include>
	
	<div class="container">
		<div id="menu_bar">
			<select name="kind">
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="grade">등급</option>
			</select>
			<input type="text" name="search">
			<button id="btn_submit">검색</button>
		</div>
		<hr>
		<div id="content">
			<ul id="title">
				<li>아이디</li>
				<li>이름</li>
				<li>나이</li>
				<li>등급</li>
				<li>비고</li>
			</ul>
			<hr>
			<div id="content_area">
				<%
					for(int i=0;i<list.size();i++){
						%>
						<p> 
							<span><%=list.get(i).getId() %></span>
							<span><%=list.get(i).getName() %></span>
							<span><%=list.get(i).getAge() %></span>
							<span><%=list.get(i).getGrade() %></span>
							<span>
								<a href="#">수정</a> / <a href="#">삭제</a>  
							</span>
						</p>
						<%
					}
				
				%>
			</div>
		</div>
		
	</div>
			
	<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>







