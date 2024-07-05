/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.ServiceDAO;
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
@WebServlet(name = "RemoveServiceController", urlPatterns = {"/remove-service"})
public class RemoveServiceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int roomServiceID = Integer.parseInt(request.getParameter("roomServiceID"));
        String roomID = request.getParameter("roomID");
        ServiceDAO roomServiceDAO = new ServiceDAO();
        roomServiceDAO.removeServiceFromRoom(roomServiceID);

        response.sendRedirect("admin-room-detail?roomID=" + roomID);
    }

}
