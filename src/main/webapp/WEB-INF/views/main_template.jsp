<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Toster</title>
      <link href="<s:url value="/resources" />/css/home.css"
            rel="stylesheet"
            type="text/css" />
      <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
      <link href="<c:url value="/resources/css/jumbotron-narrow.css" />" rel="stylesheet">
      <script type="text/javascript" src="/resources/js/jquery-1.8.3.min.js"></script>
      <script type="text/javascript" src="/resources/js/script.js"></script>
  </head>

  <body>
    <div id="container">
      <div id="top">
        <t:insertAttribute name="top" />
      </div>

      <div id="main">
        <t:insertAttribute name="content" />
      </div>
    </div>
  </body>
</html>
