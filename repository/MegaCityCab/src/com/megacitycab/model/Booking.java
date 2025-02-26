package com.megacitycab.model;

import java.util.Date;

public class Booking {
    private int bookingID, customerID, driverID;
    private String destination;
    private Date bookingDate;
    private double totalAmount;

    public Booking(int bookingID, int customerID, int driverID, String destination, Date bookingDate, double totalAmount) {
        this.bookingID = bookingID;
        this.customerID = customerID;
        this.driverID = driverID;
        this.destination = destination;
        this.bookingDate = bookingDate;
        this.totalAmount = totalAmount;
    }

    // Getters and Setters
    public int getBookingID() { return bookingID; }
    public int getCustomerID() { return customerID; }
    public int getDriverID() { return driverID; }
    public String getDestination() { return destination; }
    public Date getBookingDate() { return bookingDate; }
    public double getTotalAmount() { return totalAmount; }
}
