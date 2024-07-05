<!-- manager.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="styles.css">
    </head>
    <body>
        <jsp:include page="navigation.jsp" />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2">
                    <jsp:include page="sidebar.jsp" />
                </div>
                <div class="col-md-10">
                    <!-- Room List -->
                    <h2>Manage Room</h2>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addImageModal">Add Image</button>
                    <br><br>
                    <table id="table" class="table table-bordered">
                        <thead>
                            <tr>
                                <th>ImageID</th>
                                <th>ImageURL</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="roomImage" items="${roomImages}">
                                <tr>
                                    <td style="width: 20%">${roomImage.imageID}</td>
                                    <td><img src="${roomImage.imageURL}" alt="Room Image" width="100"></td>
                                    <td style="width: 20%">
                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateImageModal${roomImage.imageID}" 
                                                data-imageid="${roomImage.imageID}" data-imageurl="${roomImage.imageURL}">
                                            Update Image
                                        </button>
                                        <a href="delete-image?imageID=${roomImage.imageID}" class="btn btn-danger" >
                                            Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div style="margin: 50px 0"></div>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addServiceModal">Add Service</button>
                    <table id="table2" class="table table-bordered ">
                        <thead>
                            <tr>
                                <th>RoomServiceID</th>
                                <th>Service Name</th>
                                <th>Price</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="roomService" items="${roomServices}">
                                <tr>
                                    <td style="width: 20%">${roomService.roomServiceID}</td>
                                    <td>${roomService.service.serviceName}</td>
                                    <td>${roomService.service.price}</td>
                                    <td style="width: 20%">
                                        <!-- Button to Open the Update Service Modal -->
                                        <a href="remove-service?roomServiceID=${roomService.roomServiceID}&roomID=${roomID}" class="btn btn-danger">
                                            Remove Service
                                        </a>
                                    </td>
                                </tr>

                                <!-- Update Service Modal -->
                            <div class="modal" id="updateServiceModal${roomService.roomServiceID}">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Update Service for RoomServiceID: ${roomService.roomServiceID}</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <div class="modal-body">
                                            <form action="updateRoomService" method="post">
                                                <input type="hidden" name="roomServiceID" value="${roomService.roomServiceID}">
                                                <div class="form-group">
                                                    <label for="roomID">Room ID:</label>
                                                    <input type="text" class="form-control" name="roomID" value="${roomService.roomID}" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="serviceID">Service ID:</label>
                                                    <input type="text" class="form-control" name="serviceID" value="${roomService.serviceID}" required>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div style="margin: 50px 0"></div>
                </div>
            </div>

        </div>

        <div class="modal" id="addImageModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Image</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="add-image" method="post">
                            <div class="form-group">
                                <input type="hidden" class="form-control"  id="roomID" name="roomID" value="${roomID}">
                            </div>
                            <div class="form-group">
                                <label for="image">Image Link:</label>
                                <input type="text" class="form-control" id="image" name="image" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach var="roomImage" items="${roomImages}">
            <!-- Update Image Modal -->
            <div class="modal" id="updateImageModal${roomImage.imageID}">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Update Image</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body">
                            <form action="update-image" method="post">
                                <input type="hidden" class="form-control"  id="roomID" name="roomID" value="${roomID}">
                                <input type="hidden" class="form-control"  id="roomID" name="imageID" value="${roomImage.imageID}">
                                <div class="form-group">
                                    <label for="image">Image Link:</label>
                                    <input type="text" class="form-control" id="image" name="image" value="${roomImage.imageURL}" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Update</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

        <!-- Add Service Modal -->
        <div class="modal" id="addServiceModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Service</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="add-room-service" method="post">
                            <div class="form-group">
                                <label for="roomID">Room ID:</label>
                                <input type="text" class="form-control" name="roomID" value="${roomID}" readonly>
                            </div>
                            <div class="form-group">
                                <label for="serviceID">Service ID:</label>
                                <select type="text" class="form-control" name="serviceID" required>
                                    <c:forEach items="${roomAllServices}" var="roomService">
                                        <option value="${roomService.serviceID}">${roomService.service.serviceName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Add</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#table').DataTable({
                    "pageLength": 5,
                    "lengthChange": false
                });
            });

            $(document).ready(function () {
                $('#table2').DataTable({
                    "pageLength": 5,
                    "lengthChange": false
                });
            });
        </script>
    </body>
</html>
