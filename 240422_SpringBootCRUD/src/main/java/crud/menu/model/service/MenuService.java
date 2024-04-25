package crud.menu.model.service;

import crud.menu.model.dao.MenuMapper;
import crud.menu.model.dto.CategoryDTO;
import crud.menu.model.dto.MenuDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MenuService {

  private final MenuMapper menuMapper;

  public MenuService(MenuMapper menuMapper) {
    this.menuMapper = menuMapper;
  }
  public List<MenuDTO> findAllMenu() {
    return menuMapper.findAllMenu();
  }

  public List<CategoryDTO> findAllCategory() {
    return menuMapper.findAllCategory();
  }

  @Transactional //commit/rollback 할 지
  public void registNewMenu(MenuDTO newMenu) {
    menuMapper.registNewMenu(newMenu);
  }

  @Transactional
  public void modifyMenu(MenuDTO modifyMenu) {
    menuMapper.modifyMenu(modifyMenu);
  }

  @Transactional
  public void deleteMenu(MenuDTO deleteMenu) {
    menuMapper.deleteMenu(deleteMenu);
  }
}
