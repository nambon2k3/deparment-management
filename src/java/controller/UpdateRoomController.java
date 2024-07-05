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
@WebServlet(name="UpdateRoomController", urlPatterns={"/update-room"})
public class UpdateRoomController extends HttpServlet {
   


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         // Retrieve parameters from the form
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int departmentID = Integer.parseInt(request.getParameter("departmentID"));
        String roomNumber = request.getParameter("roomNumber");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        RoomDAO roomDAO = new RoomDAO();
        // Create a new Room object
        Room room = new Room();
        room.setRoomID(roomID);
        room.setDepartmentID(departmentID);
        room.setRoomNumber(roomNumber);
        room.setDescription(description);
        room.setPrice(price);

        // Call RoomDAO to update the room
        roomDAO.updateRoom(room);

        response.sendRedirect("manage-room");
    }

}
