# JSP校园二手交易系统后台，使用AdminLTE模板
## 既然已经点进来了，不如随手点个 Star 谢谢！
## 技术点
#### JSP + Servlet + Mybatis + Mysql
## 展示
#### 登录界面
![登录界面](https://github.com/jdassd/imgRepository/blob/master/TIM%E6%88%AA%E5%9B%BE20191220192109.png)
#### 注册界面
![注册界面](https://github.com/jdassd/imgRepository/blob/master/TIM%E6%88%AA%E5%9B%BE20191220192137.png)
#### 首页
![首页](https://github.com/jdassd/imgRepository/blob/master/TIM%E6%88%AA%E5%9B%BE20191220192240.png)
#### 商品管理界面
![商品管理界面](https://github.com/jdassd/imgRepository/blob/master/TIM%E6%88%AA%E5%9B%BE20191220192329.png)
#### 编辑商品界面
![编辑商品界面](https://github.com/jdassd/imgRepository/blob/master/TIM%E6%88%AA%E5%9B%BE20191220192421.png)
## 部署
1. 项目由 Maven 构建，建议使用 IDEA 打开项目，如果和 [SchoolCampusUsed Vue+SSM的校园二手交易平台](https://github.com/jdassd/SchoolCampusUsed) 这个项目一起部署调试，建议使用 8081 端口运行这个后台项目。
2. 项目目录下有一个 plugins.zip 文件需要解压到 src/main/webapp 目录下
3. 将 sql.sql 导入到你的数据库
4. 修改 src/main/resources/mybatis-config.xml 文件里的数据库配置，将用户名和密码修改为你的用户名和密码**如果你使用的不是 Mysql 数据库，请自行修改该文件里的数据库配置，和 pom.xml 中引入的依赖**
5. 接着使用 Tomcat 打开项目就可以查看到效果

## FAQ
#### 为什么这个项目跑起来报错？
如果你的项目已经跑起来了，而不能访问到首页，你可以尝试切换 Tomcat 版本，这个项目构建时的版本为 Tomcat-8.5.46
#### 我发现这个项目有个 BUG ？
这个项目目前发现而没有解决的 BUG 有：
1. 登录界面查看输入错误的用户名或密码，或者输入的账户未启用、权限不足等，出现提示后，再点击注册会出现 404 界面。**这是因为返回提示文字到前端时，使用的是 request.forword(~)，进行请求转发后网址改变而导致访问不到注册页面。**
2. 登录页面出现提示文字后，无法在进行登录，后台也不报错？**这个问题出现率很低，因为我测试的时候没有出现过，所以我不确定这个问题的原因。**
3. 其他一些 BUG ，但基本不影响使用，这个后台本身，也没有什么价值。

## 联系 
#### 微信 And QQ
<img src="https://github.com/jdassd/imgRepository/blob/master/%E6%B7%BB%E5%8A%A0%E5%BE%AE%E4%BF%A1%E5%A5%BD%E5%8F%8B%E7%A0%81.jpg" width="200" hegiht="200" alt="微信添加好友码" /><img src="https://github.com/jdassd/imgRepository/blob/master/%E6%B7%BB%E5%8A%A0QQ%E5%A5%BD%E5%8F%8B%E7%A0%81.jpg" width="200" hegiht="200" alt="QQ添加好友码" />



## 请作者喝咖啡
<img src="https://github.com/jdassd/imgRepository/blob/master/%E5%BE%AE%E4%BF%A1%E6%94%B6%E6%AC%BE%E7%A0%81.jpg" width="200" hegiht="200" align=center alt="微信收款码"/>

