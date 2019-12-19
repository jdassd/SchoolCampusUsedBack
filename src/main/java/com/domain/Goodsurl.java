package com.domain;

import java.io.Serializable;

public class Goodsurl implements Serializable {
    private String goodsId;
    private String imgUrl;

    @Override
    public String toString() {
        return "Goodsurl{" +
                "goodsId='" + goodsId + '\'' +
                ", imgUrl='" + imgUrl + '\'' +
                '}';
    }

    public Goodsurl(String goodsId, String imgUrl) {
        this.goodsId = goodsId;
        this.imgUrl = imgUrl;
    }

    public Goodsurl() {
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }
}
