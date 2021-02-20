<h1>如何通过Java反射获取泛型类型信息</h1>

<h3>前言</h3>

关于Java泛型，很多人都有一个误解，认为Java代码在编译时会擦除泛型的类型，从而在运行时导致没法访问其类型，这其实并不完全正确，因为有一部分泛型信息是可以在运行时动态获取的，这部分信息基本能够满足我们日常开发中的大多数场景，本篇文章我们就来了解相关的知识。

### 泛型的使用场景

在讨论如何用反射获取泛型类型之前，我们先来回顾下，在Java里面什么时候会使用泛型，了解这个问题之后，我们才能继续思考如何用反射获取泛型类型。

在Java里面使用泛型通用会应用在两个场景：

（1）声明一个类或者接口时使用泛型 比如，Java里面的List接口，其定义如下：

```java
public interface List<E> extends Collection<E> {//......}
```

（2）在类里面使用一个泛型类

比如在Java的LinkedList的源码中，有两个成员变量定义如下，分别代表链表的头和尾：

```java
transient Node<E> first;    transient Node<E> last;
```

ok，在上面的两种场景中，第一种场景在类和接口上声明的泛型，在运行时反射该类，是没法知道其参数信息的，包括对象本身也不知道它的泛型是什么。

但类似第二种场景中通过对象的指针引用，我们是可以通过反射获取其泛型的类型信息的，但要注意局部变量是没法获取其泛型信息的。

**在Java里面可以通过反射获取泛型信息的场景有三个，分别是：**

**（1）成员变量的泛型**

**（2）方法参数（形参）的泛型**

**（3）方法返回值的泛型**

注意，通过对象本身也是没法获取的。

不能通过反射获取泛型类型信息的场景有二个，分别是：

（1）类或接口声明的泛型信息

（2）局部变量的泛型信息

**示例代码**

```java
/**
 * @(#)MyClass.java, 2月 20, 2021.
 * <p>
 * Copyright 2021 fenbi.com. All rights reserved.
 * FENBI.COM PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package info.songjie.study.java.generics;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

/**
 * @author songjie
 */
public class MyClass {

    public List<String> stringList = new ArrayList<>();


    public List<String> getStringList() {
        return this.stringList;
    }

    public void setList(List<Integer> list) {
    }


    /**
     * 获取方法返回值的泛型类型信息
     *
     * @throws Exception
     */
    public static void getMethodReturnType() throws Exception {
        Method method = MyClass.class.getMethod("getStringList", null);
        System.out.println("MethodReturnType:" + method.getReturnType());
        Type returnType = method.getGenericReturnType();
        System.out.println("MethodGenericReturnType:" + returnType);
        if (returnType instanceof ParameterizedType) {
            ParameterizedType type = (ParameterizedType) returnType;
            Type[] typeArguments = type.getActualTypeArguments();
            for (Type typeArgument : typeArguments) {
                Class typeArgClass = (Class) typeArgument;
                System.out.println("泛型类型：" + typeArgClass);
            }
        }
    }

    /**
     * 获取成员变量的泛型类型信息
     *
     * @throws Exception
     */
    public static void getGenericFieldTypes() throws Exception {
        Field field = MyClass.class.getField("stringList");
        Type genericsFieldType = field.getGenericType();
        if (genericsFieldType instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) genericsFieldType;
            Type[] fieldArgTypes = parameterizedType.getActualTypeArguments();
            for (Type fieldArgType : fieldArgTypes) {
                Class fieldArgClass = (Class) fieldArgType;
                System.out.println("泛型字段的类型：" + fieldArgClass);
            }
        }
    }

    /**
     * 获取方法参数的泛型类型信息
     *
     * @throws Exception
     */
    public static void getMethodParameterTypes() throws Exception {
        Method method = MyClass.class.getMethod("setList", List.class);
        Type[] genericParameterTypes = method.getGenericParameterTypes();
        for (Type genericType : genericParameterTypes) {
            if (genericType instanceof ParameterizedType) {
                ParameterizedType parameterizedType = (ParameterizedType) genericType;
                Type[] types = parameterizedType.getActualTypeArguments();
                for (Type type : types) {
                    Class realType = (Class) type;
                    System.out.println("方法参数的类型：" + realType);
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        getGenericFieldTypes();
        System.out.println("==========");
        getMethodParameterTypes();
        System.out.println("==========");
        getMethodReturnType();
    }
}
```

