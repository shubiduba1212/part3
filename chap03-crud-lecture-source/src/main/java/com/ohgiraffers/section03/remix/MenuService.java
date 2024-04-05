package com.ohgiraffers.section03.remix;

import org.apache.ibatis.session.SqlSession;

import java.awt.*;
import java.util.List;

import static com.ohgiraffers.section03.remix.Template.getSqlSession;

public class MenuService {
  public List<MenuDTO> selectMenuAll() {
    SqlSession sqlSession = getSqlSession();

    MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);

    List<MenuDTO> menuList = menuMapper.selectAllMenu();

    sqlSession.close();

    return menuList;
  }

  public MenuDTO selectMenuByCode(int code) {
    SqlSession sqlSession = getSqlSession();

    MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);

    MenuDTO menu = menuMapper.selectMenuByCode(code);

    sqlSession.close();

    return menu;
  }

  public boolean registMenu(MenuDTO menu) {
    SqlSession sqlSession = getSqlSession();
    MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);

    int result = menuMapper.registMenu(menu);

    if (result > 0) {
      sqlSession.commit();
    } else {
      sqlSession.rollback();
    }
    return result > 0 ? true : false;
  }

  public boolean modifyMenu(MenuDTO menu) {
    SqlSession sqlSession = getSqlSession();
    MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);
    int result = menuMapper.modifyMenu(menu);

    if (result > 0) {
      sqlSession.commit();
    } else {
      sqlSession.rollback();
    }
    return result > 0 ? true : false;
  }

  public boolean deleteMenu(int code) {
    SqlSession sqlSession = getSqlSession();
    MenuMapper menuMapper = sqlSession.getMapper(MenuMapper.class);

    int result = menuMapper.deleteMenu(code);

    if (result > 0) {
      sqlSession.commit();
    } else {
      sqlSession.rollback();
    }

    return result > 0 ? true : false;
  }
}
