/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.RoomDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Legion
 */
@WebServlet(name="UpdateRoomImageController", urlPatterns={"/update-image"})
public class UpdateRoomImageController extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int imageID = Integer.parseInt(request.getParameter("imageID"));
        String imageURL = request.getParameter("image");
        String roomID = request.getParameter("roomID");
        RoomDAO roomImageDAO = new RoomDAO();
        roomImageDAO.updateRoomImage(imageID, imageURL);
        response.sendRedirect("admin-room-detail?roomID=" + roomID);
    }


}
