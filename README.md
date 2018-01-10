Bxs 是“百晓生”的中文拼音首字符简写，起源于自己想做一个“排行榜”网站，放一些新奇好玩的东西。
==

1、初始化成一个Maven项目；  
==
&nbsp;1)bxs-parent:全局的配置,公司级别的,管理依赖的jar包版本；  
&nbsp;2)bxs-commmon:是一个通用组件，工具类，继承于bxs-parent;  
&nbsp;3)bxs-manager:是一个聚合工程的后台系统，继承于bxs-parent,依赖于bxs-common;  
&nbsp;&nbsp;(1)bxs-manager-pojo:是一个Maven构建的组件，用于管理实体类；  
&nbsp;&nbsp;(2)bxs-manager-jdbc:是一个Maven构建的组件，用于管理数据层，依赖于bxs-manager-pojo；  
&nbsp;&nbsp;(3)bxs-manager-service:是一个Maven构建的组件，用于管理服务层,依赖于bxs-manager-jdbc;  
&nbsp;&nbsp;(4)bxs-manager-web：是一个Maven构建的组件，用于管理控制层；  

2、项目的日志配置；  
==
&nbsp;1)使用SLF4J和Log4j 进行日志记录，后期会使用logback替换Log4j,jar包配置参见pbxs-parent中的pom.xml中日志配置；  
&nbsp;2)SLF4J(Simple logging Facade for Java)不是一个真正的日志实现，而是一个抽象层（ abstraction layer），它允许你在后台使用任意一个日志类库; 

3、访问数据库；
==
&nbsp;1)在bxs-manager-jdbc项目pom.xml中添加mysql和数据库连接池驱动jar包配置;  

4、关于Spring的注解疑问；
==
&nbsp;1)问曰：@service这个注解是标注在接口上还是接口的实现类上？  
&nbsp;&nbsp;答曰：@Service注解是标注在实现类上的，因为@Service是把spring容器中的bean进行实例化，也就是等同于new操作，只有实现类是可以进行new实例化的，而接口则不能，所以是加在实现类上的;但是，值得一提的是，在controller层注入的是接口，而非实现类。

5、常见问题记录；
==
1、406 Not Acceptable ，访问/user/list时出现该错误，检查发现正常引用了Json的相关包,但是仍然出现改错误，后发现spring-mvc.xml中没有配置 <mvc:annotation-driven /> ,添加该配置后，正常返回json数据；  
