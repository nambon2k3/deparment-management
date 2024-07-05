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

/**
 *
 * @author Legion
 */
@WebServlet(name="HomeController", urlPatterns={"/home"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RoomDAO roomDAO = new RoomDAO();
        
        int pageNumber = 1; // Default page number
        int pageSize = 9; // Number of rooms per page
        double minPrice = 0; // Default minPrice
        double maxPrice = Double.MAX_VALUE; // Default maxPrice
        
        // Retrieve parameters from request
        if (request.getParameter("page") != null ) {
            pageNumber = Integer.parseInt(request.getParameter("page"));
        }
        if (request.getParameter("minPrice") != null && !request.getParameter("minPrice").isEmpty()) {
            minPrice = Double.parseDouble(request.getParameter("minPrice"));
        }
        if (request.getParameter("maxPrice") != null && !request.getParameter("maxPrice").isEmpty()) {
            maxPrice = Double.parseDouble(request.getParameter("maxPrice"));
        }

        // Fetch rooms based on pagination and filtering
        List<Room> rooms = roomDAO.getAllRooms(pageNumber, pageSize, minPrice, maxPrice);
        int totalRooms = roomDAO.getNumberOfRooms(minPrice, maxPrice);
        int totalPages = (int) Math.ceil((double) totalRooms / pageSize);
        System.out.println(rooms);
        // Set attributes to be accessed in JSP
        request.setAttribute("rooms", rooms);
        request.setAttribute("pageNumber", pageNumber);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);

        // Forward the request to room.jsp
        request.getRequestDispatcher("/home.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }

}
