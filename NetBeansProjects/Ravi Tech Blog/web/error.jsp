<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>
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
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img alt="Error" src="img/error.png" class="img-fluid">
            <h1 class="display-3">Sorry! Something Went Wrong...</h1>
            <%= exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-2">Home</a>
        </div>
    </body>
</html>
