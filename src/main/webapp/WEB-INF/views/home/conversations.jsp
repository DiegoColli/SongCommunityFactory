<%-- 
    Document   : helpMessages
    Created on : Sep 2, 2017, 7:14:00 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${f:length(notifications) gt 0}">
    <div class="main col-md-12" >
        <div class="panel-group collapse-contextual" id="accordion-conversation">
            <c:forEach items="${notifications}" var="notification">

                <!--default-->
                <c:set var="_class" value="panel-info"/>
                <c:set var="modal" value="#conversation-info"/>
                <!--0 info 1 success 2 default 3 warning 4 danger-->
                <c:if test="${notification.level == 0}">
                    <c:set var="_class" value="panel-info"/>
                    <c:set var="modal" value="#conversation-info"/>
                </c:if>
                <c:if test="${notification.level == 1}">
                    <c:set var="_class" value="panel-success"/>
                    <c:set var="modal" value="#conversation-success"/>
                </c:if>
                <c:if test="${notification.level == 2}">
                    <c:set var="_class" value="panel-default"/>
                    <c:set var="modal" value="#conversation-default"/>
                </c:if>
                <c:if test="${notification.level == 3}">
                    <c:set var="_class" value="panel-warning"/>
                    <c:set var="modal" value="#conversation-warning"/>
                </c:if>
                <c:if test="${notification.level == 4}">
                    <c:set var="_class" value="panel-danger"/>
                    <c:set var="modal" value="#conversation-danger"/>
                </c:if>

                <div class="panel ${_class} ">
                    <div class="panel-heading ">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" class="collapsed" data-parent="#accordion-conversation" href="#collapse-conversation-${notification.id}" aria-expanded="false">
                                <i class="fa fa-info-circle pr-10"></i>
                                ${notification.title}
                                <i data-toggle="modal" data-target="${modal}" class="fa fa-question-circle pl-10"></i>
                            </a>
                        </h4>
                    </div>

                    <div id="collapse-conversation-${notification.id}" class="panel-collapse collapse" aria-expanded="false" >
                        <div class="panel-body">

                            <c:set var="invite" value="false"/>
                            <c:forEach items="${notification.messages}" var="message" varStatus="loop">

                                <c:if test="${loop.first && user.id != notification.createdBy.id && notification.invite}">
                                    <c:set var="invite" value="true"/>
                                </c:if>
                                
                                <c:if test="${!loop.last}">
                                    <c:if test="${user.id != message.from.id}">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div class="main col-md-10 col-md-offset-1 conversation-box-white" >
                                                    <span class="conversation-me">${message.from.username}</span>: 
                                                    ${message.phrase}
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${user.id == message.from.id}">
                                        <div class="row">
                                            <div class="col-md-4"></div>
                                            <div class="col-md-8">
                                                <div class="main col-md-10 col-md-offset-1 conversation-box-green" >
                                                    ${message.phrase}
                                                </div>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:if>

                                <c:if test="${loop.last}">
                                    <div class="row col-md-12">
                                        <div class="main col-md-5 col-md-offset-1 conversation-box-white" >
                                            <span class="conversation-me">${message.from.username}</span>:
                                            ${message.phrase}
                                        </div>
                                        <div class="main col-md-5 col-md-offset-1 conversation-box-green" >
                                            <div class="form-group">
                                                <br />
                                                <textarea id="message-conversation-${message.id}"  required="" maxlength="190" class="form-control" rows="2" placeholder="Escreva sua Reposta Aqui!"></textarea>
                                            </div>                                    
                                        </div>
                                    </div>
                                    <div class="row col-md-5 col-md-offset-7">                                        
                                        <c:if test="${invite}">
                                            <button type="button" id-notification="${notification.id}" class="btn btn-sm btn-animated btn-default post-submit-hidden accept-invite-notification">
                                                Colaborar com o Projeto<i class="fa fa-check"></i>
                                            </button>    
                                        </c:if>
                                        
                                        <c:if test="${!invite}">  
                                            
                                            <c:if test="${notification.projLink}">
                                                <a href="<c:url value="/project/update/${notification.project.id}"/>" class="btn btn-sm hidden-xs btn-default btn-logout">
                                                    Seguir para o Projeto <i class="fa icon-forward pl-5"></i>
                                                </a>
                                            </c:if>    
                                            <c:if test="${!notification.projLink}">
                                                <!--hack-gambi- to keep the size-->
                                                <button type="button"  class="btn btn-sm btn-default" style="visibility: hidden">
                                                    Colaborar com o Projeto<i class="fa fa-check"></i>
                                                </button>        
                                            </c:if>
                                            
                                        </c:if>
                                        
                                        <button type="button"  id-conversation="${message.id}" class="btn btn-sm btn-animated btn-warning post-submit-hidden finish-conversation">
                                            Encerrar <i class="fa fa-check"></i>
                                        </button>
                                        <button type="button" id-conversation="${message.id}" class="btn btn-sm btn-animated btn-success post-submit-hidden continue-conversation">
                                            Enviar <i class="fa fa-check"></i>
                                        </button>                                            
                                    </div>
                                </c:if>
                                
                            </c:forEach>
                            
                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
</c:if>
