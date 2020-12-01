<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>お金使用記録簿</title>
        <link rel="stylesheet" href="<c:url value='/css/reset.css' />">
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="header_menu">
                    <h1><a href="<c:url value='/' />">お金使用記録簿</a></h1>&nbsp;&nbsp;&nbsp;
                    <c:if test="${sessionScope.login_member != null}">
                        <c:if test="${sessionScope.login_member.admin_flag == 1}">
                            <a href="<c:url value='/members/index' />">メンバー管理</a>&nbsp;
                        </c:if>
                        <a href="<c:url value='/reports/index' />">お金使用記録管理</a>&nbsp;
                    </c:if>
                </div>
                <c:if test="${sessionScope.login_member != null}">
                    <div id="member_name">
                        <c:out value="${sessionScope.login_member.name}" />&nbsp;さん&nbsp;&nbsp;&nbsp;
                        <a href="<c:url value='/logout' />">ログアウト</a>
                    </div>
                </c:if>
            </div>
            <div id="content">
                ${param.content}
            </div>
            <div id="footer">
                by Kohei Iwashita.
            </div>
        </div>
    </body>
</html>