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
import model.Room;

/**
 *
 * @author Legion
 */
@WebServlet(name = "AddRoomController", urlPatterns = {"/add-room"})
public class AddRoomController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form
        int departmentID = Integer.parseInt(request.getParameter("departmentID"));
        String roomNumber = request.getParameter("roomNumber");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        RoomDAO roomDAO = new RoomDAO();
        // Create a new Room object
        Room room = new Room();
        room.setDepartmentID(departmentID);
        room.setRoomNumber(roomNumber);
        room.setDescription(description);
        room.setPrice(price);

        // Call RoomDAO to add the room
        roomDAO.addRoom(room);

        response.sendRedirect("manage-room");

    }

}
