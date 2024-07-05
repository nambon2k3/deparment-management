<!DOCTYPE html>
<html lang="en" style="height: 100vh">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Thank You</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            #monica-content-root{
                display: none
            }
        </style>
    </head>
    <body style="height: 100vh" style="display: flex" class="justify-content-between flex-column">
        <jsp:include page="header.jsp"/>
        <section class="banner">
            <div class="container" style="color: white; background-color: rgba(0, 0, 0, .5); padding: 80px 0">
                <h1>Welcome to Our Website</h1>
                <p class="lead">Explore our rooms and services.</p>
                <!-- Add more content or actions as needed -->
            </div>
        </section>
        <div class="container-fluid mt-5">
            <div class="row col-lg-9 m-auto">
                <nav class="col-md-12 d-flex justify-content-center align-items-center">
                    <div class="col-6 mr-5 d-flex flex-column justify-content-center align-items-center">
                        <img src="img/correct.png" alt="alt" style="width: 50px; height: 50px"/>
                        <h1>THANK YOU!</h1>
                        <p class="mb-5">Your order was successfully sent.</p>
                        <a href="home" class="btn btn-success">BACK TO HOME</a>
                    </div>
                </nav>
            </div>
        </div>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
