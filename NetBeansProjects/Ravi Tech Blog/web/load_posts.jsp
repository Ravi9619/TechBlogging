<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Load Posts</title>
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="row">
            <%
                
                User uu = (User)session.getAttribute("currentUser");
                Thread.sleep(1000);

                PostDao d = new PostDao(ConnectionProvider.getConnection());
                int cid = Integer.parseInt(request.getParameter("cid"));
                List<Post> posts = null;
                if (cid == 0) {
                    posts = d.getAllPosts();
                } else {
                    posts = d.getPostByCatId(cid);
                }
                if (posts.size() == 0) {
                    out.println("<h3>No Post found</h3>");
                    return;
                }
                for (Post p : posts) {

            %>


            <div class="col-md-6 mt-2">
                <div class="card">
                    <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="">
                    <div class="card-body">
                        <b><%= p.getpTitle()%></b>  
                        <p><%= p.getpContent()%></p>  

                    </div>
                    <div class="card-footer primary-background text-center">
                        
                        <%
                            LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                        %>
                        
                        <a onclick="doLike(<%= p.getPid() %>,<%= uu.getId() %>)" href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLikeOnPost(p.getPid())  %></span> Like</a>

                        <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
                        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span>Comment</a>
                    </div>
                </div>
            </div>

            <%
                }
            %>
        </div>
    </body>
</html>
