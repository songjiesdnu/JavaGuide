## ThreadLocal


### ThreadLocalMap的冲突解决方式
线性探测，而非拉链法

## InheritableThreadLocal
在`Thread`类的`init`方法里面对父线程的inheritableThreadLocals进行浅拷贝，这是实现子线程继承父线程threadlocalmap数据的关键。
`InheritableThreadLocal`类继承了ThreadLocal，重写了部分方法。

https://blog.csdn.net/v123411739/article/details/79117430
> 当一个子线程创建的时候，会把父线程的inheritableThreadLocals属性的值继承到自己的inheritableThreadLocals属性。那么现在的问题是父线程的inheritableThreadLocals
属性会有值吗？因为上文提到的ThreadLocal中，我们知道set()方法时，是把键值对放在threadLocals属性。这就要提到刚才说的InheritableThreadLocal重写的getMap()方法，因为InheritableThreadLocal类的set()和get()方法都是用的父类即ThreadLocal的方法，而从ThreadLocal的源码中我们知道，ThreadLocal的get()、set()、remove()方法都会先调用getMap()方法，而InheritableThreadLocal重写了该方法，因此此时返回的ThreadLocalMap为inheritableThreadLocals，所以我们知道了，当定义为InheritableThreadLocal时，操作的属性为inheritableThreadLocals而不是threadLocals。


## FastThreadLocal (Netty)
1、 `InternalThreadLocalMap`初始化的时候，会生成一个长度为32的Object数组。
```java
private static Object[] newIndexedVariableTable() {
        Object[] array = new Object[32];
        Arrays.fill(array, UNSET);
        return array;
    }
```

2、`FastThreadLocal`内部有个int变量`index`，其值在`FastThreadLocal`初始化的时候生成。
```java
private final int index;

    public FastThreadLocal() {
        index = InternalThreadLocalMap.nextVariableIndex();
    }
```
> `InternalThreadLocalMap.nextVariableIndex()`是对一个全局`AtomicInteger`进行+1得到。所以，初始化的`FastThreadLocal`越多，`index`值越大。

3、`FastThreadLocal`的`set`方法会根据`FastThreadLocal`的`index`值在其Object数组中设置value，如果index值大于其初始值32，则进行扩容，直到Object数组够大。

4、从上述过程能够看出来，其是通过在`FastThreadLocal`维护Object数组的下表来达到快速找到`FastThreadLocal`实例对应的位置的（时间复杂度就是O(1)）。

5、这样其实有一个问题，由于index是不断递增的，故即使线程销毁了，Object数组的大小不会变。这有潜在的内存泄漏风险，redisson之前就有这个问题。



## TransmittableThreadLocal (Alibaba)

