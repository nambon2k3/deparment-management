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
import model.User;

/**
 *
 * @author Legion
 */
@WebServlet(name="UpdateStatusController", urlPatterns={"/update-status"})
public class UpdateStatusController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int userRoomID = Integer.parseInt(request.getParameter("userRoomID"));
        String status = request.getParameter("status");

        RoomDAO userRoomDAO = new RoomDAO();
        userRoomDAO.updateUserRoomStatus(userRoomID, status);
        request.getRequestDispatcher("manage-request").forward(request, response);
        
    } 

}
