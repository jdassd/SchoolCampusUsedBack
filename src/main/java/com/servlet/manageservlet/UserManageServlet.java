package com.servlet.manageservlet;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.manageservice.UserManageService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.UUID;

@WebServlet(name = "UserManageServlet", urlPatterns = {"/userManageServlet"})
public class UserManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userJson = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
        String requestDo = request.getParameter("do");
        if(requestDo == null || "".equals(requestDo)){
            //String userJson = new BufferedReader(new InputStreamReader(request.getInputStream(),"UTF-8")).readLine();
            UserManageService.saveUser(UserManageService.jsonToUser(userJson));
        }else if("makeAdmin".equals(requestDo)){
            makeAdmin(userJson,request,response);
        }else if("changeStatus".equals(requestDo)){
            changeStatus(userJson,request,response);
        }else if("deleteUser".equals(requestDo)){
            deleteUser(userJson,request,response);
        }else if("createUser".equals(requestDo)){
            createUser(userJson,request,response);
        }else{
            response.sendRedirect("./admin-404.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestDo = request.getParameter("do");
        String json = null;
        if("createUser".equals(requestDo)){
            json = "{"+"\"userId\""+":\""+UUID.randomUUID().toString()+"\"}";
        }else{
            String userId = request.getParameter("id");
            json = UserManageService.getJson(userId);
        }
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(json);
    }

    private void makeAdmin(String json,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //System.out.println("我走的是makeAdmin...");
        String userIdJson = json;
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(userIdJson);
        String userId = jsonNode.path("userId").asText();
        int admin = jsonNode.path("admin").asInt();
        UserManageService.makeAdmin(userId,admin);
    }

    private void changeStatus(String json,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdJson = json;
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(userIdJson);
        String userId = jsonNode.path("userId").asText();
        int status = jsonNode.path("status").asInt();
        UserManageService.changeStatus(userId,status);
    }

    private void deleteUser(String json,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdJson = json;
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode jsonNode = objectMapper.readTree(userIdJson);
        String userId = jsonNode.path("userId").asText();
        UserManageService.deleteUser(userId);
    }

    private void createUser(String json,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdJson = json;
        UserManageService.createUser(json);
    }
}
