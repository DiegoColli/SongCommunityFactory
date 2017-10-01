<%-- 
    Document   : step-1
    Created on : Aug 9, 2017, 7:36:10 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="step-1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="myModalLabel">Passo 1 - Dados do Projeto</h4>
            </div>
            <div class="modal-body">
                <p>No passo 1 você deve preencher os dados gerais do projeto.</p>
                <p>Use um nome que represente o que você quer fazer</p>
                <p>Defina o estilo do que você quiser criar ou escolha "Todos", o campo estilo será 
                    amplamente utilizado em pesquisas dentro do SongCommunityFactory</p>
                <p>Escreva no campo "Descrição" qualquer informação que você julgue necessário</p>                
                <p>É importante saber que projetos criados não podem ser exclúidos</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
            </div>
        </div>
    </div>
</div>