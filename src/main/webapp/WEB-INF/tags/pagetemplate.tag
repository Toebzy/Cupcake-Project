<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>

<!DOCTYPE html>
<html lang="da">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><jsp:invoke fragment="header"/></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <!--Google fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
</head>
<body>
<header>
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <img src="images/logo.png" class="img-fluid img-responsive logo"/>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
                    <c:if test="${sessionScope.user.username != null}">
                        <a class="nav-item">${sessionScope.user.username}</a>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/sekurv">Kurv</a>
                    </c:if>
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/udvalg.jsp">Vores Udvalg</a>
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/design.jsp">Design Selv</a>
                    <c:if test="${sessionScope.user == null }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/login.jsp">Login</a>
                    </c:if>
                <c:if test="${sessionScope.user.role == 1 }">
                    <a class="nav-item nav-link" href="${pageContext.request.contextPath}/adminpage">Admin</a>
                </c:if>
                    <c:if test="${sessionScope.user != null }">
                        <a class="nav-item nav-link" href="${pageContext.request.contextPath}/logout">Log ud</a>
                    </c:if>
            </div>
        </div>
    </nav>
</header>

<div id="body" class="container mt-4" style="min-height: 68.5%;">
    <h1><jsp:invoke fragment="header"/></h1>
    <jsp:doBody/>
</div>
<!-- Footer -->
<footer>
    <div class="container mt-3">
        <hr/>
        <div class="row mt-4">
            <div class="col">
                <br/>
                Åbningstider:<br/>
                Mandag-Fredag: 10-17:30<br/>
                Lørdag: 10-14:00<br/>
                Søndag: Lukket
            </div>
            <div class="col">
                <jsp:invoke fragment="footer"/><br/>
                <p>&copy; 2023 Olsker Cupcakes<br/>
                <br/> Mail: Olsker@cupcakes.dk<br/>
                Telefon: 36 15 45 00</p>
            </div>
            <div class="col">
                <br/>
                Rønnevej 54<br/>
                3770 Allinge<br/>
                <img class="SoMe" src="${pageContext.request.contextPath}/images/flogo.png" width="32px;" class="img-fluid"/>
                <img class="SoMe" src="${pageContext.request.contextPath}/images/ilogo.png" width="32px;" class="img-fluid"/>
            </div>
        </div>
    </div>
</footer>

</div>

<!-- Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>