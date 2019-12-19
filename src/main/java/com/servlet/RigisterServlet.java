package com.servlet;

import com.dao.UserDao;
import com.domain.User;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "RigisterServlet", urlPatterns = {"/rigisterServlet"})
public class RigisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if("".equals(username) || "".equals(password) || "".equals(name) || "".equals(email)){
            request.setAttribute("msg","请填写完整！");
            request.getRequestDispatcher("/pages/all-admin-register.jsp").forward(request,response);
            return;
        }
        SqlSession session = MybatisUtils.getSession();
        UserDao mapper = session.getMapper(UserDao.class);
        if(mapper.findOneByUsername(username) == null){
            if(mapper.findOneByEmail(email) == null){
                User user = new User(UUID.randomUUID().toString(),name,username,password,1,email,0,0);
                int count = mapper.createUser(user);
                if(count == 0){
                    request.setAttribute("msg","注册失败，请稍后再试");
                    request.getRequestDispatcher("/pages/all-admin-register.jsp").forward(request,response);
                }else{
                    session.commit();
                    response.sendRedirect("/pages/all-admin-login.jsp");
                }
            }else{
                request.setAttribute("msg","邮箱已存在，请重新输入");
                request.getRequestDispatcher("/pages/all-admin-register.jsp").forward(request,response);
            }
        }else{
            request.setAttribute("msg","用户名已存在，请重新输入");
            request.getRequestDispatcher("/pages/all-admin-register.jsp").forward(request,response);
        }
        session.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
