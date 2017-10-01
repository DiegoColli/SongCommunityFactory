<%-- 
    Document   : myHelps
    Created on : Aug 15, 2017, 10:50:39 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="main col-md-12" >

    <div class="panel-group collapse-style-2" id="accordion-containner-0">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-containner-0" href="#collapse-new-0" aria-expanded="true">
                        <i class="fa fa-life-saver pr-10"></i>
                        Meus pedidos de ajuda abertos
                        <i data-toggle="modal" data-target="#help-my-open-proj" class="fa fa-question-circle pl-10"></i>
                    </a>
                </h4>
            </div>

            <div id="collapse-new-0" class="panel-collapse collapse in" aria-expanded="true" >
                <div class="panel-body">

                    <c:set var="columns" value="${f:length(myHelps)}"/>
                    <c:set var="rows" value="${(columns/2)}"/>
                    <c:set var="index" value="0"/>
                    <c:set var="color" value="white"/>

                    <!--help blocks-->
                    <c:forEach var="i" begin="0" end="${rows}">

                        <div class="row col-md-12">

                            <c:if test="${columns > index}">                                                                     
                                <div class="main col-md-5 col-md-offset-1 help-box-${color}" >
                                    <h3>${myHelps[index].project.name}</h3>
                                    ${myHelps[index].project.description}
                                    <br />
                                    ${myHelps[index].message}
                                    <a data-toggle="modal" data-target="#my-help-responses-modal-${myHelps[index].id}" href="#">
                                        Nº. de Repostas Recebidas não Respondidas: ${f:length(myHelps[index].responsesUnread)}
                                    </a>                     
                                    <br />
                                    <a data-toggle="modal" data-target="#my-help-modal-${myHelps[index].id}" href="#">
                                        Alterar Ajuda / Mais Info.
                                    </a>                                    
                                </div>
                                <c:set var="index" value="${index+1}"/>
                            </c:if>

                            <c:set var="color" value="${color == 'grey'? 'white': 'grey'}"/>

                            <c:if test="${columns > index}">                                    
                                <div class="main col-md-5 col-md-offset-1 help-box-${color}" >                                        
                                    <h3>${myHelps[index].project.name}</h3>
                                    ${myHelps[index].project.description}
                                    <br />
                                    ${myHelps[index].message}                                        
                                    <a data-toggle="modal" data-target="#my-help-responses-modal-${myHelps[index].id}" href="#">
                                        Nº. de Repostas Recebidas não Respondidas: ${f:length(myHelps[index].responsesUnread)}
                                    </a>                                                                            
                                    <br />                                        
                                    <a data-toggle="modal" data-target="#my-help-modal-${myHelps[index].id}" href="#">
                                        Alterar Ajuda / Mais Info.
                                    </a>                                        
                                </div>
                                <c:set var="index" value="${index+1}"/>
                            </c:if>

                        </div>

                    </c:forEach>

                    <!--hidden modals-->
                    <c:forEach items="${myHelps}" var="help">

                        <!-- Modal -->
                        <div class="modal fade" id="my-help-modal-${help.id}" tabindex="-1" role="dialog" aria-labelledby="my-help-label-${help.id}" aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close post-submit-hidden" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                                        <h4 class="modal-title" id="my-help-label-${help.id}">${help.project.name}</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>
                                            ${help.project.description}
                                            <!--retirado só para não por nos use case-->
                                            <!--<a href="<c:url value="/project/update/${help.project.id}"/>" >seguir para o projeto</a>-->
                                        </p>

                                        <div id="request-help-${help.id}" class="summernote">${help.message}</div>

                                    </div>
                                    <div class="modal-footer">
                                        <span class="btn btn-sm btn-dark" style="visibility: hidden; cursor: default"><!--hack--></span>
                                        <button type="button" class="btn btn-sm btn-dark post-submit-hidden" data-dismiss="modal">Fechar</button>
                                        <button type="button" class="btn btn-sm btn-danger btn-cancel-help post-submit-hidden" id-help="${help.id}" id-project="${help.project.id}" >Finalizar Pedido</button>
                                        <button type="button" class="btn btn-sm btn-default btn-change-help post-submit-hidden" id-help="${help.id}" id-project="${help.project.id}" >Salvar Aterações</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal fade" id="my-help-responses-modal-${help.id}" tabindex="-1" role="dialog" aria-labelledby="my-help-responses-label-${help.id}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close post-submit-hidden" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                                        <h4 class="modal-title" id="my-help-responses-label-${help.id}">${help.project.name}</h4>
                                    </div>

                                    <div class="modal-body">
                                        <c:forEach items="${help.responsesUnread}" var="response">
                                            <hr>
                                            <div>                                                                      
                                                <%--<javatime:parseLocalDateTime value="${response.responder.created}" pattern="yyyy-MM-dd" var="parsedDate" />--%>
                                                O usuário:                                                     
                                                <a href="<c:url value="/user/profile/${response.responder.id}"/>" target="_blank" >${response.responder.username} </a>
                                                inscrito desde: ${response.responder.createdBr} ofereceu ajuda.
                                            </div>
                                            <div>
                                                ${response.message}
                                            </div>                                                    
                                            <div class="form-group" style="display: none;" id="div-message-response-${response.id}">
                                                <br />
                                                <textarea class="form-control" id-help="${help.id}" id-project="${help.project.id}"  id="message-response-${response.id}" maxlength="190" required="" rows="3"></textarea>
                                                <br />
                                            </div>
                                            <div>                                                    
                                                <button type="button" class="btn btn-sm btn-danger btn-refuse-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" >Recusar</button>
                                                <button type="button" class="btn btn-sm btn-success btn-accept-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" >Aceitar</button>
                                                <c:if test="${!response.notified}">                                                
                                                    <button type="button" id="btn-message-response-${response.id}" class="btn btn-sm btn-default btn-msg-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" >Escrever Mensagem</button>
                                                    <button type="button" id="btn-send-message-response-${response.id}" class="btn btn-sm btn-success btn-send-msg-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" style="display: none;" >Enviar Mensagem</button>
                                                </c:if>
                                            </div>

                                        </c:forEach>

                                        <c:forEach items="${help.responsesAccepted}" var="response">
                                            <hr>
                                            <div>                                                                             
                                                Você aceitou o pedido de ajuda do usuário:                                                     
                                                <a href="<c:url value="/user/profile/${response.responder.id}"/>" target="_blank" >${response.responder.username} </a>
                                                inscrito desde: ${response.responder.createdBr}.
                                            </div>
                                            <div>
                                                ${response.message}
                                            </div>
                                            <c:if test="${!response.notified}">
                                                <div class="form-group" style="display: none;" id="div-message-response-${response.id}">
                                                    <br />
                                                    <textarea class="form-control" id-help="${help.id}" id-project="${help.project.id}"  id="message-response-${response.id}" maxlength="190" required="" rows="3"></textarea>
                                                    <br />
                                                </div>
                                                <div>
                                                    <button type="button" id="btn-message-response-${response.id}" class="btn btn-sm btn-default btn-msg-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" >Escrever Mensagem</button>
                                                    <button type="button" id="btn-send-message-response-${response.id}" class="btn btn-sm btn-success btn-send-msg-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" style="display: none;" >Enviar Mensagem</button>
                                                </div>            
                                            </c:if>

                                        </c:forEach>

                                        <c:forEach items="${help.responsesRefused}" var="response">
                                            <hr>
                                            <div>                                                                             
                                                Você recusou o pedido de ajuda do usuário:
                                                <a href="<c:url value="/user/profile/${response.responder.id}"/>" target="_blank" >${response.responder.username} </a>
                                                inscrito desde: ${response.responder.createdBr}.
                                            </div>
                                            <div>
                                                ${response.message}
                                            </div>           
                                            <div class="form-group" style="display: none;" id="div-message-response-${response.id}">
                                                <br />
                                                <textarea class="form-control" id-help="${help.id}" id-project="${help.project.id}"  id="message-response-${response.id}" maxlength="190" required="" rows="3"></textarea>
                                                <br />
                                            </div>
                                            <div>                                                                                                        
                                                <button type="button" class="btn btn-sm btn-success btn-accept-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" >Aceitar</button>
                                                <c:if test="${!response.notified}">
                                                    <button type="button" id="btn-message-response-${response.id}" class="btn btn-sm btn-default btn-msg-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" >Escrever Mensagem</button>
                                                    <button type="button" id="btn-send-message-response-${response.id}" class="btn btn-sm btn-success btn-send-msg-help post-submit-hidden" id-response="${response.id}" id-help="${help.id}" id-project="${help.project.id}" style="display: none;" >Enviar Mensagem</button>
                                                </c:if>
                                            </div>

                                        </c:forEach>

                                    </div>

                                    <div class="modal-footer">
                                        <span class="btn btn-sm btn-dark" style="visibility: hidden; cursor: default"><!--hack--></span>
                                        <button type="button" class="btn btn-sm btn-dark post-submit-hidden" data-dismiss="modal">Fechar</button>
                                    </div>
                                </div>
                            </div>
                        </div> 

                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</div>
