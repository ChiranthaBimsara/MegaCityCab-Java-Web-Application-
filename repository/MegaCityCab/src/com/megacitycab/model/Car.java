package com.megacitycab.model;

public class Car {
    private int carID;
    private String carModel;
    private String licenseNumber;
    private int year;

    // Constructor
    public Car(int carID, String carModel, String licenseNumber, int year) {
        this.carID = carID;
        this.carModel = carModel;
        this.licenseNumber = licenseNumber;
        this.year = year;
    }

    // Getters
    public int getCarID() {
        return carID;
    }

    public String getCarModel() {
        return carModel;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public int getYear() {
        return year;
    }

    // Setters (if needed)
    public void setCarID(int carID) {
        this.carID = carID;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public void setYear(int year) {
        this.year = year;
    }
}
