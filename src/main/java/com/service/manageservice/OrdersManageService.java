package com.service.manageservice;

import com.dao.OrderDao;
import com.domain.Order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class OrdersManageService {
    public static String getJson(String orderId) throws JsonProcessingException {
        //    获取全部订单信息
        SqlSession sqlSession = MybatisUtils.getSession();
        OrderDao orderDao = sqlSession.getMapper(OrderDao.class);
        Order order = orderDao.findOneByOrderId(orderId);
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(order);
        //System.out.println(json);
        return json;
    }

    public static void saveFeedback(Order order){
        SqlSession sqlSession = MybatisUtils.getSession();
        OrderDao orderDao = sqlSession.getMapper(OrderDao.class);
        int count = orderDao.deleteOneByOrderId(order.getOrdersId());
        if(count != 0){
            sqlSession.commit();
            if(orderDao.createOrder(order) != 0){
                sqlSession.commit();
            }else {
                sqlSession.rollback();
            }
        }
    }

    public static Order jsonToOrder(String json){
        ObjectMapper objectMapper = new ObjectMapper();
        Order order = null;
        try{
            order = objectMapper.readValue(json,Order.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        return order;
    }
}
