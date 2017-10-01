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

<c:if test="${f:length(model.notifications) gt 0}">
    <div class="row" >
        <div class="col-md-12" >
            <div class="panel-group collapse-contextual" id="accordion-conversation">
                <c:forEach items="${model.notifications}" var="notification">

                    <!--default-->
                    <c:set var="_class" value=""/>
                    <c:set var="modal" value=""/>

                    <c:if test="${notification.open}">
                        <c:set var="_class" value="panel-success"/>
                        <c:set var="modal" value="#conversation-success"/>
                    </c:if>
                    <c:if test="${!notification.open}">
                        <c:set var="_class" value="panel-default"/>
                        <c:set var="modal" value="#conversation-default"/>
                    </c:if>

                    <div class="panel ${_class} ">
                        <div class="panel-heading ">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" class="collapsed" data-parent="#accordion-conversation" href="#collapse-conversation-${notification.id}" aria-expanded="false">
                                    ${notification.title}                                    
                                </a>
                            </h4>
                        </div>

                        <div id="collapse-conversation-${notification.id}" class="panel-collapse collapse" aria-expanded="false" >
                            <div class="panel-body">

                                <c:forEach items="${notification.messages}" var="message" varStatus="loop">

                                    <c:if test="${user.id != message.from.id}">'
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

                                    <c:if test="${loop.last}">  
                                        <c:if test="${notification.open}">
                                            <div class="row col-md-12">
                                                <div class="main col-md-5 col-md-offset-1">                                                
                                                </div>
                                                <div class="main col-md-5 col-md-offset-1 conversation-box-green" >
                                                    <div class="form-group">
                                                        <br />
                                                        <textarea id="message-conversation-${message.id}" required=""  maxlength="190" class="form-control" rows="2" placeholder="Escreva sua Reposta Aqui!"></textarea>
                                                    </div>                                    
                                                </div>
                                            </div>
                                            <div class="row col-md-5 col-md-offset-7">
                                                <button type="button"  id-conversation="${message.id}" class="btn btn-sm btn-animated btn-warning post-submit-hidden finish-conversation">
                                                    Encerrar <i class="fa fa-check"></i>
                                                </button>
                                                <button type="button" id-conversation="${message.id}" class="btn btn-sm btn-animated btn-success post-submit-hidden continue-conversation">
                                                    Enviar <i class="fa fa-check"></i>
                                                </button>
                                            </div>
                                        </c:if>
                                        <c:if test="${!notification.open}">
                                            <div class="row col-md-5 col-md-offset-7">
                                                <button type="button" id-conversation="${message.id}" class="btn btn-sm btn-animated btn-success post-submit-hidden reopen-conversation">
                                                    Reabrir Notificação <i class="fa fa-check"></i>
                                                </button>
                                            </div>
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</c:if>
<c:if test="${!(f:length(model.notifications) gt 0)}">
    <br />
    Você ainda não possui nenhuma notificação neste projeto.
    <br />
</c:if>

<c:if test="${(f:length(model.contracts) gt 0)}">
    <div class="panel panel-warning">
        <div class="panel-heading ">
            <h4 class="panel-title">
                <a data-toggle="collapse" class="collapsed" data-parent="#accordion-conversation" href="#collapse-conversation-0" aria-expanded="false">
                    Criar Notificação
                </a>
            </h4>
        </div>
        <div id="collapse-conversation-0" class="panel-collapse collapse" aria-expanded="false" >
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">                    
                        <form role="form" >
                            <div class="form-group">
                                <label for="project-contracts" class="control-label">
                                    Destinatários: <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                                </label>
                                <select multiple="" id="project-contracts" class="form-control" >
                                    <c:forEach items="${model.contracts}" var="contract">                                        
                                        <c:if test="${contract.worker.id == user.id}">
                                            <option value="${model.owner.id}">${model.owner.username}</option>    
                                        </c:if>
                                        <c:if test="${contract.worker.id != user.id}">
                                            <option value="${contract.worker.id}">${contract.worker.username}</option>    
                                        </c:if>                                        
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="project-workers">Título da Notificação</label>
                                <input type="text" id="notification-title" class="form-control"  required="" maxlength="290" oninvalid="getVal(this, 'Título da Notificação')"  />
                            </div>	
                            <div class="form-group">
                                <label for="project-workers">Mensagem</label>
                                <textarea id="notification-phrase" maxlength="190" required="" oninvalid="getVal(this, 'Mensagem')" class="form-control" rows="3"></textarea>
                            </div>	
                            <div class="form-group">
                                <div class="col-sm-offset-10 col-sm-2">
                                    <button id="btn-new-notification" type="submit" class="btn btn-sm btn-animated btn-success post-submit-hidden" >
                                        Enviar
                                        <i class="fa fa-check"></i>
                                    </button>
                                </div>                                    
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>