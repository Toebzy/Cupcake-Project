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
            <option value="Chokolade +5kr.">Chokolade</option>
            <option value="Vanilje +5kr.">Vanilje</option>
            <option value="Muskatnød +5kr.">Muskatnød</option>
            <option value="Pistacie 6kr.">Pistacie</option>
            <option value="Mandel 7kr.">Mandel</option>
        </select>

        <label for="top">Vælg en top:</label>
        <select name="top" id="top">
            <option value="Chokolade +5kr.">Chokolade</option>
            <option value="Blåbær +5kr.">Blåbær</option>
            <option value="Hindbær +5kr.">Hindbær</option>
            <option value="Knas +6kr.">Knas</option>
            <option value="Jordbær +6kr.">Jordbær</option>
            <option value="Rom/Rosin +7kr.">Rom/Rosin</option>
            <option value="Appelsin +8kr.">Appelsin</option>
            <option value="Citron +8kr.">Citron</option>
            <option value="Blåskimmelost +9kr.">Blåskimmelost</option>
        </select>
    </jsp:body>
</t:pagetemplate>