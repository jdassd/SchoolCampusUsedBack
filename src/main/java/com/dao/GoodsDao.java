package com.dao;

import com.domain.Goods;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface GoodsDao {
    /*添加功能*/
    //新建商品信息
    @Insert("insert into goods values(#{userId},#{goodsId},#{dscrip},#{price},#{goodsLevel},#{upStatus},#{useStatus},#{hot},#{name})")
    int createGoods(Goods goods);

    /*修改功能*/
    //根据商品ID修改商品介绍信息
    @Update("update goods set dscrip = #{dscrip} where goods_id = #{goodsId}")
    int changeDescriById(@Param("goodsId") String goodsId,@Param("dscrip") String dscrip);
    //根据商品ID修改商品价格信息
    @Update("update goods set price = #{price} where goods_id = #{goodsId}")
    int changePriceById(@Param("goodsId") String goodsId,@Param("price") double price);
    //根据商品ID修改商品名称信息
    @Update("update goods set name = #{name} where goods_id = #{goodsId}")
    int changeNameById(@Param("goodsId") String goodsId,@Param("name") String name);
    //根据商品ID修改商品新旧程度信息
    @Update("update goods set goods_level = #{goodsLevel} where goods_id = #{goodsId}")
    int changeLevelById(@Param("goodsId") String goodsId,@Param("goodsLevel") double goodsLevel);
    //根据商品ID修改商品上架状态信息
    @Update("update goods set up_status = #{upStatus} where goods_id = #{goodsId}")
    int changeUpStatusById(@Param("goodsId") String goodsId,@Param("upStatus") int upStatus);
    //根据商品ID修改商品可用状态信息
    @Update("update goods set use_status = #{useStatus} where goods_id = #{goodsId}")
    int changeUseStatusById(@Param("goodsId") String goodsId,@Param("useStatus") int useStatus);
    //根据商品ID修改商品热度信息
    @Update("update goods set hot = #{hot} where goods_id = #{goodsId}")
    int changeHotById(@Param("goodsId") String goodsId,@Param("hot") double hot);

    /*删除功能*/
    //根据商品ID删除商品
    @Delete("delete from goods where goods_id = #{goodsId}")
    int deleteGoodsById(String goodsId);

    /*查询功能*/
    //根据商品ID查询商品
    @Select("select * from goods where goods_id = #{goodsId}")
    Goods findOneById(String goodsId);
    //根据商品昵称模糊匹配查询商品集合
    @Select("select * from goods where name like #{nameLike}")
    List<Goods> findAllByNameAlike(String nameLike);
    //根据商品价位区间查询商品集合
    @Select("select * from goods where price <= #{start} and price >= #{end}")
    List<Goods> findAllByPriceRange(@Param("start") double start,@Param("end") double end);
    //根据用户ID查询商品集合
    @Select("select * from goods where user_id = #{userId}")
    List<Goods> findAllByUserId(String userId);
    //根据商品新旧程度查询商品集合
    @Select("select * from goods where goods_level = #{level}")
    List<Goods> findAllByLevel(double level);
    //根据商品热度信息排序查询商品集合
    @Select("select * from goods where hot = #{hot}")
    List<Goods> findAllSortListByHot(double hot);
    //查询所有商品集合
    @Select("select * from goods")
    List<Goods> findAll();
    //查询总数
    @Select("select count(*) from goods")
    int findCount();
}
