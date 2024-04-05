package com.ohgiraffers.section01.xmlconfig;

import java.util.List;

public class PrintResult {
  public void printMenuList(List<MenuDTO> menuList) {
    for (MenuDTO menu : menuList) {
      System.out.println(menu);
    }
  }

  public void printErrorMessage(String errorCode) {
    String errorMessage = "";
    switch (errorCode) {
      case "selectList": errorMessage = "메뉴 목록 조회를 실패하셨습니다."; break;
      case "selectOne": errorMessage = "메뉴 상세 조회를 실패하셨습니다."; break;
      case "insert": errorMessage = "신규 메뉴 등록을 실패했습니다."; break;
      case "modify": errorMessage = "메뉴 수정에 실패했습니다."; break;
      case "delete": errorMessage = "이미 삭제되었거나 없는 메뉴입니다."; break;
    }

    System.out.println(errorMessage);
  }

  public void printMenu(MenuDTO menu) {
    System.out.println(menu);
  }

  public void printSuccessMessage(String successCode) {
    String successMessage = "";
    switch (successCode) {
      case "insert" : successMessage = "신규 메뉴 등록에 성공했습니다."; break;
      case "modify" : successMessage = "메뉴 수정에 성공했습니다."; break;
      case "delete" : successMessage = "메뉴 삭제에 성공했습니다."; break;
    }

    System.out.println(successMessage);
  }
}
