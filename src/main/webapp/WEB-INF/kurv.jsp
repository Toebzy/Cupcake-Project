<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:pagetemplate>
    <jsp:attribute name="header">
            Kurv
    </jsp:attribute>

    <jsp:attribute name="footer">
            Kurv
    </jsp:attribute>

    <jsp:body>
        <c:if test="${sessionScope.user != null}">
            <p>You are logged in with the role of "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>You are not logged in yet. You can do it here: <a
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
    <table style="display: inline-block; border: 1px solid; float: left; ">
        <c:forEach var="emne" items="${requestScope.top}" varStatus="varStatus">
        <tr>
            <td>${emne}</td>
        </tr>
            </c:forEach>
    </table>

    <table style="display: inline-block; border: 1px solid; margin-left: 20px">
        <c:forEach var="emne" items="${requestScope.bund}" varStatus="varStatus">
            <tr>
                <td>${emne}</td>
            </tr>
        </c:forEach>
    </table>
    <table style="display: inline-block; border: 1px solid;  margin-left: 20px">
        <c:forEach var="emne" items="${requestScope.pris}" varStatus="varStatus">
            <tr>
                <td>${emne}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<form action="betal" method="post">
din saldo: ${requestScope.saldo} <br>
total: ${requestScope.totalpris}
    <button>Betal</button>
    <input type="hidden" name="totalpris" value="${requestScope.totalpris}">
    <button>betal</button>
</form>
</body>
</html>
    </jsp:body>
</t:pagetemplate>