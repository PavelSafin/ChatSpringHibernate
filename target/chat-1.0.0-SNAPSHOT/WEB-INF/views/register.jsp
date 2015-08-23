<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
    <div class="panel panel-info">
        <div class="panel-heading">
            <div class="panel-title">Sign Up</div>
            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="/login" >Sign In</a></div>
        </div>
        <div class="panel-body" >
            <sf:form id="signupform" class="form-horizontal" role="form" method="POST" modelAttribute="user">
                <sf:errors cssClass="error" />
                <div id="signupalert" style="display:none" class="alert alert-danger">
                    <p>Error:</p>
                    <span></span>
                </div>

                <div class="form-group">
                    <sf:label path="email" class="col-md-3 control-label">Email</sf:label>
                    <div class="col-md-9">
                        <sf:input path="email" size="30" type="text" class="form-control" name="email" placeholder="Email Address"/>
                        <small id="email_msg"></small><br/>
                        <sf:errors path="email" cssClass="error" />
                    </div>
                </div>


                <div class="form-group">
                    <sf:label path="firstName" class="col-md-3 control-label">First Name</sf:label>
                    <div class="col-md-9">
                        <sf:input type="text" class="form-control" name="firstname" placeholder="First Name" path="firstName" size="15" maxlength="15" />
                        <small id="firstName_msg"></small><br/>
                        <sf:errors path="firstName" cssClass="error" />
                    </div>
                </div>


                <div class="form-group">
                    <sf:label path="lastName" class="col-md-3 control-label">Last Name</sf:label>
                    <div class="col-md-9">
                        <sf:input type="text" class="form-control" name="lastname" placeholder="Last Name" path="lastName" size="15" maxlength="15" />
                        <small id="lastName_msg"></small><br/>
                        <sf:errors path="lastName" cssClass="error" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <sf:label path="password" class="col-md-3 control-label">Password:</sf:label>
                    <div class="col-md-9">
                        <sf:password path="password" size="20"
                                     showPassword="true" class="form-control" name="passwd" placeholder="Password"/>
                        <small id="password_msg"></small><br/>
                        <sf:errors path="password" cssClass="error" />
                    </div>
                </div>


                <div class="form-group">
                    <!-- Button -->
                    <div class="col-md-offset-3 col-md-9">
                        <button id="btn-signup" name="commit" type="submit" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up</button>
                    </div>
                </div>
            </sf:form>
        </div>
    </div>
</div>


