<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@include file="/WEB-INF/views/include/bootstrap/header.jsp"%>


<style>
	
	.registerBtn{
		float:right;
	}
	
	ul.actions li {
		padding : 0 0 0 0;
	}
</style>

				<!-- Banner -->
				<section id="banner">
				<div class="content">
					<header>
					<h1>
						RC 하우스<br /> by HTML5 UP
					</h1>
					<p>A free and fully responsive site</p>
					</header>
					<p> 소 개 글 </p>
					<ul class="actions">
						<li><a target="_blank" href="http://rc.korea.ac.kr" class="button big">Learn
								More</a></li>
					</ul>
				</div>
				<span class="image object"> <img
					src="/resources/images/pic10.jpg" alt="" />
				</span> </section>

				<hr class="major" />
				<h2>게시판</h2>
				<ul class="actions">
					<li>
						<select>
						  <option value="volvo">Volvo</option>
						  <option value="saab">Saab</option>
						  <option value="mercedes">Mercedes</option>
						  <option value="audi">Audi</option>
						</select>
				</li>
				<li class="pr">		
					<input type="text" name="keyword" id="query" placeholder="Search" />				
				</li>
				<li class="pl">		
					<span class="button special icon fa-search"></span>				
				</li>
					<li class='registerBtn'><a href="/board/register" class="button special">글 등록</a></li>
				</ul>
				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.bno}</td>
									<td>
									<a href='view?bno=${item.bno}&page=${cri.page}'>${item.title}</a>
									<c:if test="${item.isimg == 'y' }">
										<span class='icon fa-image'></span>
									</c:if>
									<c:if test="${item.isfile == 'y' }">
									<span class='icon fa-file'></span>
									</c:if>
									<span> ( ${item.replycnt} ) </span>
									 </td>
									<td>${item.writer}</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<center>
					<ul class="pagination">
						
						
					</ul>
				</center>

<%@include file="/WEB-INF/views/include/bootstrap/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"
		integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
		crossorigin="anonymous"></script>

	<script src="/resources/js/pagefunc.js"></script>
	<script>
		var msg = '${result}';
		if (msg === 'success') {
			alert("작업처리 완료");
		}else if(msg === 'delsuccess'){
			alert("삭제 되었습니다.");
		}

		$(".pagination").on("click", "li", function(e){
			e.preventDefault();
			var pageNum = $(this).attr('data-page');
			if($(this).attr('data-page') !== 'none') {
				self.location="/board/list?page="+pageNum;
			}
		});
		
		var pageStr = makePage({
			total:${cri.total},
	        current:${cri.page},
	        pageSize:10
	    });
		
		$(".pagination").html(pageStr);
		
	</script>