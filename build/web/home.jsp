<%-- 
    Document   : profile
    Created on : 04-Jun-2024, 5:38:06 pm
    Author     : Jay Hire
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Categories"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Postdao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User" %>
<%@page errorPage="errorpage.jsp"%>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("login.jsp");

    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Post Home Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>



    </head>
    <body>

        <nav class="navbar navbar-expand-lg bg-body-tertiary primary-color  ">
            <div class="container-fluid ">
                <a class="navbar-brand " href="#"><i class="bi bi-card-checklist icon-margin"></i>TechBlog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link "  href="#"><i class="bi bi-house icon-margin"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link "  href="profile.jsp"><i class="bi bi-person-check icon-margin"></i>Profile</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#post-model"><i class="bi bi-sticky icon-margin"></i></i>Do Post</a>
                        </li>



                    </ul>
                    <ul class="navbar-nav me-right">
                        <li class="nav-item">
                            <a class="nav-link" href="#!"  data-bs-toggle="modal" data-bs-target="#profile-model"><i class="bi bi-person-circle icon-margin"></i><%= user.getUname()%></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><i class="bi bi-box-arrow-right icon-margin"></i>LogOut</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
        <!--                        message after profile update-->


        <!--        end of message after profile update's-->
        <div class="card primary-color banner-bg  " style="height: 350px; " >
            <div class="container">
                <div class="card-body text-white">
                    <h5 class="card-title display-3">Welcome to TechBlog</h5>
                    <p class="card-text ">rogramming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language. Languages usually provide features such as a type system, variables and mechanisms for error handling. An implementation of a programming language in the form of a compiler or interpreter allows programs to be executed, either directly or by producing what's known in programming as an executable.</p>


                </div>
            </div>
        </div>

        <div class="container">
            <%@include file="load_categories.jsp" %>
        </div>
















        <!--        model start                -->


        <!-- Modal -->
        <div class="modal fade" id="profile-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-color ">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">TechBlog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pic/<%= user.getUprofile()%>" style="max-width: 150px; border-radius: 50%" class="m-2"/>

                            <!--                            details-->
                            <div id="profile-detail">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">Id</th>
                                            <td><%= user.getUid()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Name</th>

                                            <td><%= user.getUname()%></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender</th>
                                            <td><%= user.getUgender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Date</th>

                                            <td><%= user.getUdate()%></td>
                                        </tr>

                                        <tr>
                                            <th scope="row">Email</th>
                                            <td><%= user.getUemail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Password</th>

                                            <td><%= user.getUpassword()%></td>
                                        </tr>



                                        <tr>
                                            <th scope="row">About</th>

                                            <td><%= user.getUabout()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="profile-edit" style="display: none;">
                                <h5>Edit Profile</h5><!-- comment -->
                                <form id="edit-form-id" action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">

                                        <tbody>
                                            <tr>
                                                <th scope="row">Id</th>
                                                <td><%= user.getUid()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Name</th>

                                                <td><%= user.getUname()%></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Gender</th>
                                                <td><%= user.getUgender()%></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Date</th>

                                                <td><%= user.getUdate()%></td>
                                            </tr>

                                            <tr>
                                                <th scope="row">Email</th>
                                                <td><input id="email" type="email" class="form-control" name="email" value="<%= user.getUemail()%>"/></td>

                                            </tr>
                                            <tr>
                                                <th scope="row">Password</th>

                                                <td><input id="password" type="password" class="form-control" name="password" value="<%= user.getUpassword()%>"/></td>
                                            </tr>


                                            <tr>
                                                <th scope="row">About</th>

                                                <td><textarea class="form-control" id="about" rows="3" name="about" value="<%= user.getUprofile()%>" ><%= user.getUabout()%></textarea></td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Profile</th>

                                                <td><input type="file" name="profile" id="profile" class="form-control"/> </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                    <button id="edit-save-btn" type="submit" class="btn primary-color  text-white">Save</button>


                                </form>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn primary-color  text-white">Edit</button>
                    </div>
                </div>
            </div>
        </div>


        <!--model end-->
        <!--        start post model-->
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="post-model" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-color">
                        <h1 class="modal-title fs-5 " id="exampleModalLabel">Create Post</h1>
                        <button type="button" class="btn-close reset-form-manual " data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="post-form" action="AddPostServlet" method="post" enctype="multipart/form-data" >
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---select Categories---</option>
                                    <%
                                        Postdao pd = new Postdao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> list = pd.getAllCategories();
                                        for (Categories c : list) {

                                    %>

                                    <option value="<%= c.getCid()%>"><%=  c.getCname()%></option>

                                    <%
                                        }

                                    %>
                                </select>
                            </div><br>
                            <div class="form-group">
                                <input id="ptitle" type="text" class="form-control" name="ptitle" placeholder="Enter Post Title"/>
                            </div><br>
                            <div class="form-group">
                                <textarea class="form-control" id="pcontent" rows="3" name="pcontent" placeholder="Enter Post Content" ></textarea>
                            </div><br>
                            <div class="form-group">
                                <textarea class="form-control" id="pcode" rows="3" name="pcode" placeholder="Enter Post Code" ></textarea>
                            </div><br>
                            <div class="form-group">
                                <label for="ppic">Select Post Picture</label>
                                <input type="file" name="ppic" id="ppic" class="form-control" /> 
                            </div><br>
                            <div class="container text-center">
                                <button id="submit-btn" type="submit" class="btn text-white primary-color ">Post</button>
                                <button id="reset-btn" type="reset" class="btn text-white primary-color ">reset</button>
                            </div><!-- comment -->
                        </form>
                    </div>

                </div>
            </div>
        </div>


        <!--        end post model-->






        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>



        <script >
            $(document).ready(function () {
                let edittoggle = false;
                $("#edit-profile-btn").click(function () {

                    if (edittoggle === false) {
                        $("#profile-detail").hide();
                        $("#profile-edit").show();
                        $(this).text("Back");
                        edittoggle = true;

                    } else {
                        $("#profile-detail").show();
                        $("#profile-edit").hide();
                        $(this).text("Edit");
                        edittoggle = false;
                    }
                });

                $("#edit-form-id").on("submit", function (event) {
                    event.preventDefault();
                    console.log("you have Editted");
                    let form = new FormData(this);
                    $.ajax({
                        url: "EditServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Updated profile!", "Changes Saved Successfully", "success").then(() => {
                                    location.reload(); // Reload the page after displaying the success message
                                });
                            } else {
                                swal("Error!", "Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("Error!", "Something went wrong!", "error");

                        },
                        processData: false,
                        contentType: false


                    });



                });


            });
        </script>

        <!--        add new post-->
        <script>
            $(document).ready(function () {

                $(".reset-form-manual").on("click", function () {
                    $("#reset-btn").click();
                });



                $("#post-form").on("submit", function (event) {
                    event.preventDefault();
                    console.log("you have submitted");
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === 'done') {
                                swal("Good job!", "Post Saved Successfully", "success").then(() => {
                                    location.reload(); // Reload the page after displaying the success message
                                });
                            } else {
                                swal("Error!", "Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {

                            swal("Error!", "Something went wrong!", "error");

                        },
                        processData: false,
                        contentType: false


                    });



                });

            });

        </script>


        <!--end loadingpost using ajax-->

    </body>
</html>
