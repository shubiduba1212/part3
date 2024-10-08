package com.ohgiraffers.section03.remix;

import java.util.List;

public interface MenuMapper {
  List<MenuDTO> selectAllMenu();

  MenuDTO selectMenuByCode(int code);

  int registMenu(MenuDTO menu);

  int modifyMenu(MenuDTO menu);

  int deleteMenu(int code);
}
