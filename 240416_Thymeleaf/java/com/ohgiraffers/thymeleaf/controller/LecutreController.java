package com.ohgiraffers.thymeleaf.controller;

import com.ohgiraffers.thymeleaf.model.dto.MemberDTO;
import com.ohgiraffers.thymeleaf.model.dto.SelectCriteria;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("lecture") // 동일한 경로의 경우, 상위 경로를 따로 RequestMapping annotation을 사용하여 설정하면 하위경로에 동일하게 적용된다.
public class LecutreController {

  @GetMapping("expression")
  public ModelAndView expression(ModelAndView mv){ //핸들링하는 메소드
    mv.addObject("member", new MemberDTO("블리짭", 20, '남', "서울시 서초구"));
    mv.addObject("hello", "Hello!<h3>Thymeleaf</h3>");
    mv.setViewName("/lecture/expression");
    return mv;
  }

  @GetMapping("conditional")
  public ModelAndView conditional(ModelAndView mv){
    //mv.setViewName("/lecture/conditional"); //작성하지 않아도 경로가 자동 매핑되어 설정된다.
    mv.addObject("num", 1);
    mv.addObject("str", "바나나🍌");
    List<MemberDTO> memberList = new ArrayList<>();
    memberList.add(new MemberDTO("홍길동", 20, '남', "서울시 서초구"));
    memberList.add(new MemberDTO("유관순", 16, '여', "서울시 중랑구"));
    memberList.add(new MemberDTO("신사임당", 50, '여', "서울시 송파구"));
    memberList.add(new MemberDTO("이순신", 37, '남', "서울시 동작구"));
    memberList.add(new MemberDTO("장보고", 25, '남', "서울시 구로구"));

    mv.addObject("memberList", memberList);

    return mv;
  }

  @GetMapping("etc")
  public ModelAndView etc(ModelAndView mv) {

    SelectCriteria selectCriteria = new SelectCriteria(1, 10, 3);

    mv.addObject(selectCriteria); // key 값을 설정하지 않으면 자동으로 변수명이 key값이 된다.

    return mv;
  }

  @GetMapping("practice")
  public ModelAndView practice(ModelAndView mv) {
    SelectCriteria selectCriteria = new SelectCriteria(1, 10, 3);

    mv.addObject(selectCriteria); // key 값을 설정하지 않으면 자동으로 변수명이 key값이 된다.

    return mv;
  }
}
