<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<style><%@include file="/css/style.css"%></style>

<t:pagetemplate>
    <jsp:attribute name="header">
         Velkommen til Olsker Cupcakes!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Logget ind
    </jsp:attribute>

    <jsp:body>

        <p>Du er nu logget ind</p>

        <c:if test="${sessionScope.user != null}">
            <p>Du er logget ind med rollen: "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>Du er ikke logget ind endnu. Du kan gøre det her: <a
                    href="../login.jsp">Login</a></p>
        </c:if>
    </jsp:body>

</t:pagetemplate>