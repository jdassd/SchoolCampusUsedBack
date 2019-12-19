package com.servlet.manageservlet;

import com.service.manageservice.PaymentsManageService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet(name = "PaymentsManageServlet", urlPatterns = {"/paymentsManageServlet"})
public class PaymentsManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentsJson = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
        PaymentsManageService.savePayment(PaymentsManageService.jsonToPayment(paymentsJson));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentsId = request.getParameter("id");
        String json = PaymentsManageService.getJson(paymentsId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }
}
