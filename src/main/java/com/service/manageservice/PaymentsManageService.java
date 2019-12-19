package com.service.manageservice;

import com.dao.PaymentDao;
import com.domain.Payment;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class PaymentsManageService {
    public static String getJson(String payId) throws JsonProcessingException {
        //    获取全部支付信息
        SqlSession sqlSession = MybatisUtils.getSession();
        PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
        Payment payment = paymentDao.findOneByPayId(payId);
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(payment);
        //System.out.println(json);
        return json;
    }

    public static void savePayment(Payment payment){
        SqlSession sqlSession = MybatisUtils.getSession();
        PaymentDao paymentDao = sqlSession.getMapper(PaymentDao.class);
        int count = paymentDao.deleteOneByPayId(payment.getPayId());
        if(count != 0){
            sqlSession.commit();
            if(paymentDao.createPayment(payment) != 0){
                sqlSession.commit();
            }else {
                sqlSession.rollback();
            }
        }
    }

    public static Payment jsonToPayment(String json){
        ObjectMapper objectMapper = new ObjectMapper();
        Payment payment = null;
        try{
            payment = objectMapper.readValue(json,Payment.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        return payment;
    }
}
