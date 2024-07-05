/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import DAO.DepartmentDAO;
import DAO.RoomDAO;
import java.util.List;

/**
 *
 * @author Legion
 */
public class Room {

    private int roomID;
    private int departmentID; // Foreign key to Department
    private String roomNumber;
    private String description;
    private double price;  // Adding price attribute
    
    private List<String> listImageURL;
    private Department department;
    
    private String userRender;

    public Department getDepartment() {
        return new DepartmentDAO().getDepartmentById(departmentID);
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getUserRender() {
        if(new RoomDAO().isRoomOccupied(roomID)) {
            return new RoomDAO().getOccupyingUsername(roomID);
        }
        return "None";
    }

    public void setUserRender(String userRender) {
        this.userRender = userRender;
    }
    
    
    
    

    public Room() {
    }

    public Room(int roomID, int departmentID, String roomNumber, String description) {
        this.roomID = roomID;
        this.departmentID = departmentID;
        this.roomNumber = roomNumber;
        this.description = description;
    }

    public Room(int roomID, int departmentID, String roomNumber, String description, double price) {
        this.roomID = roomID;
        this.departmentID = departmentID;
        this.roomNumber = roomNumber;
        this.description = description;
        this.price = price;
    }

    public List<String> getListImageURL() {
        return new RoomDAO().getRoomImagesByRoomID(roomID);
    }

    public void setListImageURL(List<String> listImageURL) {
        this.listImageURL = listImageURL;
    }
    
     

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getDepartmentID() {
        return departmentID;
    }

    public void setDepartmentID(int departmentID) {
        this.departmentID = departmentID;
    }

    public String getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(String roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
