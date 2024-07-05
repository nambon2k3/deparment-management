<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Room Detail</title>
        <!-- Bootstrap CSS -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <!-- Custom styles -->
        <style>
            .thumbnail-images img {
                cursor: pointer;
                max-height: 100px;
            }
            .main-image {
                width: 100%;
                max-height: 400px;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <!-- Main Content Section -->
        <div class="container mt-4">
            <h1 class="my-4">${room.roomNumber}</h1>
            <div class="row">
                <div class="col-md-8">
                    <div class="main-image-container">
                        <img id="mainImage" class="main-image" src="${roomImages[0].imageURL}" alt="Main Image">
                    </div>
                    <div class="thumbnail-images mt-3">
                        <c:forEach var="image" items="${roomImages}">
                            <img src="${image.imageURL}" class="img-thumbnail" alt="Room Image">
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-4">
                    <h2>${room.roomNumber}</h2>
                    <p>${room.description}</p>
                    <h4>Price: $${room.price}</h4>
                    <h5>Services:</h5>
                    <ul>
                        <c:forEach var="service" items="${roomServices}">
                            <li>${service.serviceName} - $${service.price}</li>
                            </c:forEach>
                    </ul>
                </div>
            </div>

            <!-- Booking Form -->
            <div class="mt-5">
                <h3>Book this Room</h3>
                <form action="booking" method="post">
                     <input type="hidden" name="roomID" value="${room.getRoomID()}">
                    <input type="hidden" name="roomID" value="${room.getRoomID()}">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" class="form-control" value="${user.getFullName()}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" class="form-control" value="${user.getEmail()}" readonly>
                    </div>
                    <div class="form-group">
                    <label for="startDate">Start Date</label>
                    <input type="date" id="startDate" name="startDate" class="form-control" required>
                </div>
                    <button type="submit" class="btn btn-primary">Book Now</button>
                </form>
            </div>        
        </div>

        <!-- Bootstrap JS (Optional for some components) -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-5zvFH0C2F/pDnlzn/+OPOZsOL28NY2be6t/jrA6WWpSj8bc46l07Fg0S5oJPr5fZ" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+YT3EIQCE4NCptea7G4lB9Bq4Q+qwuSAIf2" crossorigin="anonymous"></script>
        <script>
            // JavaScript to handle thumbnail click and update main image
            $(document).ready(function () {
                $('.thumbnail-images img').click(function () {
                    var mainImageSrc = $(this).attr('src');
                    $('#mainImage').attr('src', mainImageSrc);
                });
            });
        </script>
        <jsp:include page="footer.html"/>
    </body>
</html>
