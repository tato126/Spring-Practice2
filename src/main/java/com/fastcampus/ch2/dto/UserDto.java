package com.fastcampus.ch2.dto;

public class UserDto {

    private long userId;
    private String id;
    private String pwd;
    private String name;

    public UserDto() {
    }

    public UserDto(long userId, String id, String pwd, String name) {
        this.userId = userId;
        this.id = id;
        this.pwd = pwd;
        this.name = name;
    }

    // Getter
    public long getUserId() {
        return userId;
    }

    public String getId() {
        return id;
    }

    public String getPwd() {
        return pwd;
    }

    public String getName() {
        return name;
    }

    // Setter
    public void setUserId(long userId) {
        this.userId = userId;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public void setName(String name) {
        this.name = name;
    }
}
