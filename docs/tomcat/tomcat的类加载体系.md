## CommonClassLoader、CatalinaClassLoader和SharedClassLoader

### 如何保证common.loader所指定目录和jar里的类由CommonClassLoader加载？
首先，看一个通过tomcat进程的启动参数：
```shell
work      15526      1  2 Mar28 ?        17:21:17 /usr/java/jdk1.8.0_212/bin/java 
-Djava.util.logging.config.file=/home/work/conf/logging.properties 
-Djava.util.logging.manager=org.apache.juli.ClassLoaderLogManager 
-Xmx1024m -Xms1024m -Duser.timezone=GMT+08 -Dorg.jboss.logging.provider=slf4j -Dport.http.nonssl=8080 
-javaagent:/usr/local/prometheus/jmx/jmx_prometheus_javaagent-0.11.0.jar=9151:/usr/local/prometheus/jmx/config.yaml 
-Djdk.tls.ephemeralDHKeySize=2048 -Djava.protocol.handler.pkgs=org.apache.catalina.webresources 
-javaagent:/home/work/webapps/ROOT/bpm-agent.jar -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -Dignore.endorsed.dirs= 
-classpath /home/work/bin/bootstrap.jar:/home/work/bin/tomcat-juli.jar 
-Dcatalina.base=/home/work -Dcatalina.home=/home/work -Djava.io.tmpdir=/home/work/temp 
org.apache.catalina.startup.Bootstrap start
```
这里重点看下其对classpath的设置`-classpath /home/work/bin/bootstrap.jar:/home/work/bin/tomcat-juli.jar`

意思是只有这两个jar包里的class会被Application ClassLoader加载，当然由于JVM类加载器的双亲委派机制，`JRE/lib/rt.jar`和`JRE/lib/ext/*.jar`
中的class会分别被BootStrap类加载器和ExtClassLoader类加载器加载。其他类就按照tomcat所设计的类加载体系进行加载。


详细展开说下：

`catalina.properties`配置文件里的`common.loader=${catalina.base}/lib,${catalina.base}/lib/*.jar,${catalina.home}/lib,${catalina.home}/lib/*.jar`
指定了CommonClassLoader加载的类。

1、loadClass方法

CommonClassLoader、CatalinaClassLoader和SharedClassLoader均未重写loadClass方法。

2、findClass方法

由于tomcat这个java进程启动的时候，classpath里没有`common.loader`所指定的class文件，故通过`loadClass`里的双亲委派逻辑加载不到这些class。
故会进到`findClass`方法加载类。tomcat里的CommonClassLoader、CatalinaClassLoader和SharedClassLoader均继承自URLClassLoader，
URLClassLoader的findClass方法实现了从这些jar包里加载类的逻辑。

## WebAppClassLoader
对于WebAppClassLoader，其对loadClass和findClass方法都进行了重写。loadClass方法的逻辑是：先使用系统类加载器对类进行加载，
加载不到再使用WebAppClassLoader进行加载。

Tomcat在加载webapp级别的类的时候，默认是不遵守parent-first的，这样做的好处是更好的实现了应用的隔离，但是坏处就是加大了内存浪费，同样的类库要在不同的app中都要加载一份。


## 参考资料
[Tomcat类加载器机制（Tomcat源码解析六）](https://blog.csdn.net/jiaomingliang/article/details/47416007)