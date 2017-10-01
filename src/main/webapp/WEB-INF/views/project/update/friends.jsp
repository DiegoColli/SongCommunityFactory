<%-- 
    Document   : friends
    Created on : Aug 2, 2017, 10:51:25 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="tab-pane fade" id="htab3">
    <h3 class="text-center">Enviar e-mail e pedido de ajuda aos seus amigos SongCommunityFactory</h3>
    <p class="center-block text-danger text-center">
        <strong>Antenção:</strong> Os amigos que aceitarem o pedio de ajuda automaticamente farão parte do projeto!
    </p>
    <div class="row">
        <div class="col-md-12">

            <div class="form-group">
                <label for="user-friends-active">
                    Amizades Ativas <i>(pressione Ctrl para selecionar mais de uma opção)</i>
                </label>
                <select multiple="" id="user-friends-active" class="form-control">
                    <c:forEach items="${user.friendsActive}" var="item">
                        <c:set var="optionId" value="${item.requester.id == user.id ? item.requested.id: item.requester.id}"/>
                        <c:set var="optionName" value="${item.requester.username == user.username ? item.requested.username: item.requester.username}"/>
                        <c:set var="optionEmail" value="${item.requester.email == user.email ? item.requested.email: item.requester.email}"/>
                        <option value="${optionId}" user-friends-email="${optionEmail}" >${optionName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="user-friends-message">O Texto abaixo será enviado no e-mail e na notificação</label>
                <textarea id="user-friends-message" maxlength="190" class="form-control" rows="3"></textarea>
            </div>	

        </div>
    </div>

</div>
