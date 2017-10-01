<%-- 
    Document   : friends
    Created on : Aug 2, 2017, 10:51:25 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="tab-pane fade" id="htab3">
    <h3 class="text-center">Colaboradores Atuais do Projeto</h3>
    <div class="row">
        <div class="col-md-12">

            <div class="form-group">
                <label for="user-collaborators-active">Colaboradores Ativas</label>
                <select multiple="" id="user-collaborators-active" class="form-control">
                    <c:forEach items="${model.owner.friends}" var="item">
                        <option value="${item.id}">${item.requester.username}-${item.requested.username}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="project-description">Descreva o projeto, ou fale sobre </label>
                <textarea id="project-description" maxlength="200" class="form-control" rows="3"></textarea>
            </div>	

        </div>
    </div>

</div>
