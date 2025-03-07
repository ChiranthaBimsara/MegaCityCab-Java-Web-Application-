package com.megacitycab.model;

import java.util.Date;

public class Payment {
    private int paymentID, bookingID, customerID;
    private double amountPaid;
    private Date paymentDate;
    private String paymentMethod;

    public Payment(int paymentID, int bookingID, int customerID, double amountPaid, Date paymentDate, String paymentMethod) {
        this.paymentID = paymentID;
        this.bookingID = bookingID;
        this.customerID = customerID;
        this.amountPaid = amountPaid;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
    }

    // Getters and Setters
    public int getPaymentID() { return paymentID; }
    public int getBookingID() { return bookingID; }
    public int getCustomerID() { return customerID; }
    public double getAmountPaid() { return amountPaid; }
    public Date getPaymentDate() { return paymentDate; }
    public String getPaymentMethod() { return paymentMethod; }
}
