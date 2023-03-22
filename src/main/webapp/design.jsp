<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<t:pagetemplate>
    <jsp:attribute name="header">
            Design Selv
    </jsp:attribute>

    <jsp:attribute name="footer">
            Design Selv
    </jsp:attribute>

    <jsp:body>
        <h3>Design din helt egen Olsker Cupcake her!</h3>

        <label for="bund">Vælg en bund:</label>
        <select name="bund" id="bund">
            <option name="Chokolade" value="Chokolade">Chokolade +5kr.</option>
            <option name="Vanilje" value="Vanilje">Vanilje +5kr.</option>
            <option name="Muskatnød" value="Muskatnød">Muskatnød +5kr.</option>
            <option name="Pistacie" value="Pistacie">Pistacie +6kr.</option>
            <option name="Mandel" value="Mandel">Mandel +7kr.</option>
        </select>

        <label for="top">Vælg en top:</label>
        <select name="top" id="top">
            <option name="Chokolade" value="Chokolade">Chokolade +5kr.</option>
            <option name="Blåbær" value="Blåbær">Blåbær +5kr.</option>
            <option name="Hindbær" value="Hindbær">Hindbær +5kr.</option>
            <option name="Knas" value="Knas">Knas +6kr.</option>
            <option name="Jordbær" value="Jordbær">Jordbær +6kr.</option>
            <option name="Rom/Rosin" value="Rom/Rosin">Rom/Rom/Rosin +7kr.</option>
            <option name="Appelsin" value="Appelsin">Appelsin +8kr.</option>
            <option name="Citron" value="Citron">Citron +8kr.</option>
            <option name="Blåskimmelost" value="Blåskimmelost">Blåskimmelost +9kr.</option>
        </select>
    </jsp:body>
</t:pagetemplate>