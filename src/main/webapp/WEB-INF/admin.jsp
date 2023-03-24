<%@ page import="java.util.ArrayList" %>
<%@ page import="dat.backend.model.entities.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<style><%@include file="/css/style.css"%></style>

<t:pagetemplate>
    <jsp:attribute name="header">
         Administrator Område
    </jsp:attribute>

    <jsp:attribute name="footer">
        Administrator
    </jsp:attribute>

    <jsp:body>

        <p>Auditering af brugere</p>
<div id ="tablesection" class="container">
    <div class="row">
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.idbruger}" varStatus="varStatus">
                <tr>
                     <td>${emne}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Email</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.mail}" varStatus="varStatus">
                    <tr>
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Kodeord</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.kodeord}" varStatus="varStatus">
                    <tr>
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Admin</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.admin}" varStatus="varStatus">
                    <tr>
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th>Saldo</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.saldo}" varStatus="varStatus">
                    <tr>
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

        <c:if test="${sessionScope.user.role == 1}">
            <p>Du er logget ind med rollen administrator</p>
        </c:if>

    </jsp:body>

</t:pagetemplate>