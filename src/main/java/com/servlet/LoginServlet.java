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
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet",urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestDo = request.getParameter("do");
        if("out".equals(requestDo)){
            request.getSession(false).removeAttribute("user");
            request.getRequestDispatcher("/pages/all-admin-login.jsp").forward(request, response);
        }else {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if ("".equals(username) || "".equals(password)) {
                request.setAttribute("msg", "请输入用户名和密码！");
                request.getRequestDispatcher("/pages/all-admin-login.jsp").forward(request, response);
                return;
            }
            SqlSession session = MybatisUtils.getSession();
            UserDao userDao = session.getMapper(UserDao.class);
            User user = userDao.findOneByUsernameAndPassword(username, password);
            session.close();
            if (user == null) {
                //跳转登录失败页面
                request.setAttribute("msg", "用户名或密码错误，请重新输入");
                request.getRequestDispatcher("/pages/all-admin-login.jsp").forward(request, response);
            } else if (user.getStatus() == 0) {
                //跳转登录失败页面
                request.setAttribute("msg", "账户未启用");
                request.getRequestDispatcher("/pages/all-admin-login.jsp").forward(request, response);
            } else if (user.getAdmin() == 0) {
                //跳转登录失败页面
                request.setAttribute("msg", "账户权限不足");
                request.getRequestDispatcher("/pages/all-admin-login.jsp").forward(request, response);
            } else {
                //request.getRequestDispatcher("./pages/admin.jsp").forward(request,response);
                HttpSession httpSession = request.getSession(true);
                httpSession.setAttribute("user", user);
                response.sendRedirect("./pages/admin.jsp?index=0");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
