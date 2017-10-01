<%-- 
    Document   : otherHelps
    Created on : Aug 15, 2017, 10:50:53 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="main col-md-12" >   

    <div class="panel-group collapse-style-2" id="accordion-containner-1">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion-containner-1" href="#collapse-new-1" aria-expanded="true">
                        <i class="fa fa-life-saver pr-10"></i>
                        Pedidos de ajuda nos ultimos <input size="3" maxlength="3" type="text" value="${interval}" id="others-filter" /> dias.
                        <button id="btn-others-filter" class="btn btn-sm btn-dark">
                            Filtrar<i class="fa fa-filter"></i>
                        </button>
                        <i data-toggle="modal" data-target="#help-others" class="fa fa-question-circle pl-10"></i>
                    </a>
                </h4>
            </div>

            <div id="collapse-new-1" class="panel-collapse collapse in" aria-expanded="true" >
                <div class="panel-body">

                    <c:set var="columns" value="${f:length(otherHelps)}"/>
                    <c:set var="rows" value="${(columns/2)}"/>
                    <c:set var="index" value="0"/>
                    <c:set var="color" value="white"/>

                    <!--help blocks-->
                    <c:forEach var="i" begin="0" end="${rows}">

                        <div class="row col-md-12">

                            <c:if test="${columns > index}">
                                <div class="main col-md-5 col-md-offset-1 help-box-${color}" >
                                    <h3>${otherHelps[index].project.name}</h3>
                                    ${otherHelps[index].project.description}
                                    <br />
                                    ${otherHelps[index].message}
                                    <br />
                                    <a data-toggle="modal" data-target="#help-modal-${otherHelps[index].id}" href="#">
                                        Ajudar
                                    </a>
                                </div>
                                <c:set var="index" value="${index+1}"/>
                            </c:if>

                            <c:set var="color" value="${color == 'grey'? 'white': 'grey'}"/> 

                            <c:if test="${columns > index}">                                    
                                <div class="main col-md-5 col-md-offset-1 help-box-${color}" >
                                    <h3>${otherHelps[index].project.name}</h3>
                                    ${otherHelps[index].project.description}
                                    <br />
                                    ${otherHelps[index].message}
                                    <br />
                                    <a data-toggle="modal" data-target="#help-modal-${otherHelps[index].id}" href="#">
                                        Ajudar
                                    </a>
                                </div>
                                <c:set var="index" value="${index+1}"/>
                            </c:if>

                        </div>

                    </c:forEach>

                    <!--hidden modals-->
                    <c:forEach items="${otherHelps}" var="help">

                        <!-- Modal -->
                        <div class="modal fade" id="help-modal-${help.id}" tabindex="-1" role="dialog" aria-labelledby="help-label-${help.id}" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close post-submit-hidden" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                                        <h4 class="modal-title" id="help-label-${help.id}">${help.project.name}</h4>
                                    </div>
                                    <div class="modal-body">
                                        <p>${help.project.description}</p>
                                        <p>${help.message}</p>

                                        <div class="form-group">
                                            <label for="help-message-${help.id}">Porque você se interresou?</label>
                                            <textarea id="help-message-${help.id}" class="form-control" rows="3" required="" maxlength="190" ></textarea>
                                        </div>	

                                    </div>

                                    <div class="modal-footer">
                                        <span class="btn btn-sm btn-dark" style="visibility: hidden; cursor: default"><!--hack--></span>
                                        <button type="button" class="btn btn-sm btn-dark post-submit-hidden" data-dismiss="modal">Fechar</button>
                                        <button type="button" class="btn btn-sm btn-default btn-help-out post-submit-hidden" id-project="${help.project.id}" id-help="${help.id}" >Oferecer Ajuda</button>
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