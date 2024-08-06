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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style3.css">


    </head>
    <body> 
        <form action="signup" method="post">
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                        <div class="card bg-dark text-white" style="border-radius: 1rem;">
                            <div class="card-body p-5 text-center">

                                <div class="mb-md-5 mt-md-4 pb-5">

                                    <h2 class="fw-bold mb-2 text-uppercase">Registration</h2>
                                    <br>

                                 

                        <div data-mdb-input-init class="form-outline form-white mb-4">
                            <input type="email" class="form-control form-control-lg" placeholder="Enter your email" name="cr_email" required value="${requestScope.user_data.email}">
                            <i class="uil uil-envelope icon"></i>
                        </div>

                        <div data-mdb-input-init class="form-outline form-white mb-4">                    
                            <input type="text" class="form-control form-control-lg" placeholder="Enter user name" name="cr_user_name" required value="${requestScope.user_data.username}">
                            <i class="uil uil-user icon"></i>
                        </div>
                        <div data-mdb-input-init class="form-outline form-white mb-4">
                            <input type="password" class="form-control form-control-lg" name="cr_password" placeholder="Create a password" required value="${requestScope.user_data.password}">
                            <i class="uil uil-lock icon"></i>
                        </div>
                        <div data-mdb-input-init class="form-outline form-white mb-4">
                            <input type="password" class="form-control form-control-lg" name="cr_c_password" placeholder="Confirm a password" required value="${requestScope.c_password}">
                            <i class="uil uil-lock icon"></i>
                            <i class="uil uil-eye-slash showHidePw"></i>
                        </div>

                        <div class="checkbox-text">
                            <div class="checkbox-content">
                                <input type="checkbox" id="termCon">
                                <label for="termCon" class="text">I accepted all terms and conditions</label>
                            </div>
                        </div>

                        <div class="btn btn-outline-light btn-lg px-5">
                            <input type="submit" value="Signup">
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
                    </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>  
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
