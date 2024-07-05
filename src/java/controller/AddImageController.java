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

/**
 *
 * @author Legion
 */
@WebServlet(name="AddImageController", urlPatterns={"/add-image"})
public class AddImageController extends HttpServlet {
   

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String imageURL = request.getParameter("image");
        System.out.println(request.getParameter("roomID"));
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        RoomDAO roomImageDAO = new RoomDAO();
        roomImageDAO.addRoomImage(roomID, imageURL);
        response.sendRedirect("admin-room-detail?roomID=" + roomID);
    }


}
