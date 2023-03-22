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
             Opret Bruger
    </jsp:attribute>

    <jsp:attribute name="footer">
            Opret Bruger
    </jsp:attribute>

    <jsp:body>
${requestScope.msg}
<form action="opretbruger" method="post">
    <label for="mail">Mail: </label>
    <input type="text" id="mail" name="mail" placeholder="123@123.dk"/>
    <label for="kodeord">Kodeord: </label>
    <input type="password" id="kodeord" name="kodeord" placeholder="Kodeord"/>
    <label for="gentagkodeord">Gentag Kodeord: </label>
    <input type="password" id="gentagkodeord" name="gentagkodeord" placeholder="Kodeord"/>
    <input type="submit"  value="Opret Bruger"/>
</form>
    </jsp:body>
</t:pagetemplate>