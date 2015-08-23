<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
    <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-info" >
            <div class="panel-heading">
                <div class="panel-title">Sign In</div>
            </div>

            <div style="padding-top:30px" class="panel-body" >

                <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                <c:if test="${loginfailed}">
                    <span class="loginFailed">
                        Your login attempt was not successful, try again.<br />
                        Caused: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                    </span>
                </c:if>
                <form action="<c:url value='j_spring_security_check' />"
                      method='POST' id="loginform" class="form-horizontal" role="form">

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input  id="username_or_email" name="j_username"  type="text" class="form-control" value="" placeholder="email">
                    </div>

                    <div style="margin-bottom: 25px" class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input id="password" name="j_password" type="password" class="form-control" placeholder="password">
                    </div>


                    <div style="margin-top:10px" class="form-group">
                        <!-- Button -->

                        <div class="col-sm-12 controls">
                            <input id="btn-login" type="submit" name="commit" class="btn btn-success" value="Login">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-12 control">
                            <div style="padding-top:15px; font-size:85%" >
                                Don't have an account!
                                <a href="/register">
                                    Sign Up Here
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>