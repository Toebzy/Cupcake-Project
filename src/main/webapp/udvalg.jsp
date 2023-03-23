<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style><%@include file="/css/style.css"%></style>
<t:pagetemplate>
    <jsp:attribute name="header">
             Vores Udvalg
    </jsp:attribute>

    <jsp:attribute name="footer">
            Vores Udvalg
    </jsp:attribute>

    <jsp:body>
        <section class="section-products">
            <div class="container">
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
                                <h3 class="product-title">Lemon</h3>
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
                                <h3 class="product-title">Strawberry</h3>
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
                                <h3 class="product-title">Blueberry</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-5" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Rum Raisin</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-6" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Crispy Chokolade</h3>
                                <h4 class="product-des">Vi har tabt den på gulvet</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-7" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Orange</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-8" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Vanilje Hindbær</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-9" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Blue Cheese</h3>
                                <h4 class="product-des">seek mental help immediately</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-10" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Vanilje Mandel</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-11" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Chokolade Hindbær</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-3">
                        <div id="product-12" class="single-product">
                            <div class="part-1">
                            </div>
                            <div class="part-2">
                                <h3 class="product-title">Chokolade Jordbær</h3>
                                <h4 class="product-des">den smager af citron</h4>
                                <a href="#!" class="btn">KØB HER</a>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </jsp:body>
</t:pagetemplate>