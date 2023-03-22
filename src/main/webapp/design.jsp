<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 22/03/2023
  Time: 10.31
  To change this template use File | Settings | File Templates.
--%>
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
            <option value="Chokolade">Chokolade +5kr.</option>
            <option value="Vanilje">Vanilje +5kr.</option>
            <option value="Muskatnød">Muskatnød +5kr.</option>
            <option value="Pistacie">Pistacie 6kr.</option>
            <option value="Mandel">Mandel 7kr.</option>
        </select>

        <label for="top">Vælg en top:</label>
        <select name="top" id="top">
            <option value="Chokolade">Chokolade +5kr.</option>
            <option value="Blåbær">Blåbær +5kr.</option>
            <option value="Hindbær">Hindbær +5kr.</option>
            <option value="Knas">Knas +6kr.</option>
            <option value="Jordbær">Jordbær +6kr.</option>
            <option value="Rom/Rosin">Rom/Rom/Rosin +7kr.</option>
            <option value="Appelsin">Appelsin +8kr.</option>
            <option value="Citron">Citron +8kr.</option>
            <option value="Blåskimmelost">Blåskimmelost +9kr.</option>
        </select>
    </jsp:body>
</t:pagetemplate>