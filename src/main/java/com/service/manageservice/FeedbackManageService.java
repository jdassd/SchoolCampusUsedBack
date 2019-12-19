package com.service.manageservice;

import com.dao.FeedbackDao;
import com.domain.Feedback;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class FeedbackManageService {
    public static String getJson(String userId) throws JsonProcessingException {
        //    获取全部反馈信息
        SqlSession sqlSession = MybatisUtils.getSession();
        FeedbackDao feedbackDao = sqlSession.getMapper(FeedbackDao.class);
        Feedback feedback = feedbackDao.findOneById(userId);
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(feedback);
        //System.out.println(json);
        return json;
    }

    public static void saveFeedback(Feedback feedback){
        SqlSession sqlSession = MybatisUtils.getSession();
        FeedbackDao feedbackDao = sqlSession.getMapper(FeedbackDao.class);
        int count = feedbackDao.deleteOneById(feedback.getFeedbacksId());
        if(count != 0){
            sqlSession.commit();
            if(feedbackDao.createFeedback(feedback) != 0){
                sqlSession.commit();
            }else {
                sqlSession.rollback();
            }
        }
        sqlSession.close();
    }

    public static Feedback jsonToFeedback(String json){
        ObjectMapper objectMapper = new ObjectMapper();
        Feedback feedback = null;
        try{
            feedback = objectMapper.readValue(json,Feedback.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        return feedback;
    }

    public static void deleteFeedback(String feedbacksId){
        SqlSession sqlSession = MybatisUtils.getSession();
        FeedbackDao feedbackDao = sqlSession.getMapper(FeedbackDao.class);
        int count = feedbackDao.deleteOneById(feedbacksId);
        if(count == 0){
            sqlSession.rollback();
        }else{
            sqlSession.commit();
        }
        sqlSession.close();
    }
}
