package com.ohgiraffers.section01.session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/session")
public class SessionHandlerServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");

    System.out.println("firstName = " + firstName);
    System.out.println("lastName = " + lastName);

    HttpSession session = request.getSession();

    System.out.println("session default 유지 시간 : " + session.getMaxInactiveInterval());

    session.setMaxInactiveInterval(60 * 10);
    System.out.println("변경 후 session 유지 시간 : " + session.getMaxInactiveInterval());

    System.out.println("session Id : " + session.getId());

    session.setAttribute("firstName", firstName);
    session.setAttribute("lastName", lastName);

    response.sendRedirect("redirect");
  }
}
