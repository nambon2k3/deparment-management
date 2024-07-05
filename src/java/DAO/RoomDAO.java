/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import model.UserRoom;
import dal.DBContext;
import java.util.List;
import model.Room;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.RoomImage;
import model.RoomService;
import model.Service;

/**
 *
 * @author Legion
 */
public class RoomDAO extends DBContext {

    Connection conn;

    public RoomDAO() {
        try {
            conn = getConnection();
        } catch (Exception e) {
            System.out.println("Connect Failed");
        }
    }
    
    public boolean addServiceToRoom(RoomService roomService) {
        boolean added = false;
        String query = "INSERT INTO RoomServices (RoomID, ServiceID) VALUES (?, ?)";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setInt(1, roomService.getRoomID());
            preparedStatement.setInt(2, roomService.getServiceID());

            int rowsAffected = preparedStatement.executeUpdate();
            added = rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("addServiceToRoom: " + e.getMessage());
        }
        return added;
    }
    
     public List<RoomService> getAllRoomServices(int RoomID) {
        List<RoomService> roomServices = new ArrayList<>();
        String query = "SELECT RoomServiceID, RoomID, ServiceID FROM RoomServices where RoomID = ?";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, RoomID);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                RoomService roomService = new RoomService();
                roomService.setRoomServiceID(resultSet.getInt("RoomServiceID"));
                roomService.setRoomID(resultSet.getInt("RoomID"));
                roomService.setServiceID(resultSet.getInt("ServiceID"));
                roomServices.add(roomService);
            }
        } catch (SQLException e) {
            System.out.println("getAllRoomServices: " + e.getMessage());
        }
        return roomServices;
    }
     
     public List<RoomService> getAllRoomServices2(int RoomID) {
        List<RoomService> roomServices = new ArrayList<>();
        String query = "SELECT RoomServiceID, RoomID, ServiceID FROM RoomServices where RoomServiceID not in (SELECT RoomServiceID FROM RoomServices where RoomID = ?)";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            preparedStatement.setInt(1, RoomID);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                RoomService roomService = new RoomService();
                roomService.setRoomServiceID(resultSet.getInt("RoomServiceID"));
                roomService.setRoomID(resultSet.getInt("RoomID"));
                roomService.setServiceID(resultSet.getInt("ServiceID"));
                roomServices.add(roomService);
            }
        } catch (SQLException e) {
            System.out.println("getAllRoomServices: " + e.getMessage());
        }
        return roomServices;
    }
    
    public List<RoomImage> getAllImagesByRoomID(int roomID) {
        List<RoomImage> images = new ArrayList<>();
        String query = "SELECT ImageID, RoomID, ImageURL FROM RoomImages WHERE RoomID = ?";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setInt(1, roomID);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                RoomImage image = new RoomImage();
                image.setImageID(resultSet.getInt("ImageID"));
                image.setRoomID(resultSet.getInt("RoomID"));
                image.setImageURL(resultSet.getString("ImageURL"));
                images.add(image);
            }
        } catch (SQLException e) {
            System.out.println("getAllImagesByRoomID: " + e.getMessage());
        }
        return images;
    }
    
    public void addRoomImage(int roomID, String imageURL) {
        String query = "INSERT INTO RoomImages (RoomID, ImageURL) VALUES (?, ?)";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setInt(1, roomID);
            preparedStatement.setString(2, imageURL);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("addRoomImage: " + e.getMessage());
        }
    }

    public void updateRoomImage(int imageID, String imageURL) {
        String query = "UPDATE RoomImages SET ImageURL = ? WHERE ImageID = ?";

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setString(1, imageURL);
            preparedStatement.setInt(2, imageID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateRoomImage: " + e.getMessage());
        }
    }

    public void updateUserRoomStatus(int userRoomID, String status) {
        String query = "UPDATE UserRooms SET status = ? ";
        if (status.equalsIgnoreCase("close")) {
            query += ", endDate = getDate()";
        }
        query += "WHERE UserRoomID = ?";
        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setString(1, status);
            preparedStatement.setInt(2, userRoomID);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("updateUserRoomStatus: " + e.getMessage());
        }
    }

    public boolean isRoomOccupied(int roomId) {
        String query = "SELECT COUNT(*) FROM UserRooms WHERE status = 'active' AND RoomID = ?";
        boolean isOccupied = false;

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setInt(1, roomId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int count = resultSet.getInt(1);
                isOccupied = count > 0;
            }

        } catch (SQLException e) {
            System.out.println("isRoomOccupied: " + e.getMessage());
        }

        return isOccupied;
    }

    public String getOccupyingUsername(int roomId) {
        String query = "SELECT u.[UserID], u.[Username], u.[FullName] "
                + "FROM [UserRooms] ur "
                + "JOIN [Users] u ON ur.[UserID] = u.[UserID] "
                + "WHERE ur.[status] = 'active' AND ur.[RoomID] = ?";
        String username = null;

        try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {

            preparedStatement.setInt(1, roomId);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                username = resultSet.getString("Username");
            }

        } catch (SQLException e) {
            System.out.println("getOccupyingUsername: " + e.getMessage());
        }

        return username;
    }

    public List<Room> getAllRooms(int pageNumber, int pageSize, Double minPrice, Double maxPrice) {
        List<Room> rooms = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {

            // Construct the SQL query based on the presence of minPrice and maxPrice
            String sql = "SELECT * FROM Rooms WHERE 1 = 1";
            if (minPrice != null) {
                sql += " AND Price >= ?";
            }
            if (maxPrice != null) {
                sql += " AND Price <= ?";
            }
            sql += " ORDER BY RoomID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

            stmt = conn.prepareStatement(sql);

            int parameterIndex = 1;

            // Set parameters based on the presence of minPrice and maxPrice
            if (minPrice != null) {
                stmt.setDouble(parameterIndex++, minPrice);
            }
            if (maxPrice != null) {
                stmt.setDouble(parameterIndex++, maxPrice);
            }

            stmt.setInt(parameterIndex++, (pageNumber - 1) * pageSize); // Offset calculation for pagination
            stmt.setInt(parameterIndex++, pageSize);

            rs = stmt.executeQuery();
            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("RoomID"));
                room.setDepartmentID(rs.getInt("DepartmentID"));
                room.setRoomNumber(rs.getString("RoomNumber"));
                room.setDescription(rs.getString("Description"));
                room.setPrice(rs.getDouble("price"));
                // Set other attributes as needed
                rooms.add(room);
            }
        } catch (SQLException e) {
            System.out.println("getNumberOfRooms: " + e.getMessage());
        }
        return rooms;
    }

    public int getNumberOfRooms(double minPrice, double maxPrice) {
        String query = "SELECT COUNT(*) AS total FROM Rooms WHERE price >= ? AND price <= ?";
        int count = 0;

        try (
                PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setDouble(1, minPrice);
            stmt.setDouble(2, maxPrice);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("total");
            }
        } catch (SQLException ex) {
            System.out.println("getNumberOfRooms: " + ex.getMessage());
        }

        return count;
    }

    public List<String> getRoomImagesByRoomID(int roomID) {
        List<String> imageUrls = new ArrayList<>();
        String query = "SELECT ImageURL FROM RoomImages WHERE RoomID = ?";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, roomID);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String imageUrl = rs.getString("ImageURL");
                imageUrls.add(imageUrl);
            }
        } catch (SQLException ex) {
            System.out.println("getRoomImagesByRoomID: " + ex.getMessage());
        }

        return imageUrls;
    }

    private static final String GET_ROOM_BY_ID = "SELECT * FROM Rooms WHERE RoomID = ?";
    private static final String GET_ROOM_IMAGES_BY_ROOM_ID = "SELECT * FROM RoomImages WHERE RoomID = ?";
    private static final String GET_SERVICES_BY_ROOM_ID = "SELECT s.ServiceID, s.ServiceName, s.ServiceDescription, s.Price "
            + "FROM Services s JOIN RoomServices rs ON s.ServiceID = rs.ServiceID WHERE rs.RoomID = ?";

    public Room getRoomById(int roomID) {
        Room room = null;
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(GET_ROOM_BY_ID);) {
            preparedStatement.setInt(1, roomID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                String roomNumber = rs.getString("RoomNumber");
                int departmentID = rs.getInt("departmentID");

                String description = rs.getString("Description");
                double price = rs.getDouble("Price");
                room = new Room(roomID, departmentID, roomNumber, description, price);
            }
        } catch (SQLException e) {
            System.out.println("getRoomById: " + e.getMessage());
        }
        return room;
    }

    public List<RoomImage> getRoomImagesByRoomId(int roomID) {
        List<RoomImage> roomImages = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(GET_ROOM_IMAGES_BY_ROOM_ID);) {
            preparedStatement.setInt(1, roomID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int imageID = rs.getInt("ImageID");
                String imageURL = rs.getString("ImageURL");
                roomImages.add(new RoomImage(imageID, roomID, imageURL));
            }
        } catch (SQLException e) {
            System.out.println("getRoomImagesByRoomId: " + e.getMessage());
        }
        return roomImages;
    }

    public List<Service> getServicesByRoomId(int roomID) {
        List<Service> services = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(GET_SERVICES_BY_ROOM_ID);) {
            preparedStatement.setInt(1, roomID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int serviceID = rs.getInt("ServiceID");
                String serviceName = rs.getString("ServiceName");
                String serviceDescription = rs.getString("ServiceDescription");
                double price = rs.getDouble("Price");
                services.add(new Service(serviceID, serviceName, serviceDescription, price));
            }
        } catch (SQLException e) {
            System.out.println("getServicesByRoomId: " + e.getMessage());
        }
        return services;
    }

    private static final String INSERT_BOOKING_SQL = "INSERT INTO UserRooms (UserID, RoomID, StartDate, Status) VALUES (?, ?, ?, ?)";

    public void bookRoom(UserRoom userRoom) {
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(INSERT_BOOKING_SQL)) {
            preparedStatement.setInt(1, userRoom.getUserID());
            preparedStatement.setInt(2, userRoom.getRoomID());
            preparedStatement.setDate(3, java.sql.Date.valueOf(userRoom.getStartDate()));
            preparedStatement.setString(4, userRoom.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            System.out.println("bookRoom: " + e.getMessage());
        }
    }

    private static final String SELECT_BOOKING_HISTORY_SQL = "SELECT ur.UserRoomID, ur.RoomID, ur.StartDate, ur.EndDate, ur.Status, r.RoomNumber, r.Description "
            + "FROM UserRooms ur "
            + "JOIN Rooms r ON ur.RoomID = r.RoomID "
            + "WHERE ur.UserID = ?";

    public List<UserRoom> getBookingHistory(int userID) {
        List<UserRoom> bookingHistory = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(SELECT_BOOKING_HISTORY_SQL)) {
            preparedStatement.setInt(1, userID);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                UserRoom userRoom = new UserRoom();
                userRoom.setUserRoomID(rs.getInt("UserRoomID"));
                userRoom.setRoomID(rs.getInt("RoomID"));
                userRoom.setStartDate(rs.getDate("StartDate").toLocalDate());
                userRoom.setEndDate(rs.getDate("EndDate") != null ? rs.getDate("EndDate").toLocalDate() : null);
                userRoom.setStatus(rs.getString("Status"));
                bookingHistory.add(userRoom);
            }
        } catch (SQLException e) {
            System.out.println("getBookingHistory: " + e.getMessage());
        }
        return bookingHistory;
    }

    private static final String SELECT_BOOKING_REQUEST_SQL = "SELECT ur.UserRoomID, ur.RoomID, ur.StartDate, ur.EndDate, ur.Status, r.RoomNumber, r.Description "
            + "FROM UserRooms ur "
            + "JOIN Rooms r ON ur.RoomID = r.RoomID ";

    public List<UserRoom> getBookingRequest() {
        List<UserRoom> bookingHistory = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(SELECT_BOOKING_REQUEST_SQL)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                UserRoom userRoom = new UserRoom();
                userRoom.setUserRoomID(rs.getInt("UserRoomID"));
                userRoom.setRoomID(rs.getInt("RoomID"));
                userRoom.setStartDate(rs.getDate("StartDate").toLocalDate());
                userRoom.setEndDate(rs.getDate("EndDate") != null ? rs.getDate("EndDate").toLocalDate() : null);
                userRoom.setStatus(rs.getString("Status"));
                bookingHistory.add(userRoom);
            }
        } catch (SQLException e) {
            System.out.println("getBookingHistory: " + e.getMessage());
        }
        return bookingHistory;
    }

    private static final String SELECT_ACTIVE_BOOKINGS_SQL = "SELECT ur.UserRoomID, ur.RoomID, ur.StartDate, ur.EndDate, ur.Status, r.RoomNumber, r.Description "
            + "FROM UserRooms ur "
            + "JOIN Rooms r ON ur.RoomID = r.RoomID "
            + "WHERE ur.UserID = ? AND ur.Status = 'Active'";

    public List<UserRoom> getActiveBookings(int userID) {
        List<UserRoom> activeBookings = new ArrayList<>();
        try (
                PreparedStatement preparedStatement = conn.prepareStatement(SELECT_ACTIVE_BOOKINGS_SQL)) {
            preparedStatement.setInt(1, userID);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                UserRoom userRoom = new UserRoom();
                userRoom.setUserRoomID(rs.getInt("UserRoomID"));
                userRoom.setRoomID(rs.getInt("RoomID"));
                userRoom.setStartDate(rs.getDate("StartDate").toLocalDate());
                userRoom.setEndDate(rs.getDate("EndDate") != null ? rs.getDate("EndDate").toLocalDate() : null);
                userRoom.setStatus(rs.getString("Status"));
                activeBookings.add(userRoom);
            }
        } catch (SQLException e) {
            System.out.println("getBookingHistory: " + e.getMessage());
        }
        return activeBookings;
    }

    public List<Room> getRoomsByName(String roomName, int offset, int limit) {
        List<Room> rooms = new ArrayList<>();
        String query = "SELECT RoomID, DepartmentID, RoomNumber, Description, Price "
                + "FROM Rooms "
                + "WHERE RoomNumber LIKE ? "
                + "ORDER BY RoomNumber "
                + "OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, "%" + roomName + "%");
            statement.setInt(2, offset);
            statement.setInt(3, limit);

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Room room = new Room();
                room.setRoomID(resultSet.getInt("RoomID"));
                room.setDepartmentID(resultSet.getInt("DepartmentID"));
                room.setRoomNumber(resultSet.getString("RoomNumber"));
                room.setDescription(resultSet.getString("Description"));
                room.setPrice(resultSet.getDouble("Price"));
                rooms.add(room);
            }
        } catch (SQLException e) {
            System.out.println("getRoomsByName: " + e.getMessage());
        }
        return rooms;
    }

    public int getNumberOfRoomsByName(String roomName) {
        int count = 0;
        String query = "SELECT COUNT(*) AS Total FROM Rooms WHERE RoomNumber LIKE ?";

        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setString(1, "%" + roomName + "%");

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println("getNumberOfRoomsByName: " + e.getMessage());
        }
        return count;
    }

    public boolean addRoom(Room room) {
        String query = "INSERT INTO Rooms (DepartmentID, RoomNumber, Description, Price) "
                + "VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, room.getDepartmentID());
            statement.setString(2, room.getRoomNumber());
            statement.setString(3, room.getDescription());
            statement.setDouble(4, room.getPrice());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println("addRoom: " + e.getMessage());
            return false;
        }
    }

    // Method to update an existing room
    public boolean updateRoom(Room room) {
        String query = "UPDATE Rooms "
                + "SET DepartmentID = ?, RoomNumber = ?, Description = ?, Price = ? "
                + "WHERE RoomID = ?";
        try (PreparedStatement statement = conn.prepareStatement(query)) {
            statement.setInt(1, room.getDepartmentID());
            statement.setString(2, room.getRoomNumber());
            statement.setString(3, room.getDescription());
            statement.setDouble(4, room.getPrice());
            statement.setInt(5, room.getRoomID());

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.out.println("updateRoom: " + e.getMessage());
            return false;
        }
    }

}
