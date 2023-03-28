<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page errorPage="../error.jsp" isErrorPage="false" %>
<style><%@include file="/css/style.css"%></style>

<t:pagetemplate>
    <jsp:attribute name="header">
         Ordreliste
    </jsp:attribute>

    <jsp:attribute name="footer">
        Ordreliste
    </jsp:attribute>

    <jsp:body>

        <div id ="tablesection" class="container">
            <div class="row">
                <div class="col">
                    <table class="table" style="width:100%">
                        <thead class="thead-dark">
                        <tr>
                            <th style="width:70%">Id Ordreliste</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.idordrerliste}" varStatus="varStatus">
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
                            <th style="width:70%">Id Bruger</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.idbruger}" varStatus="varStatus">
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
                            <th style="width:70%">Ordrestatus</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.ordrestatus}" varStatus="varStatus">
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
                            <th style="width:70%">Bruger mail</th>
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
                            <th style="width:70%">Adminstrer</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.idordrerliste}" varStatus="varStatus">
                            <tr style="height:50px">

                                <form action="seordre" method="post">
                                    <input hidden value="${emne}" name="ordrenummer">
                               <td> <button class="btn">Se ordre</button></td>
                                </form>
                                <form action="sletordreadmin" method="post">
                                    <input hidden name="index" value="${varStatus.index}">
                                    <input hidden name="idordrerliste" value="${requestScope.idordrerliste}">
                               <td> <button class="btn" style ="margin-left: -150px">Fjern </button></td>
                                </form>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>

</t:pagetemplate>
