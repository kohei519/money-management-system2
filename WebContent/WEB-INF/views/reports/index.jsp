<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>お金使用記録　一覧</h2>
        <label for="date">日付指定</label><br />
        <form method="GET" action="<c:url value='/SortServlet?start_date=${start_date}&end_date=${end_date}&account=${account}' />">
        <input type="date" name="start_date" value="<fmt:formatDate value='${start_date}' pattern='yyyy-MM-dd' />" />～<input type="date" name="end_date" value="<fmt:formatDate value='${end_date}' pattern='yyyy-MM-dd' />" /><br />
        <label for="date">区分</label><br />
        <select name="account">
            <option value="7"<c:if test="${account == 7}"> selected</c:if>>全て</option>
            <option value="0"<c:if test="${account == 0}"> selected</c:if>>食料品</option>
            <option value="1"<c:if test="${account == 1}"> selected</c:if>>水道</option>
            <option value="2"<c:if test="${account == 2}"> selected</c:if>>電気</option>
            <option value="3"<c:if test="${account == 3}"> selected</c:if>>ガス</option>
            <option value="4"<c:if test="${account == 4}"> selected</c:if>>通信</option>
            <option value="5"<c:if test="${account == 5}"> selected</c:if>>公共交通</option>
            <option value="6"<c:if test="${account == 6}"> selected</c:if>>娯楽</option>
        </select>
        <button type="submit">設定</button>
        </form><br />
        <table id="report_list">
            <tbody>
                <tr>
                    <th class="report_name">氏名</th>
                    <th class="report_date">日付</th>
                    <th class="report_account">区分</th>
                    <th class="report_title">購入品名・支払名</th>
                    <th class="report_content">金額・内容</th>
                    <th class="report_action">操作</th>
                </tr>
                <c:forEach var="report" items="${reports}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="report_name"><c:out value="${report.member.name}" /></td>
                        <td class="report_date"><fmt:formatDate value='${report.report_date}' pattern='yyyy-MM-dd' /></td>
                        <td class="report_account">
                            <c:choose>
                                <c:when test="${report.account == 0}">
                                    <p>食料品</p>
                                </c:when>
                                <c:when test="${report.account == 1}">
                                    <p>水道</p>
                                </c:when>
                                <c:when test="${report.account == 2}">
                                    <p>電気</p>
                                </c:when>
                                <c:when test="${report.account == 3}">
                                    <p>ガス</p>
                                </c:when>
                                <c:when test="${report.account == 4}">
                                    <p>通信</p>
                                </c:when>
                                <c:when test="${report.account == 5}">
                                    <p>公共交通</p>
                                </c:when>
                                <c:otherwise>
                                    <p>娯楽</p>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td class="report_title">${report.title}</td>
                        <td class="report_content">${report.content}</td>
                        <td class="report_action"><a href="<c:url value='/reports/show?id=${report.id}' />">詳細を見る</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${reports_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((reports_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/reports/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/reports/new' />">新規記録の登録</a></p>

    </c:param>
</c:import>