运行结果：

```text
泛型字段的类型：class java.lang.String
==========
方法参数的类型：class java.lang.Integer
==========
MethodReturnType:interface java.util.List
MethodGenericReturnType:java.util.List<java.lang.String>
泛型类型：class java.lang.String
```



### 总结

本文主要介绍了如何使用反射来获取部分泛型参数的类型信息，并介绍了那些场景不能使用反射获取其类型信息，通过反射获取参数的类型的泛型信息其实是非常有用的一个功能，比如在一些json工具的开源包里面，可以对Java里面泛型的各种List，List等类型做正确识别，其实就是利用反射的这个功能，从而让解析代码具有更强的通用型，可以将对象转成字符串json，也可以从字符串中恢复成bean对象，足见这个功能的强大之处，值得我们取学习，了解和使用。



=======================

参考：https://www.jianshu.com/p/cb8ff202797c

## 获取实参的泛型参数（内部类）

> Java在编译的时候，会对**方法实参以及方法内部**进行泛型擦除（即用泛型实参上限代替真实的泛型类型）。但是泛型信息会保持在Signature中。故反射 不能获取到泛型对象。

**如下源码，我们获取不到data数据的泛型类型**

```java
public void testGenericType(List<T> data) {
        //如何获取data传入的是泛型类型
        Class<?> aClass = data.getClass();
        //Class实现了Type接口
        Type aType = aClass;
        //判断aType是否有泛型(返回false)
        System.out.println(aType instanceof ParameterizedType);
}
```

**修改使用匿名类获取：**

```
public void testGenericType(List<T> data) {
        //如何获取data传入的是泛型类型
        Class<?> aClass = data.getClass();
        //Class实现了Type接口
        Type aType = aClass.getGenericSuperclass();
        System.out.println(((ParameterizedType)aType).getActualTypeArguments());
        //判断aType是否有泛型(返回false)
        System.out.println(aType instanceof ParameterizedType);
    }

    public static void main(String[] args) {
        Test test = new Test();
        List<String> list = new ArrayList<String>(){};
        test.testGenericType(list);
    }
```



=================

参考：https://blog.csdn.net/u010606397/article/details/82928438

***因为java语言的泛型采用的是擦除法实现的伪泛型，在字节码（Code属性）中，泛型信息（类型变量、参数化类型）编译之后都通通被擦除掉。因此，对于运行期的Java语言来说，List<String>、List<Integer>是同一个类。***

***为了弥补擦除的不足，新增了Signature属性。Signature属性的作用是存储一个方法在字节码层面的特征签名，这个属性保存的参数类型不是原生类型，而是包括了参数化类型的信息。***



![](/Users/songjie/Documents/01coding/01private/JavaGuide/docs/java/泛型/img/泛型signature.jpeg)

================

参考：https://muyig.github.io/blog/2020/01/10/TypeReference/

通过匿名内部类获取泛型信息的一个应用是fastjson里的TypeReference。

- 由于 Java 的类型擦除机制，如果直接传泛型类型给 fastjson，会导致获取不到真实的运行类型而反序列化失败。
- fastjson 提供了一个 TypeReference 类专门用于处理泛型类型。
- TypeReference 的机制是创建一个目标类型的匿名子类，再调用 Class.getGenericSuperclass 方法获取到真实泛型类型。
- Class.getGenericSuperclass 方法的原理是读取 Class 文件里的 Signature 属性。
- Signature 属性是泛型类型的一个特有属性，存储了源码里声明的泛型类型，如果编译期没有指明，那这个字段存储的就是擦除之后的类型。
- 在泛型擦除机制下，Java 依旧无法在运行时动态获取泛型类的真实类型参数，TypeReference 里取到的类型信息其实是在编译期确定的。