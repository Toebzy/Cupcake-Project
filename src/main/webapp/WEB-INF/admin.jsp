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
            <table class="table" style="width:100%">
                <thead class="thead-dark">
                <tr>
                    <th style="width:70%">ID</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.idbruger}" varStatus="varStatus">
                    <tr style="height:50px ">
                     <td>${emne}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th style="width:70%">Email</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.mail}" varStatus="varStatus">
                    <tr style="height:50px">
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th style="width:70%">Kodeord</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.kodeord}" varStatus="varStatus">
                    <tr style="height:50px">
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th style="width:70%">Admin</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.admin}" varStatus="varStatus">
                    <tr style="height:50px">
                        <td>${emne}</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="col">
            <table class="table">
                <thead class="thead-dark">
                <tr>
                    <th style="width:70%">Saldo</th>
                </tr>
                </thead>

                <c:forEach var="emne" items="${requestScope.saldo}" varStatus="varStatus">
                    <form action="saldochange" method="post">
                        <tr style="height:50px">
                        <th> <input type="number" id="saldo" name="Saldo" min="0" value =${emne}></th>
                            <input hidden value ="${requestScope.idbruger}" name ="idbruger">
                            <input hidden value = "${varStatus.index}" name = "varStatus">
                        <th> <button class ="btn"> Opdater </button></th>
                        </tr>
                    </form>
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