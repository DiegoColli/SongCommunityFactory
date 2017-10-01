<%-- 
    Document   : common-header
    Created on : Jun 6, 2017, 11:40:53 AM
    Author     : Diego
--%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- JavaScript files placed at the end of the document so the pages load faster -->
<!-- ================================================== -->
<!-- Jquery and Bootstap core js files -->
<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
<!-- Modernizr javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/modernizr.js"/>"></script>
<!-- jQuery Revolution Slider  -->
<script type="text/javascript" src="<c:url value="/resources/plugins/rs-plugin/js/jquery.themepunch.tools.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/rs-plugin/js/jquery.themepunch.revolution.min.js"/>"></script>
<!-- Isotope javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/isotope/isotope.pkgd.min.js"/>"></script>
<!-- Magnific Popup javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/magnific-popup/jquery.magnific-popup.min.js"/>"></script>
<!-- Appear javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/waypoints/jquery.waypoints.min.js"/>"></script>
<!-- Count To javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.countTo.js"/>"></script>
<!-- Parallax javascript -->
<script src="<c:url value="/resources/plugins/jquery.parallax-1.1.3.js"/>"></script>
<!-- Contact form -->
<script src="<c:url value="/resources/plugins/jquery.validate.js"/>"></script>
<!-- Background Video -->
<script src="<c:url value="/resources/plugins/vide/jquery.vide.js"/>"></script>
<!-- Owl carousel javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/owl-carousel/owl.carousel.js"/>"></script>
<!-- SmoothScroll javascript -->
<script type="text/javascript" src="<c:url value="/resources/plugins/jquery.browser.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/SmoothScroll.js"/>"></script>
<!--Summernote-->
<script type="text/javascript" src="<c:url value="/resources/plugins/summernote/dist/summernote.min.js"/>"></script>
<!--fileinput-->
<script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap-fileinput-master/js/plugins/sortable.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap-fileinput-master/js/plugins/purify.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap-fileinput-master/js/fileinput.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap-fileinput-master/themes/explorer/theme.js"/>"></script>

<script type="text/javascript" src="<c:url value="/resources/plugins/bootstrap-fileinput-master/js/locales/pt-BR.js"/>"></script>
<!-- Initialization of Plugins -->
<script type="text/javascript" src="<c:url value="/resources/js/template.js"/>"></script>
<!-- Custom Scripts -->
<script type="text/javascript" src="<c:url value="/resources/js/common.js"/>"></script>


<!--just an example
<c:if test="${not empty pageContext.request.userPrincipal}">
    User: <c:out value="${pageContext.request.userPrincipal.name}" />
</c:if>
    -->