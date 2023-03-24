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
                            <th style="width:70%">Ordre Id</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.idordre}" varStatus="varStatus">
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
                            <th style="width:70%">Top</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.topping}" varStatus="varStatus">
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
                            <th style="width:70%">Bund</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.bottom}" varStatus="varStatus">
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
                            <th style="width:70%">Pris</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.cupcakepris}" varStatus="varStatus">
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
                            <th style="width:70%">Ordernummer</th>
                        </tr>
                        </thead>

                        <c:forEach var="emne" items="${requestScope.ordrenummer}" varStatus="varStatus">
                            <tr style="height:50px">
                                    <td>${emne}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </jsp:body>

</t:pagetemplate>
