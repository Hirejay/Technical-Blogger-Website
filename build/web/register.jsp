<%-- 
    Document   : register
    Created on : 04-Jun-2024, 12:07:24 pm
    Author     : Jay Hire
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="simple_navbar.jsp" %>
        <!-- login.jsp (HTML code for the login form) -->

        <main class="align-items-center primary-color banner-bg p-4" style="height: 900px;  ">
            <div class="container-fluid " >

                <div class="row  " >
                    <div class="col-md-6 offset-md-3">




                        <div class="card">
                            <div class="card-header">
                                <h3 class="text-center">Registration Form</h3>
                            </div>
                            <div class="card-body">
                                <form id="reg-form" action="RegisterServlet" method="post">
                                    <!-- Name -->
                                    <div class="form-group">
                                        <label for="name">Name</label>
                                        <input type="text" class="form-control" id="name" name="name" required placeholder="Enter your name">
                                    </div>
                                    <br>

                                    <!-- Email -->
                                    <div class="form-group">
                                        <label for="email">Email address</label>
                                        <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                                    </div>
                                    <br>

                                    <!-- Password -->
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required  placeholder="Enter your password">
                                    </div>

                                    <br>
                                    <!-- Gender -->
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" name="gender" id="male" value="male" required >
                                            <label class="form-check-label" for="male">Male</label>
                                        </div>
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" name="gender" id="female" value="female" required >
                                            <label class="form-check-label"  for="female">Female</label>
                                        </div>
                                    </div>
                                    <br>

                                    <!-- About -->
                                    <div class="form-group">
                                        <label for="about">About</label>
                                        <textarea class="form-control" id="about" rows="3" name="about" placeholder="Tell us about yourself"></textarea>
                                    </div>
                                    <br>
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="terms" name="terms"  >
                                        <label class="form-check-label" for="exampleCheck1">Accept terms and conditions</label>
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <h4>Please wait..</h4>
                                    </div>
                                    <br>


                                    <!-- Submit Button -->
                                    <button id="sumbimt-btn" type="submit" class="btn primary-color  text-white">Register</button>
                                </form>
                            </div>
                        </div>




                    </div>
                </div>
            </div>

        </main>

      

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........");

                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();



                    let form = new FormData(this);

                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);

                            $("#sumbimt-btn").show();
                            $("#loader").hide();

                            if (data.trim() === 'done')
                            {

                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            } else
                            {

                                swal(data);
                            }

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");

                        },
                        processData: false,
                        contentType: false

                    });



                });


            });



        </script>
    </body>
</html>
