package com.ohgiraffers.sessionsecurity.auth.controller;

import com.ohgiraffers.sessionsecurity.auth.model.AuthDetails;
import com.ohgiraffers.sessionsecurity.user.model.dto.LoginUserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/auth")
public class AuthController {
  private LoginUserDTO loginUserDTO;

  @GetMapping("/login")
  public void login(){}

  @PostMapping("/login")
//  public String loginpage(RedirectAttributes rttr){
//    LoginUserDTO login = authService.loadUserByUsername()
//    rttr.addFlashAttribute("message", )
//  }

  @GetMapping("/fail")
  public ModelAndView loginFail(ModelAndView mv, @RequestParam String message){
    mv.addObject("message", message);
    mv.setViewName("/auth/fail");

    return mv;
  }
}
