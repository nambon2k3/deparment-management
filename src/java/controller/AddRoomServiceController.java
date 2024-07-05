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
import model.RoomService;

/**
 *
 * @author Legion
 */
@WebServlet(name="AddRoomServiceController", urlPatterns={"/add-room-service"})
public class AddRoomServiceController extends HttpServlet {
   
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        int serviceID = Integer.parseInt(request.getParameter("serviceID"));

        RoomService roomService = new RoomService();
        roomService.setRoomID(roomID);
        roomService.setServiceID(serviceID);

        RoomDAO roomServiceDAO = new RoomDAO();
        roomServiceDAO.addServiceToRoom(roomService);
        response.sendRedirect("admin-room-detail?roomID=" + roomID);
    }


}
