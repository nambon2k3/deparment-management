/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import dal.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Department;
/**
 *
 * @author Legion
 */
public class DepartmentDAO extends DBContext {

    Connection conn;

    public DepartmentDAO() {
        try {
            conn = getConnection();
        } catch (Exception e) {
            System.out.println("Connect Failed");
        }
    }
    

    public List<Department> getAllDepartments() {
        List<Department> departments = new ArrayList<>();
        String sql = "SELECT DepartmentID, DepartmentName, ManagerID FROM Departments";

        try (PreparedStatement statement = conn.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int departmentID = resultSet.getInt("DepartmentID");
                String departmentName = resultSet.getString("DepartmentName");
                int managerID = resultSet.getInt("ManagerID");

                Department department = new Department(departmentID, departmentName, managerID);
                departments.add(department);
            }
        } catch (SQLException e) {
            System.out.println("getAllDepartments: " + e.getMessage());
        }
        return departments;
    }
    
    
     public Department getDepartmentById(int departmentId) {
        Department department = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            // SQL query to retrieve department details by ID
            String query = "SELECT DepartmentID, DepartmentName, ManagerID FROM Departments WHERE DepartmentID = ?";
            
            // Prepare statement
            stmt = conn.prepareStatement(query);
            stmt.setInt(1, departmentId);
            
            // Execute query
            rs = stmt.executeQuery();
            
            // Process result set
            if (rs.next()) {
                // Retrieve department details from result set
                int id = rs.getInt("DepartmentID");
                String name = rs.getString("DepartmentName");
                int managerId = rs.getInt("ManagerID");
                
                // Create Department object
                department = new Department(id, name, managerId); // Assuming Department constructor exists
            }
            
        } catch (SQLException e) {
            System.out.println("getDepartmentById: " + e.getMessage());
        } 
        
        return department;
    }
}
