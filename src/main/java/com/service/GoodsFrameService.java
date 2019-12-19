package com.service;

import com.dao.GoodsDao;
import com.domain.Goods;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.utils.MybatisUtils;
import org.apache.ibatis.session.SqlSession;
import java.util.List;

public class GoodsFrameService {
    public static String getJson() throws JsonProcessingException {
        //    获取商品名称、商品ID、用户ID、商品新旧程度、上架状态、可用状态
        SqlSession sqlSession = MybatisUtils.getSession();
        GoodsDao goodsDao = sqlSession.getMapper(GoodsDao.class);
        List<Goods> list = goodsDao.findAll();
        sqlSession.close();
        ObjectMapper objectMapper = new ObjectMapper();
        String json = objectMapper.writeValueAsString(list);
        //System.out.println(json);
        return json;
    }
}
