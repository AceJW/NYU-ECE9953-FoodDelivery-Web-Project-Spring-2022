package com.fooddelivery.securitydemo.entity;

import lombok.Data;

@Data
public class Users {
    private Integer id;
    private String username;
    private String password;
    public Users(int id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }
    public Users() {}
}
