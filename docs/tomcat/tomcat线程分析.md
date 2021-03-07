## 线程堆栈（未接受请求）
```text
-- ajp bio异步请求超时时间扫描线程
"ajp-bio-8009-AsyncTimeout" #19 daemon prio=5 os_prio=31 tid=0x00007fdd40b9f800 nid=0x5603 waiting on condition [0x000070000d85e000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
        at java.lang.Thread.sleep(Native Method)
        at org.apache.tomcat.util.net.JIoEndpoint$AsyncTimeout.run(JIoEndpoint.java:148)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None

-- ajp bio等待接收socket连接
"ajp-bio-8009-Acceptor-0" #18 daemon prio=5 os_prio=31 tid=0x00007fdd40b9e800 nid=0xa603 runnable [0x000070000d75b000]
   java.lang.Thread.State: RUNNABLE
        at java.net.PlainSocketImpl.socketAccept(Native Method)
        at java.net.AbstractPlainSocketImpl.accept(AbstractPlainSocketImpl.java:409)
        at java.net.ServerSocket.implAccept(ServerSocket.java:545)
        at java.net.ServerSocket.accept(ServerSocket.java:513)
        at org.apache.tomcat.util.net.DefaultServerSocketFactory.acceptSocket(DefaultServerSocketFactory.java:60)
        at org.apache.tomcat.util.net.JIoEndpoint$Acceptor.run(JIoEndpoint.java:216)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None

-- http bio异步请求超时时间扫描线程
"http-bio-8080-AsyncTimeout" #17 daemon prio=5 os_prio=31 tid=0x00007fdd40b9e000 nid=0xa803 waiting on condition [0x000070000d658000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
        at java.lang.Thread.sleep(Native Method)
        at org.apache.tomcat.util.net.JIoEndpoint$AsyncTimeout.run(JIoEndpoint.java:148)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None

-- http bio等待接收socket连接
"http-bio-8080-Acceptor-0" #16 daemon prio=5 os_prio=31 tid=0x00007fdd40b9c800 nid=0x5503 runnable [0x000070000d555000]
   java.lang.Thread.State: RUNNABLE
        at java.net.PlainSocketImpl.socketAccept(Native Method)
        at java.net.AbstractPlainSocketImpl.accept(AbstractPlainSocketImpl.java:409)
        at java.net.ServerSocket.implAccept(ServerSocket.java:545)
        at java.net.ServerSocket.accept(ServerSocket.java:513)
        at org.apache.tomcat.util.net.DefaultServerSocketFactory.acceptSocket(DefaultServerSocketFactory.java:60)
        at org.apache.tomcat.util.net.JIoEndpoint$Acceptor.run(JIoEndpoint.java:216)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None

-- 后台扫描线程，比如会扫描session是否失效
"ContainerBackgroundProcessor[StandardEngine[Catalina]]" #15 daemon prio=5 os_prio=31 tid=0x00007fdd40b9b800 nid=0x3e03 waiting on condition [0x000070000d452000]
   java.lang.Thread.State: TIMED_WAITING (sleeping)
        at java.lang.Thread.sleep(Native Method)
        at org.apache.catalina.core.ContainerBase$ContainerBackgroundProcessor.run(ContainerBase.java:1508)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None

-- main线程阻塞在接收socket连接上，这个serversocket监听的8005端口，即shutdown端口
"main" #1 prio=5 os_prio=31 tid=0x00007fdd3f80a800 nid=0xe03 runnable [0x000070000c115000]
   java.lang.Thread.State: RUNNABLE
        at java.net.PlainSocketImpl.socketAccept(Native Method)
        at java.net.AbstractPlainSocketImpl.accept(AbstractPlainSocketImpl.java:409)
        at java.net.ServerSocket.implAccept(ServerSocket.java:545)
        at java.net.ServerSocket.accept(ServerSocket.java:513)
        at org.apache.catalina.core.StandardServer.await(StandardServer.java:468)
        at org.apache.catalina.startup.Catalina.await(Catalina.java:781)
        at org.apache.catalina.startup.Catalina.start(Catalina.java:727)
        at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.lang.reflect.Method.invoke(Method.java:498)
        at org.apache.catalina.startup.Bootstrap.start(Bootstrap.java:349)
        at org.apache.catalina.startup.Bootstrap.main(Bootstrap.java:475)

   Locked ownable synchronizers:
        - None
```
这时还未接收任何请求，去除tomcat无关的线程，就剩下6个线程。

注意观察各个线程的状态。阻塞在accept调用上的线程，其状态都是RUNNABLE；调用sleep方法，会进入到TIMED_WAITING (sleeping)。

> jvm线程状态的改变，往往只和jvm自身的机制有关。比如，调用了sleep方法，则线程状态由RUNNALBE转换成TIMED_WAITING (sleeping)
；但是由于调用accept方法阻塞等待socket连接，并不会导致线程状态的改变。

## 线程堆栈（接受请求）
增加了如下10个线程（http-bio-8080-exec-1 ~ http-bio-8080-exec-10）

```text
"http-bio-8080-exec-10" #31 daemon prio=5 os_prio=31 tid=0x00007fdd3f344800 nid=0x9c03 waiting on condition [0x000070000e179000]
   java.lang.Thread.State: WAITING (parking)
        at sun.misc.Unsafe.park(Native Method)
        - parking to wait for  <0x000000079df33680> (a java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject)
        at java.util.concurrent.locks.LockSupport.park(LockSupport.java:175)
        at java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.await(AbstractQueuedSynchronizer.java:2039)
        at java.util.concurrent.LinkedBlockingQueue.take(LinkedBlockingQueue.java:442)
        at org.apache.tomcat.util.threads.TaskQueue.take(TaskQueue.java:104)
        at org.apache.tomcat.util.threads.TaskQueue.take(TaskQueue.java:32)
        at java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1074)
        at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1134)
        at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)
        at java.lang.Thread.run(Thread.java:748)

   Locked ownable synchronizers:
        - None
```
在没有请求需要处理的时候，线程池中的线程是通过LockSupport.park方法挂起的，故线程状态由RUNNABLE转换成WAITING (parking)。