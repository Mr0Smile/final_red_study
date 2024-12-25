
# 红色学习后端介绍

## 主要技术栈和工具

1. **Java 21** :
   * 项目使用的是Java编程语言的第21个主要版本。
2. **Spring Boot 3.3.4** :
   * 项目是基于Spring Boot框架构建的，这是一个用于创建独立的、生产级别的基于Spring的应用程序的框架。它简化了配置，并提供了自动配置功能来快速启动开发。
   * 使用了 `spring-boot-starter-web`依赖，表明这是一个Web应用程序，可能会提供RESTful服务或传统的MVC Web应用。
3. **MyBatis 3.0.3** :
   * MyBatis是一个持久层框架，它能够将SQL映射到Java对象中，支持定制化SQL语句、存储过程及高级映射。
4. **MySQL** :
   * 数据库方面选择了MySQL作为关系型数据库管理系统（RDBMS），并使用了 `mysql-connector-j`驱动来进行连接。
5. **Hutool** :
   * Hutool是一个Java工具包，提供了大量的实用工具方法，可以简化日常开发任务，如日期处理、文件操作等。
6. **PageHelper** :
   * 这是一个分页插件，适用于MyBatis及其Spring Boot Starter，用来简化在查询结果中实现分页逻辑的过程。
7. **Lombok** (被排除)：
   * 虽然Lombok本身被从构建过程中排除，但它通常用于减少样板代码，比如通过注解自动生成getter/setter等。
8. **Maven** :
   * Maven是一个项目管理和构建自动化工具，用于管理项目的构建、报告和文档。
