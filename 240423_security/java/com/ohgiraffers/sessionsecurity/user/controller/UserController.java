package com.ohgiraffers.sessionsecurity.user.controller;

import com.ohgiraffers.sessionsecurity.user.model.dto.SignupDTO;
import com.ohgiraffers.sessionsecurity.user.model.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/user")
public class UserController {

  @Autowired
  private UserService userService;

  @GetMapping("/signup")
  public void signup(){}

  @PostMapping("/signup")
  public String signup(ModelAndView mv, @ModelAttribute SignupDTO signupDTO, RedirectAttributes rttr) {

    int result = userService.regist(signupDTO);

    String message = "";

    if (result > 0) {
      message = "회원가입이 정상적으로 완료되었습니다.";
    } else {
      message = "회원가입에 실패했습니다.";
    }

    //mv.addObject("message", message);
    rttr.addFlashAttribute("message", message);
    return "redirect:/main";
    //return mv;
  }
}
