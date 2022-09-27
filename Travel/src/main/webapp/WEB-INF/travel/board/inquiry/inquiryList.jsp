<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
<%@include file="/WEB-INF/travel/common/layout/shop/header.jsp" %>
<link rel="stylesheet" href="${contextPath }/resources/css/board.css">

<div class="default">
<%@include file="/WEB-INF/travel/board/board1/boardList.jsp" %>
<div class="contents">
<h2>1:1 문의사항</h2>
<table>
	<c:set var="email" value='<%= String.valueOf(session.getAttribute("email")) %>'/>
<c:if test="${email ne 'null'}">
	<tr class="inquiry_title">
		<td align="center" width="12%">번호</td>
		<td align="center" width="45%">제목</td>
		<td align="center" width="10%">작성자</td>
		<td align="center" width="15%">작성일</td>
		<td align="center" width="18%">답변상황</td>
	</tr>
	<c:if test="${empty lists }">
		<tr>
			<td colspan="5">문의 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:if test="${!empty lists }">
		<c:forEach items="${lists }" var="inquiry" varStatus="status">
			<tr align="center">
				<td>${(pageInfo.totalCount-(pageInfo.pageNumber-1)*pageInfo.pageSize)-status.index }</td>
				<td align="left">
					<a href="inqdetail.brd?inum=${inquiry.inum }&pageNumber=${pageInfo.pageNumber}">
						<c:if test="${fn:length(inquiry.subject)>=30 }">
						${fn:substring(inquiry.subject,0,30)}...
						</c:if>
						<c:if test="${fn:length(inquiry.subject)<30 }">
						${inquiry.subject }
						</c:if>
					</a>
				</td>
				<td>${inquiry.email}</td>
				<td>
					<fmt:parseDate var="date" value="${inquiry.reg_date1 }" pattern="yyyy-MM-dd" />
					<fmt:formatDate var="reg_date" value="${date }" pattern="yyyy-MM-dd" /> ${reg_date }
				</td>
				<td>${inquiry.progress }</td>
			</tr>
		</c:forEach>
	</c:if>
	<c:if test="${email ne 'admin' and email ne 'null'}">
		<tr>
			<td align="right" colspan="5">
				<input type="button" value="문의하기" onclick="location.href='inqinsert.brd'">
			</td>
		</tr>
	</c:if>
</c:if>

<c:if test="${email eq 'null'}">
	<tr>
		<td align="center">로그인 한 이후에 1:1 문의사항을 확인하실 수 있습니다.</td>
	</tr>
</c:if>
</table>
${pageInfo.pagingHtml }
</div>
</div>
<%@ include file="/WEB-INF/travel/common/layout/footer.jsp" %>