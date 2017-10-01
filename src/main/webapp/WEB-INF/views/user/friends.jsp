<%-- 
    Document   : friends
    Created on : Aug 15, 2017, 1:37:48 PM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="main col-md-12" >

    <div class="panel-group collapse-style-2" id="accordion-containner-1">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-containner-1" href="#collapse-new-1" aria-expanded="true">
                        <i class="fa fa-group pr-10"></i>

                        Meus Amigos SongCommunityFactory
                        <i data-toggle="modal" data-target="#help-friends" class="fa fa-question-circle pl-10"></i>

                    </a>
                </h4>
            </div>

            <div id="collapse-new-1" class="panel-collapse collapse in" aria-expanded="true" >
                <div class="panel-body">
                    <div class="row">
                        <div class="main col-md-10 col-md-offset-1 ">
                            <div class="form-group col-md-6">
                                <label for="project-types">Amizades Ativas</label>
                                <ul id="user-friends-active" class="connectedSortable">
                                    <c:forEach items="${model.friendsActive}" var="item">
                                        <li value="${item.id}" id-requested="${item.requested.id}" id-requester="${item.requester.id}" >${item.requester.username} - ${item.requested.username}</li>
                                        </c:forEach>
                                </ul>
                            </div>

                            <div class="form-group col-md-6">                                        
                                <label for="project-types">Amizades Inativas</label>
                                <ul id="user-friends-inactive" class="connectedSortable">
                                    <c:forEach items="${model.friendsInactive}" var="item">
                                        <li value="${item.id}" id-requested="${item.requested.id}" id-requester="${item.requester.id}" >${item.requester.username} - ${item.requested.username}</li>
                                        </c:forEach>
                                </ul>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-10 col-sm-2">
                                    <button id="submit-btn-friendship" type="button" class="btn btn-sm btn-animated btn-default post-submit-hidden" >Confirmar <i class="fa fa-check"></i></button>
                                </div>                                    
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

</div>