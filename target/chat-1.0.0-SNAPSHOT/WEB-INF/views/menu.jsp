<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" id="header">
    <br />
    <c:choose>
        <c:when test="${page == 'home'}">

            <c:if test="${authenticated == true}">
                <ul class="list-group" id="tools">
                    <li class="list-group-item list-group-item-success">
                        <a href="/home">Home</a>&nbsp;&nbsp;
                        <a href="/profile/edit/${user.id}">View Profile</a>&nbsp;&nbsp;
                        <a href="<c:url value="j_spring_security_logout" />" >Logout</a>&nbsp;&nbsp;
                        <a href="/about">About</a>
                    </li>
                </ul>
                <div id="title">
                    <h2>You're logged in as ${user.firstName}</h2>
                    <small id="userEmail">${user.email}</small>
                </div>
                <br />
            </c:if>
        </c:when>

        <c:when test="${page == 'register'}">
            <ul class="list-group" id="tools">
                <li class="list-group-item list-group-item-success">
                    <a href="/home">Home</a>&nbsp;&nbsp;
                    <a href="/login">Login</a>&nbsp&nbsp;
                    <a href="/register">Register</a>&nbsp;&nbsp;
                    <a href="/about">About</a>&nbsp;&nbsp;
                </li>
            </ul>
            <br />
        </c:when>

        <c:when test="${page == 'profile'}">
            <ul id="tools"  class="list-group">
                <li class="list-group-item" >
                    <a href="/home">Home</a>&nbsp;&nbsp;
                    <a href="/profile/edit/${user.id}">View Profile</a>&nbsp;&nbsp;
                    <a href="<c:url value="j_spring_security_logout" />" >Logout</a>&nbsp;&nbsp;
                    <a href="/about">About</a>
                </li>
            </ul>
            <br />
        </c:when>


        <c:otherwise>
            <ul class="list-group" id="tools">
                <li class="list-group-item list-group-item-success">
                    <a href="/home">Home</a>&nbsp;&nbsp;
                    <a href="/login">Login</a>&nbsp;&nbsp;
                    <a href="/register">Register</a>&nbsp;&nbsp;
                    <a href="/about">About</a>
                </li>
            </ul>
            <c:if test="${authenticated == true}">
                <div id="title"><h2>You're logged in as ${user.firstName}</h2></div>
            </c:if>
            <c:if test="${authenticated == false}">
                <div id="title"><h2>You're not logged in. Please <a href="/login">login</a> or <a href="/register">register</a></h2></div>
            </c:if>
        </c:otherwise>
    </c:choose>

</div>