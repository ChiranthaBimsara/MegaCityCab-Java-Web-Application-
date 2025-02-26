package com.megacitycab.model;

public class Driver {
    private int driverID;
    private String name;
    private String licenseNumber;
    private String phoneNumber;
    private int carID;

    public Driver(int driverID, String name, String licenseNumber, String phoneNumber, int carID) {
        this.driverID = driverID;
        this.name = name;
        this.licenseNumber = licenseNumber;
        this.phoneNumber = phoneNumber;
        this.carID = carID;
    }

    // Getters and Setters
    public int getDriverID() { return driverID; }
    public void setDriverID(int driverID) { this.driverID = driverID; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public int getCarID() { return carID; }
    public void setCarID(int carID) { this.carID = carID; }
}
