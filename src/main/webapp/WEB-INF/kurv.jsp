<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style><%@include file="/css/style.css"%></style>
<t:pagetemplate>
    <jsp:attribute name="header">
            Kurv
    </jsp:attribute>

    <jsp:attribute name="footer">
            Kurv
    </jsp:attribute>

    <jsp:body>
        <c:if test="${sessionScope.user != null}">
            <p>Du er logget ind med rollen: "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>Du er ikke logget ind endnu. Du kan gøre det her: <a
                    href="../login.jsp">Login</a></p>
        </c:if>

<html>
<head>
    <title>Kurv</title>
</head>
<body>
<div>
    <table>
        <tr>
            <th>Top</th>
            <th>Bund</th>
            <th>Pris</th>
        </tr>

    </table>
    <table>
        <c:forEach var="emne" items="${requestScope.top}" varStatus="varStatus">
        <tr>
            <td>${emne}</td>
        </tr>
            </c:forEach>
    </table>

    <table>
        <c:forEach var="emne" items="${requestScope.bund}" varStatus="varStatus">
            <tr>
                <td>${emne}</td>
            </tr>
        </c:forEach>
    </table>
    <table>
        <c:forEach var="emne" items="${requestScope.pris}" varStatus="varStatus">
            <tr>
                <td>${emne} kr,-</td>
            </tr>
        </c:forEach>
    </table>
</div>
<form action="betal" method="post">
din saldo: ${requestScope.saldo} <br>
total: ${requestScope.totalpris} kr,-
    <input type="hidden" name="totalpris" value="${requestScope.totalpris}">
    <button class="btn">Betal</button>
    ${requestScope.msg}
</form>
</body>
</html>
    </jsp:body>
</t:pagetemplate>