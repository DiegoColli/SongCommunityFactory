<%-- 
    Document   : help-messages
    Created on : Sep 2, 2017, 7:14:00 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-md-12">
    <c:if test="${f:length(accepts) gt 0}">
        <c:forEach items="${accepts}" var="response">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close close-response" id-response="${response.id}" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <i class="fa fa-thumbs-o-up pr-10"></i>
                Sua ajuda no projeto 
                <a href="<c:url value="/project/update/${response.help.project.id}"/>" class="alert-link">
                    ${response.help.project.name} 
                </a>
                foi aceita!
            </div>
        </c:forEach>
    </c:if>
    <c:if test="${f:length(refuses) gt 0}">
        <c:forEach items="${refuses}" var="response">
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close close-response" id-response="${response.id}" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <i class="fa fa-warning pr-10"></i>
                Sua ajuda no projeto ${response.help.project.name} foi recusada!
            </div>
        </c:forEach>
    </c:if>
    
    
    <c:if test="${f:length(systemMessages) gt 0}">
        <c:forEach items="${systemMessages}" var="message">
            <c:set var="_class" value="alert-success"/>
            <c:set var="_fa" value="fa-thumbs-o-up"/>
            <c:if test="message.level == 4">
                <c:set var="_class" value="alert-danger"/>
                <c:set var="_fa" value="fa-warning"/>
            </c:if>
            
            <div class="alert ${_class}  alert-dismissible">
                <button type="button" class="close close-sys-message" id-message="${message.id}" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <i class="fa ${_fa} pr-10"></i>
                ${message.message}
            </div>
            
        </c:forEach>
    </c:if>
    
    
</div>