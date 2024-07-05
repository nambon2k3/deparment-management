/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import DAO.DepartmentDAO;
import DAO.RoomDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Department;
import model.Room;

/**
 *
 * @author Legion
 */
@WebServlet(name="MangeRoomController", urlPatterns={"/manage-room"})
public class MangeRoomController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int page = 1;
        int recordsPerPage = 5; // Number of records per page
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }

        String roomName = request.getParameter("roomName"); // Get search parameter
        if (roomName == null) {
            roomName = ""; // Default empty search
        }
        
        RoomDAO roomDAO = new RoomDAO();

        List<Room> rooms = roomDAO.getRoomsByName(roomName, (page - 1) * recordsPerPage, recordsPerPage);
        int numberOfRooms = roomDAO.getNumberOfRoomsByName(roomName); // Get total count for pagination
        int numberOfPages = (int) Math.ceil((double) numberOfRooms / recordsPerPage);
        List<Department> departments = new DepartmentDAO().getAllDepartments();
        
        request.setAttribute("rooms", rooms);
        request.setAttribute("departments", departments);
        request.setAttribute("numberOfPages", numberOfPages);
        request.setAttribute("currentPage", page);
        request.setAttribute("roomName", roomName); // Pass back search term for display

        request.getRequestDispatcher("manage-room.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }


}
