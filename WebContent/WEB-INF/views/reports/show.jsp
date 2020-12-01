<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${report != null}">
                <h2>お金使用記録　詳細ページ</h2>

                <table>
                    <tbody>
                        <tr>
                            <th>氏名</th>
                            <td><c:out value="${report.member.name}" /></td>
                        </tr>
                        <tr>
                            <th>日付</th>
                            <td><fmt:formatDate value="${report.report_date}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                        <tr>
                            <th>区分</th>
                            <td>
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
                        </tr>
                        <tr>
                            <th>購入品名・支払名</th>
                            <td>
                                <c:out value="${report.title}" />
                            </td>
                        </tr>
                        <tr>
                            <th>金額・内容</th>
                            <td>
                                <c:out value="${report.content}" />
                            </td>
                        </tr>
                        <tr>
                            <th>登録日時</th>
                            <td>
                                <fmt:formatDate value="${report.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                        <tr>
                            <th>更新日時</th>
                            <td>
                                <fmt:formatDate value="${report.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <c:if test="${sessionScope.login_member.id == report.member.id}">
                    <p><a href="<c:url value="/reports/edit?id=${report.id}" />">この記録を編集する</a></p>
                </c:if>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose>

        <p><a href="<c:url value="/reports/index" />">一覧に戻る</a></p>
    </c:param>
</c:import>