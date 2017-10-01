<%-- 
    Document   : script
    Created on : Sep 2, 2017, 5:32:08 PM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">
    $(function () {

        //principal form
        $("#form-project").submit(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();

            try {
                var jsonModel = getObjects();
                postData($(this).attr("action"), jsonModel);    
            } catch (e) {
                alert(e);
            }

            return false;
        });//save

        $(".user-emails").change(function () {
            if (trim($(this).val()) != "")
            {
                if ($(this).next(".user-emails").length)
                {
                    $(this).next(".user-emails").removeClass("hidden");
                } else
                    alert("Você atingiu o valor máximo de e-mails permitido");
            }
        });

        //summernote
        $('#request-help').summernote({
            height: 250,
            placeholder: 'Escreva aqui um pedido de ajuda bem bonito para que possamos publicar na página inicial do SongCommunityFactory',
            toolbar: [
                ['style', ['style', 'bold', 'italic', 'underline', 'clear']],
                ['fonts', ['fontname', 'fontsize', 'paragraph']],
                ['color', ['color']],
                ['height', ['height']],
                ['insert', ['video', 'picture', 'link']],
                ['misc', ['fullscreen']]
            ]
        });

    });

    //files style
    $(".file-project").fileinput({
        'theme': 'explorer',
        language: 'pt-BR',
        overwriteInitial: true,
        initialPreviewAsData: true,
        showUpload: false,
        initialPreview: [],
        initialPreviewConfig: [],
        maxFilePreviewSize: 125600,
        maxFileSize: 125500
    });

    //new files
    $('.file-project').on('change', function (event) {
        var nextDiv = "#" + $(this).attr("next-div");

        if ($(nextDiv).length)
        {
            $(nextDiv).removeClass("hidden");
        } else {
            alert("Você alcançou o número máximo de arquivos por requisição!");
        }
    });
    
    
    //write files
    $('.file-project').on('fileloaded', function (event, file, previewId, index, reader) 
    {   
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var formData = new FormData();
        formData.append("file", file);

        console.log(file)
        
        var ref = this;

        $.ajax({
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: "POST",
            method: 'POST',
            enctype: 'multipart/form-data',
            url: "/songCommunityFactory/api/project/resource/upload",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,

            success: function (r) {
                console.log("success: " + r);
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Não conseguimos salvar o arquivo, por favor tente novamente");
                $(ref).fileinput('clear');
            }
        });
    });


    /*
     Post $jsonModel at $action
     */
    function postData($action, $jsonModel)
    {
        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");
        $.ajax({
            url: $action,
            method: 'POST',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
                $(".post-submit-hidden").hide();
                $("body").css("cursor", "progress");
            },
            contentType: 'application/json',
            data: JSON.stringify($jsonModel),
            success: function (r) {
                console.log("success: " + r);
                alert("Projeto Criado com Sucesso!");
                window.location = "<c:url value="/project/all"/>";
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Erro: " + e.message);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    }


    /*
     Returns a full filled Object from the insert form
     */
    function getObjects()
    {
        //project
        var project = getProjectStruture();        
        project.name = getValOrThrow("#project-name","Nome do Projeto");
        project.bandName = getValOrThrow("#project-band-name","Nome do Grupo");
        project.description = getValOrThrow("#project-description","Descrição");
        
        //workspaces
        var workspaces = [];
        var _count = $("#project-workspaces-count").val();

        for (var i = 0; i < _count; i++)
        {
            var workspace = getWorkspaceStruture();
            var workId = $("#workspace-" + i + "-id").val();
            workspace.principal = true;
            workspace.version = "1";
            workspace.name = $("#workspace-" + workId + "-name").val();
            workspace.description = getValOrThrow("#workspace-" + workId + "-description", "Descrição/Objetivo");
            workspaces.push(workspace);
        }
        project.workspaces = workspaces;

        //resources
        var resources = [];
        $(".file-project").each(function () {
            if ($(this).val())
            {
                var resource = new Object();
                resource.name = $(this)[0].files[0].name;
                resources.push(resource);
            }
        });
        if (resources.length > 0)
        {
            project.resources = resources;
        }

        //styles
        var styles = [];
        var stylesSelector = "#project-styles option:selected";
        $(stylesSelector).each(function (i, selected) {
            var style = new Object();
            style.id = $(selected).val();
            styles.push(style);
        });
        if (!styles.length)
        {
            var style = new Object();
            style.id = 4; //not know yet
            styles.push(style);
        }
        project.styles = styles;

        //types
        var types = [];
        var typesSelector = "#project-types option:selected";
        $(typesSelector).each(function (i, selected) {
            var type = new Object();
            type.id = $(selected).val();
            types.push(type);
        });
        if (!types.length)
        {
            var type = new Object();
            type.id = 4;//not know yet
            types.push(type);
        }
        project.types = types;

        //helps
        var helpStr = $('#request-help').summernote('code');
        var fooHelp = replaceAll(replaceAll(replaceAll(replaceAll(helpStr, ' ', ''), '<p>', ''), '</p>', ''), "<br>", '');
        if (fooHelp != "")
        {
            var helps = [];
            var _help = new Object();
            _help.message = helpStr;
            helps.push(_help);
            project.helps = helps;
        }
        
        if(helpStr.length>700)
            throw "O campo Pedido de Ajuda SongCommunityFactory ultrapassou o valor máximo de 700 caracteres permitidos!";

        //others-emails
        var to = [];
        $(".user-emails").each(function () {
            if (trim($(this).val()) != "")
            {
                if(!isEmail($(this).val()))
                {
                    throw "Endereço de e-mail informado não é válido!";
                }
                
                to.push($(this).val());
            }
        });
        to = Array.from(new Set(to));
        var emails = [];
        $.each(to, function (index, value) {
            var email = new Object();
            email.to = value;
            email.userMessage = getValOrThrow("#user-others-message", "Texto de Convite para seus Amigos");
            emails.push(email);
        });
        project.emails = emails;

        //friends-notifications
        project.notifications = [];
        var friendsSelector = "#user-friends-active option:selected";
        $(friendsSelector).each(function (i, selected) {
            
            var user = new Object();
            user.id = $(selected).val();
            user.email = $(selected).attr("user-friends-email");
            user.username = $(selected).text();
            
            var userMessageStatus = new Object();
            userMessageStatus.user = user;
            userMessageStatus.status = 0;
            
            var message = new Object();
            message.phrase = getValOrThrow("#user-friends-message", "Pedido de ajuda aos seus amigos SongCommunityFactory");
            message.userMessageStatus =[];
            
            var notification = new Object();
            notification.invite = 1;
            notification.open = 1;
            notification.level = 0;            
            notification.messages = [];
            notification.users = [];
            
            message.userMessageStatus.push(userMessageStatus);
            notification.users.push(user);
            notification.messages.push(message);
            project.notifications.push(notification);    
        });
        
        return project;
    }
    
//-----------------------STRUCTURE----------------------------------------------

    function getProjectStruture()
    {
        return ${base_project};
    }

    function getWorkspaceStruture()
    {
        return ${base_workspace};
    }

</script>