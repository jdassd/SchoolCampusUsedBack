package com.service;

import com.dao.FeedbackDao;
import com.dao.GoodsDao;
import com.dao.OrderDao;
import com.dao.UserDao;
import com.domain.Feedback;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MainFrameService {
    public static String getJson() throws JsonProcessingException {
        //    获取商品数、订单数、用户数、投诉建议反馈数
        int[] nums = new int[4];
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        GoodsDao goodsDao = sqlSession.getMapper(GoodsDao.class);
        OrderDao orderDao = sqlSession.getMapper(OrderDao.class);
        FeedbackDao feedbackDao = sqlSession.getMapper(FeedbackDao.class);
        nums[0] = goodsDao.findCount();
        nums[1] = orderDao.findCount();
        nums[2] = userDao.findCount();
        nums[3] = feedbackDao.findCount();
        List<Feedback> list = feedbackDao.findAllByAdminStatus(0);
        sqlSession.close();
        Map map = new HashMap<>();
        map.put("goodsNum",nums[0]);
        map.put("ordersNum",nums[1]);
        map.put("usersNum",nums[2]);
        map.put("feedbackNum",nums[3]);
        map.put("list",list);
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(map);
        //System.out.println(json);
        return json;
    }
}
