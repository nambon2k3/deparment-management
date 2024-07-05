/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Legion
 */
public class Department {
    private int departmentID;
    private String departmentName;
    private int managerID; // Foreign key to User

    // Constructors, getters, and setters

    public Department() {
    }

    public Department(int departmentID, String departmentName, int managerID) {
        this.departmentID = departmentID;
        this.departmentName = departmentName;
        this.managerID = managerID;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }
    
    
    
}

