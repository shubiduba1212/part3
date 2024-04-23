package com.ohgiraffers.sessionsecurity.common;

public enum UserRole { //enum은 상수의 집합을 나타내는 열거타입

  USER("USER"),
  ADMIN("ADMIN");

  private String role;

  UserRole(String role) {
    this.role = role;
  }

  public String getRole(){
    return role;
  }

  @Override
  public String toString() {
    return "UserRole{" +
            "role='" + role + '\'' +
            '}';
  }
}
