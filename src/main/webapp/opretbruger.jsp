<%--
  Created by IntelliJ IDEA.
  User: daniel
  Date: 22/03/2023
  Time: 10.31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
${requestScope.msg}
<form action="opretbruger" method="post">
    <label for="mail">mail: </label>
    <input type="text" id="mail" name="mail" placeholder="123@gmail.com"/>
    <label for="kodeord">kodeord: </label>
    <input type="password" id="kodeord" name="kodeord" placeholder="kodeord"/>
    <label for="gentagkodeord">gentag kodeord: </label>
    <input type="password" id="gentagkodeord" name="gentagkodeord" placeholder="gentag kodeord"/>
    <input type="submit"  value="opret bruger"/>
</form>
</body>
</html>
