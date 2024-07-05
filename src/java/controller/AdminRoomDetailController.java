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
import model.RoomImage;
import model.RoomService;

/**
 *
 * @author Legion
 */
@WebServlet(name="AdminRoomDetailController", urlPatterns={"/admin-room-detail"})
public class AdminRoomDetailController extends HttpServlet {
   

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        
        RoomDAO rdao = new RoomDAO();
        
        List<RoomImage> roomImages = rdao.getAllImagesByRoomID(roomID);

        
        List<RoomService> roomServices = rdao.getAllRoomServices(roomID);
        List<RoomService> roomAllServices = rdao.getAllRoomServices2(roomID);

        request.setAttribute("roomServices", roomServices);
        request.setAttribute("roomAllServices", roomAllServices);
        
        request.setAttribute("roomImages", roomImages);
        request.setAttribute("roomID", roomID);
        request.getRequestDispatcher("admin-room-detail.jsp").forward(request, response);
        
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
    }


}
