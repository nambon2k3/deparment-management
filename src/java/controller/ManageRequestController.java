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
import model.User;
import model.UserRoom;

/**
 *
 * @author Legion
 */
@WebServlet(name="ManageRequestController", urlPatterns={"/manage-request"})
public class ManageRequestController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RoomDAO roomDAO = new RoomDAO();
        List<UserRoom> bookingRequest= roomDAO.getBookingRequest();
        request.setAttribute("bookingRequest", bookingRequest);
        request.getRequestDispatcher("manage-request.jsp").forward(request, response);
    } 


}
