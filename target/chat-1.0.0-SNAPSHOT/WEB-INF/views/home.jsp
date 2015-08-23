<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>




<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">

<div class="container">
    <%--<div class="row">--%>
    <%--<div class="col-lg-3">--%>
    <%--<div class="btn-panel btn-panel-conversation">--%>
    <%--<a href="" class="btn  col-lg-6 send-message-btn " role="button"><i class="fa fa-search"></i> Search</a>--%>
    <%--<a href="" class="btn  col-lg-6  send-message-btn pull-right" role="button"><i class="fa fa-plus"></i> New Message</a>--%>
    <%--</div>--%>
    <%--</div>--%>

    <%--<div class="col-lg-offset-1 col-lg-7">--%>
    <%--<div class="btn-panel btn-panel-msg">--%>

    <%--<a href="" class="btn  col-lg-3  send-message-btn pull-right" role="button"><i class="fa fa-gears"></i> Settings</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <div class="row">
        <div class="conversation-wrap col-lg-3">
            ${friendList}
        </div>

        <div class="message-wrap col-lg-8">
            <div id="chat" class="msg-wrap">
                ${chatHistory}
            </div>
            <sf:form id="chatMessageSubmitForm" >
                <div class="send-wrap">
                    <textarea id="chatMessage" name="chatMessage" class="form-control send-message" rows="3" placeholder="Write a reply..."></textarea>
                </div>
                <div class="btn-panel">
                    <a name="postMessage" id="postMessage" href="#" class=" col-lg-4 text-right btn   send-message-btn pull-right" role="button"><i class="fa fa-plus"></i> Send Message</a>
                </div>
            </sf:form>
        </div>
    </div>
</div>