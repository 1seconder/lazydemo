<<<<<<< HEAD
Spring Boot CXF 集成
===========================

Spring Boot 集成 CXF, 一个专门的 JAX-RS框架.

## 使用 ##

把以下的依赖驾到 `pom.xml` (把 `<version>`更新成新环境其他项目使用版本):

    <dependency>
        <groupId>com.internetitem.spring</groupId>
        <artifactId>spring-boot-cxf-jaxrs</artifactId>
        <version>1.1</version>
    </dependency>

所有加了注解为`@Path`的Bean 会自动被加载为 JAX-RS Services. 所有加了注解为`@Provider`的Bean 会自动被加载为JAX-RS Providers.

## 依赖 ##

你需要定义如下依赖：Spring, Spring Boot and CXF. CXF会自动引入Jackson (JSON支持).

## 自定义 ##
*如Java类com.newenv.microservice.stereotype.configuration.APPConfiguration所示 spring bean 的配置可以加载到APPConfiguration类中。
 *  `cxf.path`属性 可以用来定义 CXF Servlet在哪里加载. 默认的  相对地址是   "`/services/*`"
 * 如果设置了   `cxf.log.requests` 属性,每个请求都会被记录到日志。
 * 如果Spring context里注册了个一 类型为   `JacksonJsonProvider` 的 SPRING Bean  (比如   `JacksonJaxbJsonProvider`) , 这个Bean会取代内置的Jackson Provider.
 * 如果Spring context里注册了个一 类型为   `ObjectMapper` 的Bean, 这个Bean会取代内置的ObjectMapper.
 * 如上Spring context里还配置了mysql数据源和基于NUTZ DAO的数据访问层.NUTZ DAO的文档在此连接http://www.nutzam.com/core/nutz_preface.html
 
## 安装运行 ##
1.在项目上运行mvn clean install
2.在com.newenv.microservice.stereotype.tomcat.SampleTomcatApplication上点击鼠标右键->run as java application

## 测试 ##
程序运行起来后本项目模板自带的服务接口测试URL为
http://localhost:8080/services/guestProfileService/guestProfile/name/joeli
文件上传URL为：
http://localhost:8080/fileUpload.html

运行支持热加载的的java应用
在linux命令行运行如下命令。Java 类加载的位置可以改变
注意在运行前要用IDE的工具吧该项目所依赖的所有jar包导出到一个目录，这样便于维护。否则也可以写配置文件，指向依赖jar包所在的不同目录。我用的ide是jboss的developer studio.
java -javaagent:./springloaded-1.2.5.RELEASE.jar -noverify -cp "./*:./microservice-stereotype-1.0/"  com.newenv.microservice.stereotype.tomcat.SampleTomcatApplication
## 开发 ##
在com.newenv.microservice.stereotype.services目录里如GuestProfileService建立服务类。在服务类里用@autowired注入NUTZDAO。NUTZDao支持直接运行sql返回map无需定义和实体的回应的dao service。例子看nutz的官方文档。



=======
# lazydemo
this is a demo
>>>>>>> aa6433be91419cf20278114adc5d4e74917df3a7
