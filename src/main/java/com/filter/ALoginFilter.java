package com.filter;

/**
 * 登录判断过滤器
 */

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter",urlPatterns = {"/*"})
public class ALoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding("UTF-8");

        String uri = request.getRequestURI();

        if(uri.contains("/indexServlet") || (uri.contains("/admin")&&!uri.contains("/pages/admin.jsp")) || uri.contains("/loginServlet") || uri.contains("/rigisterServlet")
            || uri.contains("/assets/*") || uri.contains("/images/*") || uri.contains("/modules/*") || uri.contains("/plugins/*") ||
                uri.contains("/pages/all-admin-login.jsp") || uri.contains("/pages/all-admin-register.jsp")){
            //System.out.println("放行：" + uri);
            chain.doFilter(req, resp);
        }else{
            //System.out.println("拦截： " + uri);
            HttpSession session = request.getSession();
            if (session == null || session.getAttribute("user") == null) {
                //跳转登录页面
                response.sendRedirect("./all-admin-login.jsp");
            } else {
                //如果登录状态还在
                chain.doFilter(req, resp);
            }
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
