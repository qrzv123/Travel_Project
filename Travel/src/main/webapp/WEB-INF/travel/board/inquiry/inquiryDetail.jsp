<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/travel/common/common.jsp"%>
inquiryDetail.jsp
<br>
<center>
<table border="1" height="800" width="800">
	<tr>
		<td align="center" width="10%">제목</td>
		<td align="center" width="90%" colspan="5">${ib.subject }</td>
	</tr>
	<tr>
		<td align="center" width="10%">작성자</td>
		<td align="center" width="10%">${ib.email }</td>
		<td align="center" width="20%">작성일</td>
		<td align="center" width="20%">
			<fmt:parseDate var="date1" value="${ib.reg_date1 }" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="reg_date1" value="${date1 }" pattern="yyyy-MM-dd" /> ${reg_date1 }
		</td>
		<td align="center" width="20%">답변일</td>
		<td align="center" width="20%">
			<fmt:parseDate var="date2" value="${ib.reg_date2 }" pattern="yyyy-MM-dd" />
			<fmt:formatDate var="reg_date2" value="${date2 }" pattern="yyyy-MM-dd" /> ${reg_date2 }
		</td>
	</tr>
	<tr height="300">
		<td align="center" width="10%">내용</td>
		<td align="center" width="90%" colspan="5">${ib.question }</td>
	</tr>
	<tr height="300">
		<td align="center" width="10%">답변</td>
		<td align="center" width="90%" colspan="5"><pre>${ib.answer }</pre></td>
	</tr>
	<tr>
		<td align="right" colspan="6">
			<c:set var="email1" value='<%= String.valueOf(session.getAttribute("email")) %>'/>
			<c:if test="${email1 eq 'admin' }">
				<input type="button" value="답변하기" onclick="location.href='inqanswer.brd?inum=${ib.inum }'">
			</c:if>
			<c:if test="${email1 eq 'admin' || email1 eq ib.email}">
				<input type="button" value="삭제" onclick="location.href='inqdelete.brd?inum=${ib.inum }'">
			</c:if>
			<input type="button" value="목록보기" onclick="location.href='inqlist.brd'">
		</td>
	</tr>
</table>
</center>