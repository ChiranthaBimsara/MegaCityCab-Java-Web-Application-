package com.megacitycab.model;

public class Admin {
    private int adminID;
    private String username, password, fullName;

    public Admin(int adminID, String username, String password, String fullName) {
        this.adminID = adminID;
        this.username = username;
        this.password = password;
        this.fullName = fullName;
    }

    // Getters and Setters
    public int getAdminID() { return adminID; }
    public void setAdminID(int adminID) { this.adminID = adminID; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
}
