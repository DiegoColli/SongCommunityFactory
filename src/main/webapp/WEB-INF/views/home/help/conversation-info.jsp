<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="conversation-info" tabindex="-1" role="dialog" aria-labelledby="conversation-info-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="conversation-info-label">Notificações</h4>
            </div>
            <div class="modal-body">
                <p>Notificações são conversas entre você e outro usuário a respeito de algum projeto existente no SongCommunityFactory.</p>
                <p>
                    Uma vez enviada uma reposta ela desaparece da sua "pilha de mensagens" e aparece na pilha para quem você enviou, 
                    você só verá a mensagem de novo na sua pilha quando a pessoa lhe responder.
                </p>
                <p>
                    As notificações aqui mostradas também são exibidas dentro de seus respectivos projetos de forma permanente.
                </p>
                <p>Encerrar a notificação finalizará a conversa</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>               
            </div>
        </div>
    </div>
</div>