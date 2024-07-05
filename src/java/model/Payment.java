/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDateTime;

/**
 *
 * @author Legion
 */
public class Payment {
    private int paymentID;
    private int userID; // Foreign key to User
    private double amount;
    private LocalDateTime paymentDate;
    private String description;

    // Constructors, getters, and setters

    public Payment() {
    }

    public Payment(int paymentID, int userID, double amount, LocalDateTime paymentDate, String description) {
        this.paymentID = paymentID;
        this.userID = userID;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.description = description;
    }

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
