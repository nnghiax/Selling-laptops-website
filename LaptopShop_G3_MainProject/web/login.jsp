<%-- 
    Document   : login
    Created on : 28 thg 5, 2024, 16:02:44
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style3.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">


    </head>
    <body>
        <form action="login" method="post">
            <section class="vh-100 gradient-custom">
                <div class="container py-5 h-100">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                            <div class="card bg-dark text-white" style="border-radius: 1rem;">
                                <div class="card-body p-5 text-center">

                                    <div class="mb-md-5 mt-md-4 pb-5">

                                        <h2 class="fw-bold mb-2 text-uppercase">Login</h2>
                                        <br>

                                        <div data-mdb-input-init class="form-outline form-white mb-4"> 
                                            <label class="form-label" for="typeUsername">Username</label>

                                            <input type="text" id="typeUsername" name="user_name" class="form-control form-control-lg" placeholder="Enter user name" />
                                        </div>

                                        <div data-mdb-input-init class="form-outline form-white mb-4">  
                                            <label class="form-label" for="typePasswordX">Password</label>

                                            <input type="password" id="typePasswordX" name="user_password" class="form-control form-control-lg" placeholder="Enter your passwords" />
                                        </div>

                                        <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="forgot">Forgot password?</a></p>

                                        <!--                                        <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>-->
                                        <div data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-light btn-lg px-5">
                                            <input type="submit" value="Login">

                                        </div>
                                        <c:if test="${requestScope.invalid!=null}">
                                            <div class="alert alert-warning h-100">
                                                <strong>Warning!</strong> ${requestScope.invalid}
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.incorrect!=null}">
                                            <div class="alert alert-warning h-100">
                                                <strong>Warning!</strong> ${requestScope.incorrect}
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.done!=null}">
                                            <div class="alert alert-success h-100">
                                                <strong>done!</strong> ${requestScope.done}
                                            </div>
                                        </c:if>
                                        <c:if test="${requestScope.mess2!=null}">
                                            <div class="alert alert-warning h-100">
                                                <strong>warning!</strong> ${requestScope.mess2}
                                            </div>
                                        </c:if>
                                        <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                            <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                            <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
                                        </div>

                                    </div>

                                    <div>
                                        <p class="mb-0">Don't have an account? <a href="signup" class="text-white-50 fw-bold">Sign Up</a>
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>  
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
