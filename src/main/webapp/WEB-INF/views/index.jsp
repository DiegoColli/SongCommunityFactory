<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
    <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <title>Song Community Factory | Home </title>
        <c:import url="/WEB-INF/views/shared/common-header.jsp" />
    </head>

    <!-- body classes:  -->
    <!-- "boxed": boxed layout mode e.g. <body class="boxed"> -->
    <!-- "pattern-1 ... pattern-9": background patterns for boxed layout mode e.g. <body class="boxed pattern-1"> -->
    <!-- "transparent-header": makes the header transparent and pulls the banner to top -->
    <!-- "gradient-background-header": applies gradient background to header -->
    <!-- "page-loader-1 ... page-loader-6": add a page loader to the page (more info @components-page-loaders.html) -->
    <body class="no-trans front-page transparent-header  ">

        <!-- scrollToTop -->
        <!-- ================ -->
        <div class="scrollToTop circle"><i class="icon-up-open-big"></i></div>

        <!-- page wrapper start -->
        <!-- ================ -->
        <div class="page-wrapper">

            <!-- header-container start -->
            <div class="header-container">

                <!-- header-top -->
                <c:import url="/WEB-INF/views/shared/common-social.jsp" />
                <!-- header-top end -->

                <!-- header start -->
                <!-- classes:  -->
                <!-- "fixed": enables fixed navigation mode (sticky menu) e.g. class="header fixed clearfix" -->
                <!-- "dark": dark version of header e.g. class="header dark clearfix" -->
                <!-- "full-width": mandatory class for the full-width menu layout -->
                <!-- "centered": mandatory class for the centered logo layout -->
                <!-- ================ --> 
                <c:import url="/WEB-INF/views/shared/common-public-menu.jsp" />
            </div>
            <!-- header-container end -->

            <!-- banner start -->
            <!-- ================ -->
            <div class="banner clearfix">

                <!-- slideshow start -->
                <!-- ================ -->
                <div class="slideshow">

                    <!-- slider revolution start -->
                    <!-- ================ -->
                    <div class="slider-banner-container">
                        <div class="slider-banner-fullscreen">
                            <ul class="slides">
                                <!-- slide 1 start -->
                                <!-- ================ -->
                                <li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Song Community Factory">

                                    <!-- main image -->
                                    <img src="<c:url value="/resources/images/slide1.jpg"/>" alt="slidebg1" data-bgposition="center top"  data-bgrepeat="no-repeat" data-bgfit="cover">

                                    <!-- Transparent Background -->
                                    <div class="tp-caption dark-translucent-bg"
                                         data-x="center"
                                         data-y="bottom"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="0">
                                    </div>

                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption sfr stl xlarge_white"
                                         data-x="center"
                                         data-y="70"
                                         data-speed="200"
                                         data-easing="easeOutQuad"
                                         data-start="1000"
                                         data-end="2500"
                                         data-splitin="chars"
                                         data-elementdelay="0.1"
                                         data-endelementdelay="0.1"
                                         data-splitout="chars">Inspiração
                                    </div>

                                    <!-- LAYER NR. 2 -->
                                    <div class="tp-caption sfl str xlarge_white"
                                         data-x="center"
                                         data-y="70"
                                         data-speed="200"
                                         data-easing="easeOutQuad"
                                         data-start="2500"
                                         data-end="4000"
                                         data-splitin="chars"
                                         data-elementdelay="0.1"
                                         data-endelementdelay="0.1"
                                         data-splitout="chars">Cooperação
                                    </div>

                                    <!-- LAYER NR. 3 -->
                                    <div class="tp-caption sfr stt xlarge_white"
                                         data-x="center"
                                         data-y="70"
                                         data-speed="200"
                                         data-easing="easeOutQuad"
                                         data-start="4000"
                                         data-end="6000"
                                         data-splitin="chars"
                                         data-elementdelay="0.1"
                                         data-endelementdelay="0.1"
                                         data-splitout="chars"
                                         data-endspeed="400">Sucessso
                                    </div>					

                                    <!-- LAYER NR. 4 -->
                                    <div class="tp-caption sft fadeout text-center large_white"
                                         data-x="center"
                                         data-y="70"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="6400"
                                         data-end="10000"><span class="logo-font">Todos <span class="text-default">Juntos</span></span> <br> Song Communit Factory
                                    </div>	

                                    <!-- LAYER NR. 5 -->
                                    <div class="tp-caption sfr fadeout"
                                         data-x="center"
                                         data-y="210"
                                         data-hoffset="-232"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="1000"
                                         data-end="5500"><span class="icon large circle"><i class="circle icon-lightbulb"></i></span>
                                    </div>

                                    <!-- LAYER NR. 6 -->
                                    <div class="tp-caption sfl fadeout"
                                         data-x="center"
                                         data-y="210"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="2500"
                                         data-end="5500"><span class="icon large circle"><i class="circle icon-arrows-ccw"></i></span>
                                    </div>

                                    <!-- LAYER NR. 7 -->
                                    <div class="tp-caption sfr fadeout"
                                         data-x="center"
                                         data-y="210"
                                         data-hoffset="232"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="4000"
                                         data-end="5500"><span class="icon large circle"><i class="circle icon-star-empty"></i></span>
                                    </div>

                                    <!-- LAYER NR. 8 -->
                                    <div class="tp-caption ZoomIn fadeout text-center tp-resizeme large_white"
                                         data-x="center"
                                         data-y="170"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="6400"
                                         data-end="10000"><div class="separator light"></div>
                                    </div>	

                                    <!-- LAYER NR. 9 -->
                                    <div class="tp-caption sft fadeout medium_white text-center"
                                         data-x="center"
                                         data-y="210"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="5800"
                                         data-end="10000"
                                         data-endspeed="600">
                                        Desenvolvimento de Musicas/Jingles/Vinhetas/ETC Livre 
                                        <br> Em comunidade
                                    </div>

                                    <!-- LAYER NR. 10 -->
                                    <div class="tp-caption fade fadeout"
                                         data-x="center"
                                         data-y="bottom"
                                         data-voffset="100"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="2000"
                                         data-end="10000"
                                         data-endspeed="200">
                                        <a href="#page-start" class="btn btn-lg moving smooth-scroll"><i class="icon-down-open-big"></i><i class="icon-down-open-big"></i><i class="icon-down-open-big"></i></a>
                                    </div>
                                </li>
                                <!-- slide 1 end -->

                                <!-- slide 2 start -->
                                <!-- ================ -->
                                <li data-transition="random" data-slotamount="7" data-masterspeed="500" data-saveperformance="on" data-title="Premium HTML5 Bootstrap Theme">

                                    <!-- main image -->
                                    <img src="<c:url value="/resources/images/slide2.jpg"/>" alt="slidebg2" data-bgposition="center top"  data-bgrepeat="no-repeat" data-bgfit="cover">

                                    <!-- Transparent Background -->
                                    <div class="tp-caption dark-translucent-bg"
                                         data-x="center"
                                         data-y="bottom"
                                         data-speed="500"
                                         data-easing="easeOutQuad"
                                         data-start="0">
                                    </div>

                                    <!-- LAYER NR. 1 -->
                                    <div class="tp-caption sfb fadeout large_white"
                                         data-x="left"
                                         data-y="70"
                                         data-speed="500"
                                         data-start="1000"
                                         data-easing="easeOutQuad"
                                         data-end="10000"><span class="logo-font">Encontre/Crie/Compartilhe</span> <br> Deixe-nos ajudar na criação de algo grande
                                    </div>	

                                    <!-- LAYER NR. 2 -->
                                    <div class="tp-caption sfb fadeout text-left medium_white"
                                         data-x="left"
                                         data-y="200" 
                                         data-speed="500"
                                         data-start="1300"
                                         data-easing="easeOutQuad"
                                         data-endspeed="600"><span class="icon default-bg circle small hidden-xs"><i class="icon-check"></i></span> 100% Gratuito
                                    </div>

                                    <!-- LAYER NR. 3 -->
                                    <div class="tp-caption sfb fadeout text-left medium_white"
                                         data-x="left"
                                         data-y="260" 
                                         data-speed="500"
                                         data-start="1600"
                                         data-easing="easeOutQuad"
                                         data-endspeed="600"><span class="icon default-bg circle small hidden-xs"><i class="icon-check"></i></span> Faça como quiser
                                    </div>

                                    <!-- LAYER NR. 4 -->
                                    <div class="tp-caption sfb fadeout text-left medium_white"
                                         data-x="left"
                                         data-y="320" 
                                         data-speed="500"
                                         data-start="1900"
                                         data-easing="easeOutQuad"
                                         data-endspeed="600"><span class="icon default-bg circle small hidden-xs"><i class="icon-check"></i></span> Compartilhe com quem quiser
                                    </div>

                                    <!-- LAYER NR. 5 -->
                                    <div class="tp-caption sfb fadeout text-left medium_white"
                                         data-x="left"
                                         data-y="380" 
                                         data-speed="500"
                                         data-start="2200"
                                         data-easing="easeOutQuad"
                                         data-endspeed="600"><span class="icon default-bg circle small hidden-xs"><i class="icon-check"></i></span> Vá mais longe junto
                                    </div>

                                    <!-- LAYER NR. 6 -->
                                    <div class="tp-caption sfb fadeout small_white"
                                         data-x="left"
                                         data-y="450"
                                         data-speed="500"
                                         data-start="2500"
                                         data-easing="easeOutQuad"
                                         data-endspeed="600"><a href="#" class="btn btn-default-transparent btn-lg btn-animated"><i class="fa icon-info-1"></i>Aprenda mais</a>
                                    </div>
                                </li>
                                <!-- slide 2 end -->
                            </ul>
                            <div class="tp-bannertimer"></div>
                        </div>
                    </div>
                    <!-- slider revolution end -->

                </div>
                <!-- slideshow end -->

            </div>
            <!-- banner end -->

            <div id="page-start"></div>

            <!-- section start -->
            <!-- ================ -->
            <section class="section default-bg clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="call-to-action text-center">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h1 class="title">JUNTOS PODEMOS MAIS</h1></div>
                                    <div class="col-sm-4">
                                        <br>
                                        <p><a href="#" class="btn btn-lg btn-gray-transparent btn-animated">Aprenda mais<i class="fa fa-arrow-right pl-20"></i></a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- section end -->

            <!-- section start -->
            <!-- ================ -->
            <section class="light-gray-bg pv-30 clearfix">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <h2 class="text-center">Como funciona?</h2>
                            <div class="separator"></div>
                            <p class="large text-center">                                
                                Por mais que a globalização e a revolução tecnologica tenham progredido muito nas ultimas decadas para barateamento e aprimorando da produção,
                                o mesmo parece não ser o caso do mercado fonográfico, embora seja um assunto controverso é quase consenço que hoje a qualidade musical é pior que a 
                                das decadas passadas e a tendencia parece ser um padrão ainda mais baixo para o futuro

                                Isso se deve em parte por algumas dificuldades encontradas por musicos e gravadoras, o primeiro muitas vezes não possuem o tempo abil disponivel ou mesmo 
                                a tecnica em todas as compentencias nescesserias
                                enquanto que o segundo constantemente precisa de um desenvolvimento rapido porem barato o que geralmente implica em pior qualidade

                                Com o objetivo de ajudar a reverter esse cenario o software em questao tenta baratear o desenvolvimento, melhorar a metodologia e o tempo 
                                de produção em trilhas/jingles/musicas etc. 

                                Para isso o seguinte software foi pensado inspirando-se em comunidades de desenvolvimento de software livre.
                                Tentando trazer e adaptar esse mundo de criação de software cooperativo para o mundo sonografico
                                .</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="pv-30 feature-box margin-clear text-center object-non-visible" data-animation-effect="fadeInDownSmall" data-effect-delay="100">
                                <span class="icon default-bg circle"><i class="fa  icon-thumbs-up"></i></span>
                                <h3>100% Free</h3>
                                <div class="separator clearfix"></div>
                                <p>Baseado no sistema de software livre blá bla bla.</p>
                                <a href="page-services.html">Leia Mais <i class="pl-5 fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="pv-30 feature-box margin-clear text-center object-non-visible" data-animation-effect="fadeInDownSmall" data-effect-delay="150">
                                <span class="icon default-bg circle"><i class="fa  icon-basket-1"></i></span>
                                <h3>Comercialize</h3>
                                <div class="separator clearfix"></div>
                                <p>O produto é seu faça o que quiser com ele.</p>
                                <a href="page-services.html">Leia Mais <i class="pl-5 fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="pv-30 feature-box margin-clear text-center object-non-visible" data-animation-effect="fadeInDownSmall" data-effect-delay="200">
                                <span class="icon default-bg circle"><i class="fa  icon-thumbs-up"></i></span>
                                <h3>100% Gratuito</h3>
                                <div class="separator clearfix"></div>
                                <p>Sim o serviço é online e é 100% gratuito.</p>
                                <a href="page-services.html">Leia Mais <i class="pl-5 fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- section end -->

            <!-- section start -->
            <!-- ================ -->
            <section class="pv-40 stats padding-bottom-clear dark-translucent-bg hovered background-img-6">
                <div class="clearfix">
                    <div class="col-md-3 col-xs-6 text-center">
                        <div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                            <span class="icon without-bg"><i class="fa fa-diamond"></i></span>
                            <h3><strong>Projetos</strong></h3>
                            <span class="counter" data-to="1525" data-speed="5000">0</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 text-center">
                        <div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                            <span class="icon without-bg"><i class="fa fa-users"></i></span>
                            <h3><strong>Clientes</strong></h3>
                            <span class="counter" data-to="1225" data-speed="5000">0</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 text-center">
                        <div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                            <span class="icon without-bg"><i class="fa fa-cloud-download"></i></span>
                            <h3><strong>Downloads</strong></h3>
                            <span class="counter" data-to="12235" data-speed="5000">0</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-xs-6 text-center">
                        <div class="feature-box object-non-visible" data-animation-effect="fadeIn" data-effect-delay="300">
                            <span class="icon without-bg"><i class="fa fa-share"></i></span>
                            <h3><strong>Compartilhamentos</strong></h3>
                            <span class="counter" data-to="15002" data-speed="5000">0</span>
                        </div>
                    </div>
                </div>
            </section>
            <!-- section end -->

            <!-- footer top start -->
            <!-- ================ -->
            <div class="dark-bg footer-top animated-text">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="call-to-action text-center">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <h2>Junte forcas</h2>
                                        <h2>Não perca mais tempo</h2>
                                    </div>
                                    <div class="col-sm-4">
                                        <!--                                        <p class="mt-10"><a href="#" class="btn btn-animated btn-lg btn-gray-transparent">Purchase<i class="fa fa-cart-arrow-down pl-20"></i></a></p>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- footer top end -->
            <!-- footer start (Add "dark" class to #footer in order to enable dark footer) -->
            <!-- ================ -->
            <footer id="footer" class="clearfix dark">

                <!-- .footer start -->
                <!-- ================ -->
                <div class="footer">
                    <div class="container">
                        <div class="footer-inner">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="footer-content">                                        
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus illo vel dolorum soluta consectetur doloribus sit. Delectus non tenetur odit dicta vitae debitis suscipit doloribus. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed dolore fugit vitae quia dicta inventore reiciendis. Ipsa, aut voluptas quaerat.</p>
                                        <ul class="list-inline mb-20">
                                            <li><i class="text-default fa fa-map-marker pr-5"></i> One infinity loop, 54100</li>
                                            <li><i class="text-default fa fa-phone pl-10 pr-5"></i> +00 1234567890</li>
                                            <li><a href="mailto:info@theproject.com" class="link-dark"><i class="text-default fa fa-envelope-o pl-10 pr-5"></i> info@theproject.com</a></li>
                                        </ul>
                                        <div class="separator-2"></div>
                                        <ul class="social-links circle margin-clear animated-effect-1">
                                            <li class="facebook"><a target="_blank" href="http://www.facebook.com"><i class="fa fa-facebook"></i></a></li>
                                            <li class="twitter"><a target="_blank" href="http://www.twitter.com"><i class="fa fa-twitter"></i></a></li>
                                            <li class="googleplus"><a target="_blank" href="http://plus.google.com"><i class="fa fa-google-plus"></i></a></li>
                                            <li class="linkedin"><a target="_blank" href="http://www.linkedin.com"><i class="fa fa-linkedin"></i></a></li>
                                            <li class="xing"><a target="_blank" href="http://www.xing.com"><i class="fa fa-xing"></i></a></li>
                                            <li class="skype"><a target="_blank" href="http://www.skype.com"><i class="fa fa-skype"></i></a></li>
                                            <li class="youtube"><a target="_blank" href="https://www.youtube.com"><i class="fa fa-youtube"></i></a></li>
                                            <li class="dribbble"><a target="_blank" href="https://dribbble.com/"><i class="fa fa-dribbble"></i></a></li>
                                            <li class="pinterest"><a target="_blank" href="http://www.pinterest.com"><i class="fa fa-pinterest"></i></a></li>
                                            <li class="flickr"><a target="_blank" href="http://www.flickr.com"><i class="fa fa-flickr"></i></a></li>
                                            <li class="instagram"><a target="_blank" href="http://www.instagram.com"><i class="fa fa-instagram"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="footer-content">
                                        <h2 class="title">Contact Us</h2>
                                        <div class="alert alert-success hidden" id="MessageSent2">
                                            We have received your message, we will contact you very soon.
                                        </div>
                                        <div class="alert alert-danger hidden" id="MessageNotSent2">
                                            Oops! Something went wrong please refresh the page and try again.
                                        </div>
                                        <form role="form" id="footer-form" class="margin-clear">
                                            <div class="form-group has-feedback mb-10">
                                                <label class="sr-only" for="name2">Name</label>
                                                <input type="text" class="form-control" id="name2" placeholder="Name" name="name2">
                                                <i class="fa fa-user form-control-feedback"></i>
                                            </div>
                                            <div class="form-group has-feedback mb-10">
                                                <label class="sr-only" for="email2">Email address</label>
                                                <input type="email" class="form-control" id="email2" placeholder="Enter email" name="email2">
                                                <i class="fa fa-envelope form-control-feedback"></i>
                                            </div>
                                            <div class="form-group has-feedback mb-10">
                                                <label class="sr-only" for="message2">Message</label>
                                                <textarea class="form-control" rows="4" id="message2" placeholder="Message" name="message2"></textarea>
                                                <i class="fa fa-pencil form-control-feedback"></i>
                                            </div>
                                            <input type="submit" value="Send" class="margin-clear submit-button btn btn-default post-submit-hidden">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .footer end -->

                <!-- .subfooter start -->
                <!-- ================ -->
                <div class="subfooter">
                    <div class="container">
                        <div class="subfooter-inner">
                            <div class="row">
                                <div class="col-md-12">
                                    <p class="text-center">Copyright 2017 by <a target="_blank" href="diegoandrecolli.com">Diego Colli</a>. All Rights Reserved</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- .subfooter end -->

            </footer>
            <!-- footer end -->

        </div>
        <!-- page-wrapper end -->
        <c:import url="/WEB-INF/views/shared/common-scripts.jsp" />
    </body>
</html>
