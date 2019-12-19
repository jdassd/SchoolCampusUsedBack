package com.service;

import com.dao.FeedbackDao;
import com.domain.Feedback;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class FeedbackFrameService {
    public static String getJson() throws JsonProcessingException {
        //    获取商品名称、商品ID、用户ID、商品新旧程度、上架状态、可用状态
        SqlSession sqlSession = MybatisUtils.getSession();
        FeedbackDao feedbackDao = sqlSession.getMapper(FeedbackDao.class);
        List<Feedback> list = feedbackDao.findAll();
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(list);
        //System.out.println(json);
        return json;
    }
}
