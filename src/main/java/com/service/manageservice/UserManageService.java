package com.service.manageservice;

import com.dao.UserDao;
import com.domain.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class UserManageService {
    public static String getJson(String userId) throws JsonProcessingException {
        //    获取商品名称、商品ID、用户ID、商品新旧程度、上架状态、可用状态
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        User user = userDao.findOneById(userId);
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(user);
        //System.out.println(json);
        return json;
    }

    public static void saveUser(User user){
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        int count = userDao.deleteUserById(user.getUserId());
        if(count != 0){
            sqlSession.commit();
            if(userDao.createUser(user) != 0){
                sqlSession.commit();
            }else {
                sqlSession.rollback();
            }
        }
        sqlSession.close();
    }

    public static User jsonToUser(String json){
        ObjectMapper objectMapper = new ObjectMapper();
        User user = null;
        try{
            user = objectMapper.readValue(json,User.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }

    public static void makeAdmin(String userId,int admin){
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        int count = userDao.changeUserAdmin(userId, admin);
        if(count == 0){
            sqlSession.rollback();
        }else{
            sqlSession.commit();
        }
        sqlSession.close();
    }

    public static void changeStatus(String userId,int status){
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        int count = userDao.changeUserStatus(userId, status);
        if(count == 0){
            sqlSession.rollback();
        }else{
            sqlSession.commit();
        }
        sqlSession.close();
    }

    public static void deleteUser(String userId) {
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        int count = userDao.deleteUserById(userId);
        if (count == 0) {
            sqlSession.rollback();
        } else {
            sqlSession.commit();
        }
        sqlSession.close();
    }

    public static void createUser(String json){
        User user = jsonToUser(json);
        SqlSession sqlSession = MybatisUtils.getSession();
        UserDao userDao = sqlSession.getMapper(UserDao.class);
        int count = userDao.createUser(user);
        if(count == 0){
            sqlSession.rollback();
        }else{
            sqlSession.commit();
        }
        sqlSession.close();
    }
}
