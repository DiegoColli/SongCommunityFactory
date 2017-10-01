<%-- 
    Document   : fileinput
    Created on : Sep 8, 2017, 7:33:55 AM
    Author     : Diego
--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="javatime" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script type="text/javascript">

//------------------------------------FILES-NEW---------------------------------

    //new files
    $(".workspace-file-new").fileinput({
        'theme': 'explorer',
        language: 'pt-BR',
        overwriteInitial: true,
        initialPreviewAsData: true,
        showUpload: false,
        initialPreview: [],
        initialPreviewConfig: []
    });

    //new files
    $('.workspace-file-new').on('change', function (event) {
        var nextDiv = "#" + $(this).attr("next-div");
        if ($(nextDiv).length)
        {
            $(nextDiv).removeClass("hidden");
        }
        else {
            alert("Você alcançou o número máximo de arquivos por requisição!");
        }
    });
    
    
    //write files
    $('.workspace-file-new').on('fileloaded', function (event, file, previewId, index, reader) {

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var formData = new FormData();
        formData.append("file", file);

        var ref = this;

        $(".post-submit-hidden").hide();
        $("body").css("cursor", "progress");
        
        $.ajax({
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: "POST",
            method: 'POST',
            enctype: 'multipart/form-data',
            url: "<c:url value="/api/project/resource/upload"/>",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,

            success: function (r) {
                console.log("success: " + r);
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Não conseguimos salvar o arquivo, por favor tente novamente");
                $(ref).fileinput('clear');
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    });
    

//---------------------------------------WORKSPACE PRINCIPAL--------------------

<c:forEach items="${workPrincipals}" var="workspace" varStatus="loop">
    <c:forEach items="${workspace.resources}" var="resource" varStatus="loop2">
        
    var btns_${resource.id} = '<a href="<c:url value="${resource.appPath}"/>" download><button type="button" id-resource="${resource.id}" class="kv-cust-btn btn btn-xs btn-default btn-download" title="Download"{dataKey}>'+
    '<i class="glyphicon text-dark glyphicon-download"></i>' +
    '</button></a>';
    
    $("#workspace-${workspace.id}-file-${resource.id}").fileinput({
        'theme': 'explorer',
        language: 'pt-BR',
        overwriteInitial: true,
        initialPreviewAsData: true,
        otherActionButtons: btns_${resource.id},
        showUpload: false,
        showRemove: false,
        showCancel: false,
        showBrowse: false,
        showClose: false,
        showDrag: false,
        fileActionSettings: {            
            showDrag: false,        
            removeClass: "hidden",
            removeIcon: ""                    
        },
        initialPreview: ["<c:url value="${resource.appPath}"/>"],
        initialPreviewConfig: [
            {type: "${resource.type}", filetype: "", caption: "${resource.name}", width: "120px", key: 1}
        ]
    });

    </c:forEach>
</c:forEach>

//---------------------------------------WORKSPACE OTHERS-----------------------

<c:forEach items="${workOthers}" var="workspace" varStatus="loop">
    <c:forEach items="${workspace.resources}" var="resource" varStatus="loop2">

    var btns_${resource.id} = '<a href="<c:url value="${resource.appPath}"/>" download>'+ 
    '<button type="button" id-resource="${resource.id}" class="kv-cust-btn btn btn-xs btn-default btn-download" title="Download"{dataKey}>' +
    '<i class="glyphicon text-dark glyphicon-download"></i>' +
    '</button></a>';

    $("#workspace-${workspace.id}-file-${resource.id}").fileinput({
        'theme': 'explorer',
        language: 'pt-BR',
        overwriteInitial: true,
        initialPreviewAsData: true,
        otherActionButtons: btns_${resource.id},
        showUpload: false,
        fileActionSettings: {
            showDrag: false,
            removeIcon: '<i class="glyphicon glyphicon-trash btn-remove-resource text-danger"></i>',
            removeClass: 'btn btn-xs btn-remove-resource fileinput-remove btn-default'
        },
        initialPreview: ["<c:url value="${resource.appPath}"/>"],
        initialPreviewConfig: [
            {type: "${resource.type}", filetype: "", caption: "${resource.name}", width: "120px", key: 1}
        ]
    });

    </c:forEach>
</c:forEach>

    //delete
    $('.workspace-file-other').on('fileclear', function (event, file, previewId, index, reader) {
        $(this).attr("deleted", "true");
    });
    
    //change
    $('.workspace-file-other').on('fileloaded', function (event, file, previewId, index, reader) {

        var token = $("meta[name='_csrf']").attr("content");
        var header = $("meta[name='_csrf_header']").attr("content");

        var formData = new FormData();
        formData.append("file", file);

        var ref = this;

        $(".post-submit-hidden").hide();
        $("body").css("cursor", "progress");

        $.ajax({
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            type: "POST",
            method: 'POST',
            enctype: 'multipart/form-data',
            url: "<c:url value="/api/project/resource/upload"/>",
            data: formData,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,

            success: function (r) {
                console.log("success: " + r);
                $(ref).attr("updated", "true");
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            },
            error: function (e) {
                console.log("Erro: " + e);
                alert("Não conseguimos salvar o arquivo, por favor tente novamente");
                $(ref).fileinput('clear');
                $(".post-submit-hidden").show();
                $("body").css("cursor", "default");
            }
        });
    });

</script>