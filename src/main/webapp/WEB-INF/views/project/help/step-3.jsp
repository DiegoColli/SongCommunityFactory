<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="modal fade" id="step-3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="myModalLabel3">Passo 3 - Solicitar Ajuda / Enviar Notificação</h4>
            </div>
            <div class="modal-body">
                <p>No passo 3 você pode pedir ajuda ou notificar outros usuários a respeito de diversos assuntos dentro do pojeto.</p>
                <p>Você tem 3 opções  que se somam nessa tarefa</p>
                <p>
                    <strong>Pedir Ajuda:</strong>
                    O que você escrever aqui será publicado como um pedido de ajuda
                    na pagina inicial para os usuários SongCommunityFactory                    
                </p>
                <p>
                    <strong>Outros:</strong>
                    Na aba "Outros" você pode informar alguns e-mails de seus amigos que ainda não são usuários do 
                    SongCommunityFactory, mas que você acha que poderiam ajudá-lo em seu projeto. 
                    Assim que seu projeto for criado nós enviaremos sua mensagem junto com um link
                    pedindo para que eles também façam parte do SongCommunityFactory
                </p>
                <p>
                    <strong>Amigos SCF:</strong>
                    Aqui você pode escolher já cadastrar previamente amigos como colaboradores no projeto
                    ou apenas enviar notificações e e-mails para os mesmos.
                    Essas notificações aparecerão na página inicial dos seus amigos.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-sm btn-default">Save changes</button>
            </div>
        </div>
    </div>
</div>