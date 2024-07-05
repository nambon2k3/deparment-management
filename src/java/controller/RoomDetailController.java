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
import java.util.List;
import model.Room;
import model.RoomImage;
import model.Service;

/**
 *
 * @author Legion
 */
@WebServlet(name="RoomDetailController", urlPatterns={"/room-detail"})
public class RoomDetailController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int roomID = Integer.parseInt(request.getParameter("roomID"));

        RoomDAO roomDAO = new RoomDAO();
        Room room = roomDAO.getRoomById(roomID);
        List<RoomImage> roomImages = roomDAO.getRoomImagesByRoomId(roomID);
        List<Service> roomServices = roomDAO.getServicesByRoomId(roomID);

        request.setAttribute("room", room);
        request.setAttribute("roomImages", roomImages);
        request.setAttribute("roomServices", roomServices);

        request.getRequestDispatcher("/roomDetail.jsp").forward(request, response);
    } 

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }


}
