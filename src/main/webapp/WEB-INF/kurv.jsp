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
<html>
<head>
    <title>Title</title>
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
total: ${requestScope.totalpris}
    <input type="hidden" name="totalpris" value="${requestScope.totalpris}">
    <button>betal</button>
</form>
</body>
</html>
    </jsp:body>
</t:pagetemplate>