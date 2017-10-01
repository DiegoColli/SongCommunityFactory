<%-- 
    Document   : new
    Created on : Jul 22, 2017, 6:22:30 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<section class="section default-bg clearfix">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="call-to-action text-center">
                    <div class="row">
                        <div class="col-sm-8">
                            <h1 class="title">Criar um Projeto Novo</h1>
                            <p>
                                Comece um novo projeto agora mesmo seguindo o passo a passo!
                        </div>
                        <div class="col-sm-4">
                            <br>
                            <p>
                                <a href="<c:url value="/project/new"/>" class="btn btn-lg btn-gray-transparent btn-animated">
                                    Começar
                                    <i class="fa fa-arrow-right pl-20"></i>
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<c:forEach items="${summaryProjects}" var="project">
    <br>
    <section class="section parallax background-img-1 dark-translucent-bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="call-to-action text-center">
                        <div class="row">
                            <div class="col-sm-8">
                                <h1 class="title">${project.name}</h1>
                                <p>
                                    Criado em: ${project.createdBr}. Contendo: ${project.workspaces} Workspaces, ${project.contracts+1} Usuários, 
                                    ${project.publications}  Publicações, ${project.resources} Recursos
                                </p>
                            </div>
                            <div class="col-sm-4">
                                <br>
                                <p>
                                    <a href="<c:url value="/project/update/${project.id}"/>" class="btn btn-lg btn-gray-transparent btn-animated">
                                        Gerenciar
                                        <i class="fa fa-arrow-right pl-20"></i>
                                    </a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</c:forEach>

