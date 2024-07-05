<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Room List</title>
        <!-- Include Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            .pagination {
                justify-content: center;
                margin-top: 20px;
            }
            .card {
                margin-bottom: 20px;
            }
        </style>
        
    </head>
    <body>

        <jsp:include page="header.jsp"/>
        <!-- Banner Section -->
        <section class="banner">
            <div class="container" style="color: white; background-color: rgba(0, 0, 0, .5); padding: 80px 0">
                <h1>Welcome to Our Website</h1>
                <p class="lead">Explore our rooms and services.</p>
                <!-- Add more content or actions as needed -->
            </div>
        </section>
        <div class="container">
            <h1 class="my-4">Room List</h1>

            <!-- Filter Form -->
            <form action="home" method="get">
                <div class="form-row">
                    <div class="col-md-3 mb-3">
                        <label for="minPrice">Min Price</label>
                        <input type="number" class="form-control" id="minPrice" name="minPrice" placeholder="Min Price" value="${param.minPrice}">
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="maxPrice">Max Price</label>
                        <input type="number" class="form-control" id="maxPrice" name="maxPrice" placeholder="Max Price" value="${param.maxPrice}">
                    </div>
                    <div class="col-md-2 mb-3 ">
                        <label>&nbsp;</label><br>
                        <button type="submit" class="btn btn-primary btn-block">Apply Filter</button>
                    </div>
                    <div class="col-md-2 mb-3 ">
                        <label>&nbsp;</label><br>
                        <button type="reset" class="btn btn-primary btn-block">Reset</button>
                    </div>
                </div>
            </form>

            <!-- Room List -->
            <div class="row">
                <c:forEach var="room" items="${rooms}">
                    <div class="col-lg-4 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <img class="card-img-top" src="${room.listImageURL[0]}" alt="..." />
                                <h5 class="card-title">${room.roomNumber}</h5>
                                <p class="card-text">${room.description}</p>
                                <p class="card-text"><strong>Price:</strong> $${room.price}</p>
                            </div>
                            <div class="d-flex justify-content-center p-3">
                                <a class="btn btn-primary" href="room-detail?roomID=${room.roomID}">View Detail</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Pagination -->
            <ul class="pagination justify-content-center">
                <li class="page-item ${pageNumber == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="home?page=${pageNumber - 1}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>

                <c:forEach var="page" begin="1" end="${totalPages}">
                    <li class="page-item ${page == pageNumber ? 'active' : ''}">
                        <a class="page-link" href="home?page=${page}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}">${page}</a>
                    </li>
                </c:forEach>

                <li class="page-item ${pageNumber == totalPages ? 'disabled' : ''}">
                    <a class="page-link" href="home?page=${pageNumber + 1}&minPrice=${param.minPrice}&maxPrice=${param.maxPrice}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul>
        </div>
        <jsp:include page="footer.html"/>
        <!-- Include Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
