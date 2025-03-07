package com.megacitycab.model;

public class Customer {
    private int customerID;
    private String name, address, nic, phoneNumber;

    public Customer(int customerID, String name, String address, String nic, String phoneNumber) {
        this.customerID = customerID;
        this.name = name;
        this.address = address;
        this.nic = nic;
        this.phoneNumber = phoneNumber;
    }

    // Getters and Setters
    public int getCustomerID() { return customerID; }
    public void setCustomerID(int customerID) { this.customerID = customerID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getNIC() { return nic; }
    public void setNIC(String nic) { this.nic = nic; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
}
