<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@page errorPage="error.jsp" isErrorPage="false" %>
<style><%@include file="/css/style.css"%></style>

<t:pagetemplate>
    <jsp:attribute name="header">
             Login
    </jsp:attribute>

    <jsp:attribute name="footer">
            Login
    </jsp:attribute>

    <jsp:body>

        <h3>Du kan logge ind her</h3>

        <form action="login" method="post">
            <label for="username">Mail: </label>
            <input type="text" id="username" name="username"/>
            <label for="password">Kodeord: </label>
            <input type="password" id="password" name="password"/>
            <input type="submit" class="btn"  value="Log in"/>
        </form>
        <form action="opretbruger" method="get">
            <button class="btn">Opret ny bruger</button>
        </form>
    </jsp:body>
</t:pagetemplate>