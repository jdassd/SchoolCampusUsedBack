package com.service;

import com.dao.OrderDao;
import com.domain.Order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class OrdersFrameService {
    public static String getJson(String statusDscri) throws JsonProcessingException {
        //    获取商品名称、商品ID、用户ID、商品新旧程度、上架状态、可用状态
        SqlSession sqlSession = MybatisUtils.getSession();
        OrderDao orderDao = sqlSession.getMapper(OrderDao.class);
        List<Order> list = null;
        if("finish".equals(statusDscri)){
            list = orderDao.findAllByStatus(1);
        }else if("unfinish".equals(statusDscri)){
            list = orderDao.findAllByStatus(0);
        }else{
            list = orderDao.findAllByStatus(-1);
        }
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(list);
        //System.out.println(json);
        return json;
    }
}
