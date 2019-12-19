package com.dao;

import com.domain.Goodsurl;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GoodsurlDao {
    /*添加功能*/
    //添加商品图片信息
    @Insert("insert into goodsurl values(#{goodsId},#{imgUrl})")
    int createGoodsurl(Goodsurl goodsurl);

    /*修改功能*/
    //根据URL-ID修改商品图片URL地址信息
    @Update("update goodsurl set img_url = #{imgUrl} where img_id = #{urlId}")
    int changeUrlByUrlId(@Param("urlId") String urlId,@Param("imgUrl") String imgUrl);

    /*删除功能*/
    //根据商品ID删除所有图片信息
    @Delete("delete from goodsurl where goods_id = #{goodsId}")
    int deleteAllByGoodsId(String goodsId);
    //根据URL-ID删除商品单个图片信息
    @Delete("delete from goodsurl where img_id = #{urlId}")
    int deleteOneByUrlId(String urlId);

    /*查询功能*/
    //根据商品ID查询所有图片信息
    @Select("select * from goodsurl where goods_id = #{goodsId}")
    List<Goodsurl> findAllByGoodsId(String goodsId);
    //根据URL-ID查询单个图片信息
    @Select("select * from goodsurl where img_id = #{urlId}")
    Goodsurl findOneByUrlId(String urlId);
}
