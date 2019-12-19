package com.servlet.manageservlet;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.manageservice.GoodsManageService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet(name = "GoodsManageServlet", urlPatterns = {"/goodsManageServlet"})
public class GoodsManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodsJson = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
        String requestDo = request.getParameter("do");
        if("changeUpStatus".equals(requestDo)){
            changeUpStatus(goodsJson,request,response);
        }else if("deleteGoods".equals(requestDo)){
            deleteGoods(goodsJson,request,response);
        }else{
            GoodsManageService.saveGoods(GoodsManageService.jsonToGoods(goodsJson));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodsId = request.getParameter("id");
        String json = GoodsManageService.getJson(goodsId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private void changeUpStatus(String json, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        String goodsId = jsonNode.path("goodsId").asText();
        int status = jsonNode.path("upStatus").asInt();
        GoodsManageService.changeUpStatus(goodsId,status);
    }

    private void deleteGoods(String json, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        String goodsId = jsonNode.path("goodsId").asText();
        GoodsManageService.deleteGoods(goodsId);
    }
}
