<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style><%@include file="/css/style.css"%></style>

<%@page errorPage="error.jsp" isErrorPage="false" %>

<t:pagetemplate>
    <jsp:attribute name="header">
         Velkommen til Olsker Cupcakes!
    </jsp:attribute>

    <jsp:attribute name="footer">
        Olsker Cupcakes
    </jsp:attribute>

    <jsp:body>
        <c:if test="${sessionScope.user != null}">
            <p>Du er logget ind med rollen: "${sessionScope.user.role}".</p>
        </c:if>

        <c:if test="${sessionScope.user == null}">
            <p>Du er ikke logget ind endnu. Du kan gøre det her: <a
                    href="login.jsp">Login</a></p>
        </c:if>

        <section class="section-products">
            <div class="container">
                <div class="row justify-content-center text-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="header">
                            <h2>Popular Products</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Single Product -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-1" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Chokolade</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-2" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Citron</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-3" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Jordbær</h3>
                                <h4 class="product-des">samme farve som tobias hår</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-4" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Here Product Title</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
            </div>
        </section>
    </jsp:body>

</t:pagetemplate>