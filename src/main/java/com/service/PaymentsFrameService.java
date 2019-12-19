package com.service;

import com.dao.PaymentDao;
import com.domain.Payment;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class PaymentsFrameService {
    public static String getJson() throws JsonProcessingException {
        //    获取用户ID、支付ID、费用、费用状态、支付时间、商品ID、支付状态
        SqlSession sqlSession = MybatisUtils.getSession();
        PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
        List<Payment> list = paymentDao.findAll();
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(list);
        //System.out.println(json);
        return json;
    }
}
