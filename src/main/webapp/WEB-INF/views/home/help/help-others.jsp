<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="help-others" tabindex="-1" role="dialog" aria-labelledby="help-others-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="help-others-label">Pedidos de Ajuda nos Últimos N Dias</h4>
            </div>
            <div class="modal-body">
                <p>Aqui você visualiza os pedidos de ajuda de outros usuários SongCommunityFactory. </p>
                <p>
                    Os pedidos de ajuda mostrados a você são escolhidos baseando-se em sua "preferência
                    musical" e o filtro "dias" limita o número de resultados baseando-se no intervalo escolhido 
                    para o mesmo.
                </p>
                <p>
                    Caso você queira participar de algum projeto clique em "Ajudar", 
                    fale um pouco sobre você e porque você se interessa em ajudar, depois
                    clique em "Oferecer Ajuda" e aguarde uma resposta.
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>