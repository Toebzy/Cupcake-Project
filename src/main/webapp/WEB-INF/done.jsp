<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<style><%@include file="/css/style.css"%></style>
<t:pagetemplate>
    <jsp:attribute name="header">
             Din ordre er betalt og registreret!
    </jsp:attribute>

  <jsp:attribute name="footer">
            Betalt ordre
    </jsp:attribute>
    <jsp:body>

    <h1>Tak for din ordre!</h1>
    <br>
    <br>
    <br>
    <h4>Du kan hente din ordre i vores butik - håber du syntes den er mums filibaba!</h4>
    <br>
    <h4>Adresse samt åbningstider kan du finde i bunden af siden.</h4>

  </jsp:body>
</t:pagetemplate>