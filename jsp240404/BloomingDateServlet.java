package com.ohgiraffers.jsp240404;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/blooming/date")
public class BloomingDateServlet extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("blooming date page called");
    String cityName = (String) req.getParameter("city"); //도시명
//    서귀포 	3.24 	3.24 (±0)
//    부산 	3.22 	3.28 (-6)
//    창원 	3.22 	3.29 (-7)
//    울산 	3.27 	3.29 (-2)
//    여수 	3.28 	3.31 (-3)
//    광주 	3.28 	3.31 (-3)
//    목포 	3.29 	4.3 (-5)
//    전주 	3.29 	4.3 (-5)
//    대구 	3.26 	3.29 (-3)
//    포항 	3.24 	3.29 (-5)
//    안동 	3.31 	4.5 (-5)
//    대전 	3.30 	4.4 (-5)
//    청주 	3.31 	4.6 (-6)
//    서산 	4.6 	4.11 (-5)
//    수원 	4.7 	4.8 (-1)
//    서울 	4.3 	4.8 (-5)
//    인천 	4.7 	4.12 (-5)
//    강릉 	3.31 	4.4 (-4)
//    춘천 	4.7 	4.11 (-4)
    String bloomingDate = "";
    switch (cityName) {
      case"서울" : bloomingDate = "04월 03일"; break;
      case"인천" : bloomingDate = "04월 07일"; break;
      case"대구" : bloomingDate = "03월 26일"; break;
      case"부산" : bloomingDate = "03월 22일"; break;
      case"대전" : bloomingDate = "03월 30일"; break;
      case"광주" : bloomingDate = "03월 28일"; break;
      case"수원" : bloomingDate = "04월 07일"; break;
      case"전주" : bloomingDate = "03월 29일"; break;
      case"포항" : bloomingDate = "03월 24일"; break;
      case"강릉" : bloomingDate = "03월 31일"; break;
      case"춘천" : bloomingDate = "04월 07일"; break;
      case"청주" : bloomingDate = "03월 31일"; break;
      case"여수" : bloomingDate = "03월 28일"; break;
      case"서귀포" : bloomingDate = "04월 03일"; break;
    }

    req.setAttribute("city", cityName);
    req.setAttribute("date", bloomingDate);

    RequestDispatcher rd = req.getRequestDispatcher("/jsp/blooming.jsp");
    rd.forward(req, resp);
  }
}
