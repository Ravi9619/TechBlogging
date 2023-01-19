

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
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
        <!---Navbar -->
        <%@include file="navbar.jsp"%>


        <main class="primary-background p-5 banner-background">
            <div class="container">
                <div class="col-md-6 offset-3" style="padding-bottom: 70px;">

                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span> <br> Register
                            here
                        </div>
                        <div class="card-body">
                            <form action="RegisterServlet" method="post" id="reg-form">
                                <div class="mb-3">
                                    <label for="user_name" class="form-label">User Name</label> <input
                                        type="text" name="user_name" class="form-control"
                                        id="user_name" aria-describedby="emailHelp"
                                        placeholder="Enter Name">
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputEmail1" class="form-label">Email
                                        address</label> <input type="email" class="form-control"
                                                           name="user_email" id="exampleInputEmail1"
                                                           aria-describedby="emailHelp">
                                    <div id="emailHelp" class="form-text">We'll never share
                                        your email with anyone else.</div>
                                </div>


                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Password</label>
                                    <input type="password" class="form-control" name="user_password"
                                           id="exampleInputPassword1">
                                </div>

                                <div class="mb-3">
                                    <label for="exampleInputPassword1" class="form-label">Select
                                        Gender</label> <br> 
                                    <input type="radio" id="gender" name="gender"
                                           value="male">Male
                                    <input type="radio" id="gender"
                                           name="gender" value="female">Female
                                </div>

                                <div class="mb-3">
                                    <textarea class="form-control" rows="5" cols="30" name="about"
                                              id="about" placeholder="Enter something about your self"></textarea>
                                </div>

                                <div class="mb-3 form-check">
                                    <input name="check" type="checkbox" class="form-check-input"
                                           id="exampleCheck1"> <label class="form-check-label"
                                           for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display:none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait...</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
        </main>

        <script src="https://code.jquery.com/jquery-3.6.3.js"
                integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $('#reg-form').on('submit', function (event) {
                event.preventDefault();

                let form = new FormData(this);

                $('#submit-btn').hide();
                $('#loader').show();

                $.ajax({
                    url: "RegisterServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);

                        $('#submit-btn').show();
                        $('#loader').hide();

                        if (data.trim() === 'done')
                        {
                            swal("Registered Successfully redirecting to login page.")
                                    .then((value) => {
                                        window.location = "login.jsp";
                                    });
                        } else {
                            swal(data);
                        }
                    },
                    error: function (data, textStatus, jqXHR) {
                        console.log(jqXHR);

                        $('#submit-btn').show();
                        $('#loader').hide();
                        
                    },
                    processData: false,
                    contentType: false
                });
            });
        </script>
    </body>
</html>
