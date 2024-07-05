package model;


import DAO.RoomDAO;
import java.time.LocalDate;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Legion
 */
public class UserRoom {
    private int userRoomID;
    private int userID;
    private int roomID;
    private LocalDate startDate;
    private LocalDate endDate;
    private String status;
    
    private Room room;

    public Room getRoom() {
        return new RoomDAO().getRoomById(roomID);
    }

    public void setRoom(Room room) {
        this.room = room;
    }
    
    

    // Getters and setters...
    public int getUserRoomID() {
        return userRoomID;
    }

    public void setUserRoomID(int userRoomID) {
        this.userRoomID = userRoomID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
