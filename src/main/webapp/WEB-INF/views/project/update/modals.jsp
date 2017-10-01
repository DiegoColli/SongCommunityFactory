<%-- 
    Document   : modals
    Created on : Sep 10, 2017, 11:38:46 AM
    Author     : Diego
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- Modal Release -->
<div class="modal fade" id="submit-publishing-modal" tabindex="-1" role="dialog" aria-labelledby="submitPublishingLabel" aria-hidden="true">
     <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="submitPublishingLabel">Submeter Itens Marcados para Publicação</h4>
            </div>
            <div class="modal-body">
                <h4>Entenda como funciona o processo de votação para liberação de publicação</h4>
                <p>
                    Antes de serem disponibilizados na página de publicações do SongCommunityFactory, os itens submetidos para publicação 
                    precisam ser aprovados por todos os integrantes do projeto.                
                </p>
                <p>Caso um integrante do projeto opte por desaprovar a publicação o pedido todo é cancelado.</p>
                <p>
                   Se um integrante demorar mais do que três dias para votar, o voto desse integrante será contato como positivo para a aprovação.
                </p>
            </div>            
            <div class="modal-footer">                
                <input type="hidden" id="modal-publishing-id" />
                <span class="btn btn-sm btn-dark" style="visibility: hidden; cursor: default"><!--hack--></span>
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-sm btn-default" id="btn-submit-release-items" >Prosseguir</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Workspace Principal -->
<div class="modal fade" id="submit-workspace-modal" tabindex="-1" role="dialog" aria-labelledby="submitWorkspaceLabel" aria-hidden="true">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Fechar</span></button>
                <h4 class="modal-title" id="submitWorkspaceLabel">Submeter Espaço de Trabalho para Aprovação </h4>
            </div>
            <div class="modal-body">
                 <h4>Entenda como funciona o processo de votação para convergência no espaço de trabalho Principal</h4>
                <p>
                    Antes que um espaço de trabalho pessoal se converta no espaço de trabalho principal, ele precisa 
                    ser aprovados pela metade dos integrantes do projeto.  
                </p>
                <p>Caso mais da metade dos integrantes optem por desaprovar o espaço de trabalho, o seu pedido será cancelado.</p>
                <p>
                   Se um integrante demorar mais do que três dias para votar, o voto desse integrante será contato como positivo para a aprovação.
                </p>
                <p>
                    <strong>
                        Atenção salve qualquer trabalho que tenha feito antes de submeter o mesmo para aprovação! 
                        Ou as alterações serão perdidas, e você ficará impossibilitado de realizá-las enquanto estiver
                        o mesmo estiver votação.
                    </strong>
                </p>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="modal-work-id" />
                <span class="btn btn-sm btn-dark" style="visibility: hidden; cursor: default"><!--hack--></span>                
                <button type="button" class="btn btn-sm btn-dark" data-dismiss="modal">Fechar</button>
                <button type="button" class="btn btn-sm btn-default" id="btn-submit-workspace-data">Prosseguir</button>
            </div>
        </div>
    </div>
</div>