package com.servlet;

import com.service.OrdersFrameService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ordersFrameServlet", urlPatterns = {"/ordersFrameServlet"})
public class OrdersFrameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String statusDscri = request.getParameter("statusDscri");
        response.setContentType("application/json;charset=utf-8");
        if("1".equals(statusDscri)) {
            response.getWriter().write(OrdersFrameService.getJson("finish"));
        }else if("0".equals(statusDscri)){
            response.getWriter().write(OrdersFrameService.getJson("unfinish"));
        }else if("-1".equals(statusDscri)){
            response.getWriter().write(OrdersFrameService.getJson("argue"));
        }else{
            response.sendRedirect("./pages/admin.jsp?index=0");
        }
    }
}
