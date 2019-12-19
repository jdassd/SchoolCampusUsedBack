package com.service.manageservice;

import com.dao.GoodsDao;
import com.domain.Goods;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;

public class GoodsManageService {
    public static String getJson(String userId) throws JsonProcessingException {
        //    获取商品全部信息
        SqlSession sqlSession = MybatisUtils.getSession();
        GoodsDao goodsDao = sqlSession.getMapper(GoodsDao.class);
        Goods goods = goodsDao.findOneById(userId);
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(goods);
        //System.out.println(json);
        return json;
    }

    public static void saveGoods(Goods goods){
        SqlSession sqlSession = MybatisUtils.getSession();
        GoodsDao goodsDao = sqlSession.getMapper(GoodsDao.class);
        int count = goodsDao.deleteGoodsById(goods.getGoodsId());
        if(count != 0){
            sqlSession.commit();
            if(goodsDao.createGoods(goods) != 0){
                sqlSession.commit();
            }else {
                sqlSession.rollback();
            }
        }
        sqlSession.close();
    }

    public static Goods jsonToGoods(String json){
        ObjectMapper objectMapper = new ObjectMapper();
        Goods goods = null;
        try{
            goods = objectMapper.readValue(json,Goods.class);
        }catch (Exception e){
            e.printStackTrace();
        }
        return goods;
    }

    public static void changeUpStatus(String goodsId,int status){
        SqlSession sqlSession = MybatisUtils.getSession();
        GoodsDao goodsDao = sqlSession.getMapper(GoodsDao.class);
        int count = goodsDao.changeUpStatusById(goodsId,status);
        if(count != 0){
            sqlSession.commit();
        }else{
            sqlSession.rollback();
        }
        sqlSession.close();
    }

    public static void deleteGoods(String goodsId){
        SqlSession sqlSession = MybatisUtils.getSession();
        GoodsDao goodsDao = sqlSession.getMapper(GoodsDao.class);
        int count = goodsDao.deleteGoodsById(goodsId);
        if(count != 0){
            sqlSession.commit();
        }else{
            sqlSession.rollback();
        }
        sqlSession.close();
    }
}
