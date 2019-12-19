package com.servlet.manageservlet;

import com.service.manageservice.OrdersManageService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet(name = "OrdersManageServlet", urlPatterns = {"/ordersManageServlet"})
public class OrdersManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbacksJson = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
        OrdersManageService.saveFeedback(OrdersManageService.jsonToOrder(feedbacksJson));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbackId = request.getParameter("id");
        String json = OrdersManageService.getJson(feedbackId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }
}
