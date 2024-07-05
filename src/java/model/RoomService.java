/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import DAO.ServiceDAO;

/**
 *
 * @author Legion
 */
public class RoomService {
    private int roomServiceID;
    private int roomID;
    private int serviceID;
    
    
    private Service service;

    public Service getService() {
        return new ServiceDAO().getServiceById(serviceID);
    }

    public void setService(Service service) {
        this.service = service;
    }
    
    

    // Getters and setters
    public int getRoomServiceID() {
        return roomServiceID;
    }

    public void setRoomServiceID(int roomServiceID) {
        this.roomServiceID = roomServiceID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }
}
