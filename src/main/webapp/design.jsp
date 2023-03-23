<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style><%@include file="/css/style.css"%></style>
<t:pagetemplate>

    <jsp:attribute name="header">
            Design Selv
    </jsp:attribute>

    <jsp:attribute name="footer">
            Design Selv
    </jsp:attribute>

    <jsp:body>
        <h3>Design din helt egen Olsker Cupcake her!</h3>
        <form action="tilføjtilkurv" method="post">
            <label for="bund">Vælg en bund:</label>
            <select name="bund" id="bund">
                <option  value="1">Chokolade +5kr.</option>
                <option value="2">Vanilje +5kr.</option>
                <option value="3">Muskatnød +5kr.</option>
                <option  value="4">Pistacie +6kr.</option>
                <option  value="5">Mandel +7kr.</option>
            </select>

            <label for="top">Vælg en top:</label>
            <select name="top" id="top">
                <option  value="1">Chokolade +5kr.</option>
                <option  value="2">Blåbær +5kr.</option>
                <option  value="3">Hindbær +5kr.</option>
                <option  value="4">Knas +6kr.</option>
                <option  value="5">Jordbær +6kr.</option>
                <option  value="6">Rom/Rosin +7kr.</option>
                <option  value="7">Appelsin +8kr.</option>
                <option  value="8">Citron +8kr.</option>
                <option  value="9">Blåskimmelost +9kr.</option>
            </select>
            <button class="btn">Tilføj til kurv</button>
        </form>
    </jsp:body>
</t:pagetemplate>