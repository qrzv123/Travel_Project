<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>  
<link href="<%= request.getContextPath() %>/resources/css/login.css" rel="stylesheet">
<div class="all">
<%@ include file="/WEB-INF/travel/common/layout/mem/memberList.jsp" %>  
<div class="contents">
<table border="1">
	<tr>
		<th>숙소명</th>
		<th>객실명</th>
		<th>날짜</th>
		<th>가격</th>
		<th>결제일</th>
		<th>예약상태</th>
		<th>리뷰쓰기</th>
	</tr>
	<c:forEach items="${lists }" var="list">
		<tr>
			<td>${list.aname }</td>
			<td>${list.rname }</td>
			<td>${list.startDate } ~ ${list.endDate }</td>
			<td><fmt:formatNumber value="${list.price }"/>원</td>
			<td>
				<fmt:parseDate var="paredDate" value="${list.oDate }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate value="${paredDate }" var="formatedDate" pattern="yyyy.MM.dd"/>			
				${formatedDate }
			</td>
			<td>예약상태</td>
			<td>
				<form action="${contextPath}/shop/detail.shop" method="post">
					<input type="hidden" name="onum" value="${list.onum }"/>
					<input type="hidden" name="anum" value="${list.anum }"/>
					<input type="submit" value="리뷰쓰기" style="width: 70px;"/>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>