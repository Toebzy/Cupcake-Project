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
        <c:if test="${sessionScope.user == null}">
            <section class="hreflinkfix">
            <p class="purple">Du er ikke logget ind endnu. Du kan gøre det her: <a class="btn"
                    href="login.jsp" >Login</a></p>
            </section>
        </c:if>

        <section class="section-products">
            <div class="container">
                <div class="row justify-content-center text-center">
                    <div class="col-md-8 col-lg-6">
                        <div class="header">
                            <h2>Populære Produkter</h2>
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
                                <h4 class="product-des">Nyd vores choko-bombe, perfekt balance mellem den dybe chokolade-smag og den søde cupcake</h4>
                                <form action="tilføjtilkurv" method="post">
                                    <input hidden value="1" name="top">
                                    <input hidden value="1" name="bund">
                                    <input hidden value="index" name="jsp">
                                    <button class="btn">Tilføj til kurv</button>
                                </form>
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
                                <h4 class="product-des">Nyd den syrlig-koncentrerede citronsmag, sammen med vores tunge bund, som neutraliserer syrligheden</h4>
                                <form action="tilføjtilkurv" method="post">
                                    <input hidden value="8" name="top">
                                    <input hidden value="2" name="bund">
                                    <input hidden value="index" name="jsp">
                                    <button class="btn">Tilføj til kurv</button>
                                </form>
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
                                <h4 class="product-des">Prøv vores cupcake med jordbær, som er frisk og sød - perfekt til den danske sommer</h4>
                                <form action="tilføjtilkurv" method="post">
                                    <input hidden value="5" name="top">
                                    <input hidden value="2" name="bund">
                                    <input hidden value="index" name="jsp">
                                    <button class="btn">Tilføj til kurv</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Single Product -->
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-4" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Blåbær</h3>
                                <h4 class="product-des">Vores blåbær cupcake, indeholder økologiske danske blåbær af højeste kvalitet</h4>
                                <form action="tilføjtilkurv" method="post">
                                    <input hidden value="8" name="top">
                                    <input hidden value="2" name="bund">
                                    <input hidden value="index" name="jsp">
                                    <button class="btn">Tilføj til kurv</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </jsp:body>
</t:pagetemplate>