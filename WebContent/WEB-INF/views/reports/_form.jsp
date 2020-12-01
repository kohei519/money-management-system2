<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>

    </div>
</c:if>
<label for="report_date">日付</label><br />
<input type="date" name="report_date" value="<fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' />" />
<br /><br />

<label for="name">氏名</label><br />
<c:out value="${sessionScope.login_member.name}" />
<br /><br />

<label for="account">区分</label><br />
<select name="account">
    <option value="0"<c:if test="${report.account == 0}"> selected</c:if>>食料品</option>
    <option value="1"<c:if test="${report.account == 1}"> selected</c:if>>水道</option>
    <option value="2"<c:if test="${report.account == 2}"> selected</c:if>>電気</option>
    <option value="3"<c:if test="${report.account == 3}"> selected</c:if>>ガス</option>
    <option value="4"<c:if test="${report.account == 4}"> selected</c:if>>通信</option>
    <option value="5"<c:if test="${report.account == 5}"> selected</c:if>>公共交通</option>
    <option value="6"<c:if test="${report.account == 6}"> selected</c:if>>娯楽</option>
</select>
<br /><br />

<label for="title">購入品名・支払名</label><br />
<input type="text" name="title" value="${report.title}" />
<br /><br />

<label for="content">金額・内容</label><br />
<input type="text" name="content" value="${report.content}" />
<br /><br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">投稿</button>