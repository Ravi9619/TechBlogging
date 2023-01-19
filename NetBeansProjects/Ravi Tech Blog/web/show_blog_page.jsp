<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>

<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao d = new PostDao(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(0 0, 100% 0, 100% 30%, 100% 70%, 100% 88%, 50% 95%, 0 100%, 0%
                    30%);
            }
            .post-title {
                font-weight: 100;
                font-size: 30px;
            }
            .post-content {
                font-weight: 100;
                font-size: 25px;
            }
            .post-date {
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info {
                font-size: 20px;
            }
            .row-user {
                border: 1px solid #e2e2e2;
                padding-top: 10px;
            }
            body {
                background: url(img/bg.webp);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    <div id="fb-root"></div>
    <div id="fb-root"></div>
</head>
<body>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v15.0" nonce="c8EmGGVZ"></script>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.jsp"><span
                    class="fa fa-asterisk
                    "></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active"
                           aria-current="page" href="profile.jsp"><span
                                class="fa fa-bell-o"></span>Learn Skills with Ravi</a></li>
                    <li class="nav-item dropdown"><a
                            class="nav-link dropdown-toggle" href="#" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false"><span class="fa fa-check-square-o
                                                                              "></span> Categories </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">UPSC</a></li>
                            <li><a class="dropdown-item" href="#">Programming</a></li>
                            <li><a class="dropdown-item" href="#">Finance Skills</a></li>

                        </ul></li>
                    <li class="nav-item"><a class="nav-link" href="#"><span class="fa fa-address-book-o
                                                                            "></span> Contact</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do Post</a></li>
                </ul>

                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle "></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav> 

    <!-- End of Navbar -->

    <!--main content of body-->

    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card-header primary-background text-white p-1">
                    <h4 class="post-title"><%= p.getpTitle()%></h4>
                </div>

                <div class="card-body">
                    <img class="card-img-top mt-2" src="blog_pics/<%= p.getpPic()%>" alt="">

                    <div class="row mt-3 row-user">
                        <div class="col-md-8">
                            <% UserDao ud = new UserDao(ConnectionProvider.getConnection());%>
                            <p class="post-user-info"><a style="text-decoration: none;" href="#!"><%= ud.getUserUsertId(p.getUserId()).getName()%></a> has posted: </p>
                        </div>
                        <div class="col-md-4">
                            <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                        </div>
                    </div>

                    <p class="post-content"><%= p.getpContent()%></p>
                    <br>
                    <br>

                    <div class="post-code">
                        <pre><%= p.getpCode()%></pre>
                    </div>
                </div>

                <div class="card-footer primary-background p-2">


                    <%
                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                    %>

                    <a href="#!" class="btn btn-outline-light btn-sm" onclick="doLike(<%= p.getPid()%>,<%= user.getId()%>)"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())%></span></a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span></span></a>
                </div>
                <div class="card-footer">
                    <div class="fb-comments" data-href="http://localhost:8080/Ravi_Tech_Blog/show_blog_page.jsp?post_id=<%= p.getPid()%>" data-width="" data-numposts="5"></div>
                </div>

            </div>
        </div>
    </div>

    <!--end of main content of body-->

    <!-- Modal -->
    <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header primary-background text-white text-center">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"><%= user.getName()%></h1>
                    </div>

                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID:</th>
                                    <td><%= user.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email: </th>
                                    <td><%= user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td colspan="2"><%= user.getGender()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Status</th>
                                    <td colspan="2"><%= user.getAbout()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Registered on:</th>
                                    <td colspan="2"><%= user.getDateTime().toString()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- Profile Edit -->
                    <div id="profile-edit" style="display: none;">
                        <h3 class="mt-2 text-center">Please Edit Carefully</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>ID: </td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Email: </td>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Name: </td>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Password: </td>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                                </tr>
                                <tr>
                                    <td>Gender: </td>
                                    <td><%=user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <td>About: </td>
                                    <td>
                                        <textarea class="form-control" name="about" rows="5">
                                            <%= user.getAbout()%>
                                        </textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td>New Profile: </td>
                                    <td><input type="file" class="form-control" name="image" value="<%= user.getEmail()%>"></td>
                                </tr>
                            </table>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <!--End of Profile Modal-->
    <!-- Add Post Modal -->

    <!-- Modal -->
    <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Provide Post Details</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="AddPostServlet" method="post" id="add-post-form">
                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled>----Select Category----</option>

                                <%
                                    PostDao postd = new PostDao(ConnectionProvider.getConnection());

                                    ArrayList<Category> list = postd.getAllCategories();

                                    for (Category c : list) {


                                %>

                                <option value="<%= c.getCid()%>"><%= c.getCname()%></option>

                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <br>
                        <div class="form-group">
                            <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                        </div>
                        <br>
                        <div class="form-group">
                            <textarea name="pContent" class="form-control" style="height:300px;" placeholder="Enter your content"></textarea>
                        </div>
                        <br>
                        <div class="form-group">
                            <textarea name="pCode" class="form-control" style="height:300px;" placeholder="Enter your program"></textarea>
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Select your pic</label><br>
                            <input name="pic" type="file" />
                        </div>
                        <br><!-- comment -->
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-primary">Post</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- End Post Modal -->

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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

    <script src="js/myjs.js" type="text/javascript"></script>

    <script>
                        $(document).ready(function () {
                            let editStatus = false;

                            $('#edit-profile-btn').click(function () {

                                if (editStatus == false)
                                {
                                    $("#profile-details").hide()

                                    $("#profile-edit").show();
                                    editStatus = true;
                                    $(this).text("Back")
                                } else {
                                    $("#profile-details").show()

                                    $("#profile-edit").hide()
                                    editStatus = false;
                                    $(this).text("Edit")
                                }
                            })
                        })
    </script>

    <!-- Add Post Js -->
    <script>

        $(document).ready(function () {
            $('#add-post-form').on("submit", function (event) {
                //This part is called when form is submitted

                event.preventDefault();

                let form = new FormData(this);

                console.log("submitted");
                //requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        //success...
                        console.log(data);

                        if (data.trim() === 'done')
                        {
                            swal("Good Job", "saved successfully", "success");
                        } else {
                            swal("Error!", "Something went wrong", "error");
                        }

                    },
                    error: function (data, textStatus, jqXHR) {
                        //error
                        swal("Error!", "Something went wrong", "error");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>
</body>
</html>
