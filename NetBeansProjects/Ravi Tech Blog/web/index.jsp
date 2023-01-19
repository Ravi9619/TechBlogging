<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            
           .banner-background {
            clip-path: polygon(0 0, 100% 0, 100% 88%, 74% 100%, 49% 86%, 24% 100%, 0 89%, 0% 30%);
	}
        </style>
    </head>
    <body>
        <!--- navbar -->
        <%@include file="navbar.jsp"%>


        <!-- Banner -->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white banner-background">
                <div class="container" style="padding-bottom: 60px">
                    <h1 class="display-3">Welcome to Tech</h1>
                    <p>Welcome to technical blog, world of technology</p>
                    <p>It has survived not only five centuries, but also the leap
                        into electronic typesetting, remaining essentially unchanged</p>

                    <button class="btn btn-outline-light btn-lg">
                        <span class="fa fa-user-plus
                              "></span> Start
                    </button>
                    <a href="login.jsp" class="btn btn-outline-light btn-lg">
                        <span class="fa fa-user-circle fa-spin"></span> Login
                    </a>
                </div>
            </div>
        </div>

        <!-- cards -->
        <div class="container">
            <div class="row mt-5 mt-5">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <p class="card-text">Some quick example text to build on the
                                card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-background">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <script src="https://code.jquery.com/jquery-3.6.3.min.js"
                integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
            integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
