/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import model.User;
import model.UserRoom;

/**
 *
 * @author Legion
 */
@WebServlet(name = "BookingRoomController", urlPatterns = {"/booking"})
public class BookingRoomController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int userID = ((User) request.getSession().getAttribute("user")).getUserID();
        String startDate = request.getParameter("startDate");
        // Create a new UserRoom object and set its attributes
        UserRoom userRoom = new UserRoom();
        userRoom.setUserID(userID);
        userRoom.setRoomID(roomID);
        userRoom.setStartDate(LocalDate.parse(startDate));
        userRoom.setStatus("Pending");
        RoomDAO roomDAO = new RoomDAO();
        // Add the booking to the database
        roomDAO.bookRoom(userRoom);

        // Redirect to the thank you page
        response.sendRedirect("thank.jsp");
    }


}
