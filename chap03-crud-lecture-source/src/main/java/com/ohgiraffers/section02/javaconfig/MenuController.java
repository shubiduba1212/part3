package com.ohgiraffers.section02.javaconfig;

import java.util.List;
import java.util.Map;

public class MenuController {
  private final PrintResult printResult;
  private final MenuService menuService;

  public MenuController() {
    printResult = new PrintResult();
    menuService = new MenuService();
  }
  public void selectAllMenu() {
    List<MenuDTO> menuList = menuService.selectMenuAll();

    if (menuList != null) {
      printResult.printMenuList(menuList);
    } else {
      printResult.printErrorMessage("selectList");
    }
  }

  public void selectMenuByCode(Map<String, String> parameter) {
    int code = Integer.parseInt(parameter.get("code"));

    MenuDTO menu = menuService.selectMenuByCode(code);

    if (menu != null) {
      printResult.printMenu(menu);
    } else {
      printResult.printErrorMessage("selectOne");
    }
  }


  public void registMenu(Map<String, String> parameter) {
    String name = parameter.get("name");
    int price = Integer.parseInt(parameter.get("price"));
    int categoryCode = Integer.parseInt(parameter.get("categoryCode"));

    MenuDTO menu = new MenuDTO();
    menu.setName(name);
    menu.setPrice(price);
    menu.setCategoryCode(categoryCode);

    if (menuService.registMenu(menu)) {
      printResult.printSuccessMessage("insert"); //메뉴 추가 성공한 경우
    } else {
      printResult.printErrorMessage("insert");
    }
  }

  public void modifyMenu(Map<String, String> parameter) {
    int code = Integer.parseInt(parameter.get("code"));
    String name = parameter.get("name");
    int price = Integer.parseInt(parameter.get("price"));
    int categoryCode = Integer.parseInt(parameter.get("categoryCode"));


    MenuDTO menu = new MenuDTO();
    menu.setCode(code);
    menu.setName(name);
    menu.setPrice(price);
    menu.setCategoryCode(categoryCode);

    if (menuService.modifyMenu(menu)) {
      printResult.printSuccessMessage("modify");
    } else {
      printResult.printErrorMessage("modify");
    }
  }

  public void deleteMenu(Map<String, String> parameter) {
    int code = Integer.parseInt(parameter.get("code"));
    menuService.deleteMenu(code);

    if (!menuService.deleteMenu(code)) {
      printResult.printSuccessMessage("delete");
    } else {
      printResult.printErrorMessage("delete");
    }
  }
}
