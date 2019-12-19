package com.servlet.manageservlet;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.manageservice.FeedbackManageService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

@WebServlet(name = "FeedbackManageServlet", urlPatterns = {"/feedbackManageServlet"})
public class FeedbackManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbacksJson = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
        String requestDo = request.getParameter("do");
        if("deleteFeedback".equals(requestDo)){
            deleteFeedback(feedbacksJson,request,response);
        }else{
            FeedbackManageService.saveFeedback(FeedbackManageService.jsonToFeedback(feedbacksJson));
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbackId = request.getParameter("id");
        String json = FeedbackManageService.getJson(feedbackId);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private void deleteFeedback(String json, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(json);
        String feedbacksId = jsonNode.path("feedbacksId").asText();
        FeedbackManageService.deleteFeedback(feedbacksId);
    }
}
