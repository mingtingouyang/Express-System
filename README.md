# Express-System
[![GitHub issues](https://img.shields.io/github/issues/mingtingouyang/Express-System)](https://github.com/mingtingouyang/Express-System/issues)
[![GitHub forks](https://img.shields.io/github/forks/mingtingouyang/Express-System)](https://github.com/mingtingouyang/Express-System/network)
[![GitHub license](https://img.shields.io/github/license/mingtingouyang/Express-System)](https://github.com/mingtingouyang/Express-System/blob/master/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/mingtingouyang/Express-System)](https://github.com/mingtingouyang/Express-System/stargazers)

- [介绍](#介绍)
- [特点](#特点)
- [细节介绍](#细节介绍)
- [使用](#使用)
- [测试体验](#测试体验)
- [备注](#备注)

## 介绍
使用 spring boot，基于 ssm 框架和 shiro 安全框架，开发的一个物流管理系统。前端使用的是 H-ui 开源框架，运用了 Bootstrap table、zTree、PageHelper、jQuery validate 等插件。

## 特点
1. 基于 spring boot、maven 构建；
2. 运用了 spring、spring mvc、mybatis 和 shiro 框架；
3. 采用了 RBAC 的思路设计系统，采用了 Mysql 作为数据库支持；
4. 不同的角色登录系统会有不同的菜单列表，且会根据角色返回特定的数据；
5. 拥有基础数据管理模块，管理员管理模块，角色管理模块，权限管理模块，客户管理模块，订单管理模块和业务处理模块；
6. 能够实现完整的业务流程：添加客户、添加订单、订单处理、财务报表。

## 细节介绍
1. 业务员访问时，只能访问客户管理、订单管理、业务处理菜单，且只有添加的权力，没有修改和删除的权力；
2. 业务员添加订单时，只能基于自己拥有的客户添加；
3. 业务经理拥有客户管理、订单管理、业务处理的所有功能，可以查看所有业务员的客户和订单；
4. 总经理角色可以查看所有数据，但是没有修改的权力；
5. 仓管员只有业务处理中，测量物品信息和入库的功能，其他数据不可修改；
6. 财务可以查看审核订单价格详情并导出为 excel 表格。

## 使用
需要的运行环境：

1. JDK 1.8；
2. Maven；
3. Tomcat 8；
4. mysql。

使用前修改 application.properties 里的数据库的连接信息即可。可以通过 dataBase 目录下的 sql 文件创建所需要的表，数据库名字为 logistic_system。

## 测试体验
物流管理系统部署在在 Linux 云服务器上，可用前往体验，可以添加数据，但请勿删除和修改任何数据。[访问链接](http://ozaaa.cn/logistic/)

> username:admin
>
> password:123456

## 备注
该系统为个人学习过程中独自开发，页面设计较为单一，主要是为了实现后台的功能设计，如果有意见欢迎大家提出，谢谢！
