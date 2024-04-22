package crud.menu;

import crud.menu.model.dto.CategoryDTO;
import crud.menu.model.dto.MenuDTO;
import crud.menu.model.service.MenuService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/menu")
public class MenuController {

  private final MenuService menuService;

  public MenuController(MenuService menuService) {
    this.menuService = menuService;
  }

  @GetMapping("/list")
  public String findMenuList(Model model) {

    List<MenuDTO> menuList = menuService.findAllMenu();

    for (MenuDTO menus : menuList) {
      System.out.println("menus = " + menus);
    }

    model.addAttribute("menuList", menuList);

    return "menu/list";

  }

  @GetMapping("/regist")
  public void registPage(){}

  @GetMapping(value = "category", produces = "application/json; charset=UTF-8")
  @ResponseBody
  public List<CategoryDTO> findCategoryList(){
    return menuService.findAllCategory();
  }

  @PostMapping("/regist")
  public String registMenu(MenuDTO newMenu, RedirectAttributes rttr){

    menuService.registNewMenu(newMenu);
    rttr.addFlashAttribute("successMessage", "신규 메뉴 등록 성공\uD83C\uDF8A");
    return "redirect:/menu/list";
  }

  // 메뉴 수정
  @GetMapping("/modify")
  public void modifyPage(){}

  @PostMapping("/modify")
  public String modifyMenu(MenuDTO modifyMenu, RedirectAttributes rttr){
    menuService.modifyMenu(modifyMenu);
    rttr.addFlashAttribute("successMessage", "메뉴 수정 완료🔧");

    return "redirect:/menu/list";
  }

  // 메뉴 삭제
  @GetMapping("/delete")
  public void deletePage(){}

  @PostMapping("/delete")
  public String deleteMenu(MenuDTO deleteMenu, RedirectAttributes rttr){
    menuService.deleteMenu(deleteMenu);
    rttr.addFlashAttribute("successMessage", "메뉴 삭제 완료🚧");

    return "redirect:/menu/list";
  }
}
