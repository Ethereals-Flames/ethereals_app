<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:url var="static_rs" value="../assets" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">

    <!-- Libs CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/fonts/feather/feather.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/highlight/styles/vs2015.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/quill/dist/quill.core.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/select2/dist/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/flatpickr/dist/flatpickr.min.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/theme.min.css">

    <title>Dashkit</title>
  </head>
  <body class="d-flex align-items-center bg-white border-top-2 border-primary">

    <!-- CONTENT
    ================================================== -->
    <div class="container">
      <div class="row align-items-center">
        <div class="col-12 col-md-6 offset-xl-2 offset-md-1 order-md-2 mb-5 mb-md-0">

          <!-- Image -->
          <div class="text-center">
            <img src="${pageContext.request.contextPath}/assets/img/illustrations/happiness.svg" alt="..." class="img-fluid">
          </div>

        </div>
        <div class="col-12 col-md-5 col-xl-4 order-md-1 my-5">
          
          <!-- Heading -->
          <h1 class="display-4 text-center mb-3">
            Sign up
          </h1>
          
          <!-- Subheading -->
          <p class="text-muted text-center mb-5">
            Free access to our dashboard.
          </p>

          <!-- Form -->
          <form action="signup_req" method="POST" modelAttribute="new_user" id="newForm" >

            <!-- Email address -->
            <div class="form-group">

              <!-- Label -->
              <label>
                Email Address
              </label>

              <!-- Input -->
              <input id="email" name="email" type="email" class="form-control" placeholder="name@address.com" required="required"/>

            </div>

            <!-- Password -->
            <div class="form-group">

              <!-- Label -->
              <label>
                Password
              </label>

              <!-- Input group -->
              <div class="input-group input-group-merge">

                <!-- Input -->
                <input id="password" name="password" type="password" class="form-control form-control-appended" placeholder="Enter your password" required="required"/>

                <!-- Icon -->
                <div class="input-group-append">
                  <span class="input-group-text">
                    <i class="fe fe-eye"></i>
                  </span>
                </div>

              </div>
            </div>

            <!-- Submit -->
            <button class="btn btn-lg btn-block btn-primary mb-3">
              Sign up
            </button>

            <!-- Link -->
            <div class="text-center">
              <small class="text-muted text-center">
                Already have an account? <a href="sign-in-illustration.html">Log in</a>.
              </small>
            </div>
		</form>

        </div>
      </div> <!-- / .row -->
    </div> <!-- / .container -->

    <!-- JAVASCRIPT
    ================================================== -->
    <!-- Libs JS -->
    <script src="${pageContext.request.contextPath}/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/chart.js/dist/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/chart.js/Chart.extension.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/highlight/highlight.pack.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/flatpickr/dist/flatpickr.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/jquery-mask-plugin/dist/jquery.mask.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/list.js/dist/list.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/quill/dist/quill.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/dropzone/dist/min/dropzone.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/select2/dist/js/select2.min.js"></script>

    <!-- Theme JS -->
    <script src="${pageContext.request.contextPath}/assets/js/theme.min.js"></script>

  </body>
</html>