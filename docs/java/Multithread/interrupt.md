### 一、Thread类里和中断有关的三个方法
#### 1. interrupt()方法
> 
```java
/**
* Interrupts this thread.
  Unless the current thread is interrupting itself, which is always permitted, the checkAccess method of this thread is invoked, which may cause a SecurityException to be thrown.
  If this thread is blocked in an invocation of the wait(), wait(long), or wait(long, int) methods of the Object class, or of the join(), join(long), join(long, int), sleep(long), or sleep(long, int), methods of this class, then its interrupt status will be cleared and it will receive an InterruptedException.
  If this thread is blocked in an I/O operation upon an InterruptibleChannel then the channel will be closed, the thread's interrupt status will be set, and the thread will receive a java.nio.channels.ClosedByInterruptException.
  If this thread is blocked in a java.nio.channels.Selector then the thread's interrupt status will be set and it will return immediately from the selection operation, possibly with a non-zero value, just as if the selector's wakeup method were invoked.
  If none of the previous conditions hold then this thread's interrupt status will be set.
  Interrupting a thread that is not alive need not have any effect.
  
  Throws:
  SecurityException – if the current thread cannot modify this thread
*/
public void interrupt() {
    if (this != Thread.currentThread())
        checkAccess();

    synchronized (blockerLock) {
        Interruptible b = blocker;
        if (b != null) {
            interrupt0();           // Just to set the interrupt flag
            b.interrupt(this); // 调用如 I/O 操作定义的中断方法
            return;
        }
    }
    interrupt0();
}
```
interrupt0()是私有的native方法
```java
private native void interrupt0();
```
***注意查看interrupt方法的注释，下面对第3段注释简单解释下***

***如果线程阻塞于Object的wait(), wait(long), or wait(long, int)方法，或者阻塞于Thread的join(), join(long), join(long, int), sleep(long),
sleep(long, int)方法，则调用该线程的interrupt()方法，会抛出InterruptedException***
其中wait和sleep有关方法都是native的，join有关方法是通过wait有关方法实现的。
查看wait和sleep有关方法的注释可以发现，当线程阻塞于这些方法的时候，调用该线程的interrupt方法，会抛出会抛出InterruptedException。故join方法也一样。


#### 2. isInterrupted()方法

```java
/**
* Tests whether this thread has been interrupted. The interrupted status of the thread is unaffected by this method.
  A thread interruption ignored because a thread was not alive at the time of the interrupt will be reflected by this method returning false.
  
  Returns:
  true if this thread has been interrupted; false otherwise.
  See Also:
  interrupted()
  External annotations:
  @org.jetbrains.annotations.Contract(pure = true)
*/
public boolean isInterrupted() {
    return isInterrupted(false);
}
```
调用了私有方法`isInterrupted(boolean ClearInterrupted)`，该方法是一个native方法
```java
/**
* Tests if some Thread has been interrupted. The interrupted state is reset or not based on the value of ClearInterrupted that is passed.
*/
private native boolean isInterrupted(boolean ClearInterrupted);
```

#### 3. interrupted()方法
> 有个疑问：该方法为什么是static的，或者或isInterrupted()方法为什么不是static的?
> 
> 答：该方法用于检测当前线程是否被中断，并且清除中断标志。如果不是static的，则其他线程也可以清除该线程的中断标志，这和该方法的逻辑不符（该方法是清除当前线程的中断标志，而非其他线程的中断标志）。
> 参考：[https://stackoverflow.com/questions/14132409/java-confusion-about-thread-interrupted](https://stackoverflow.com/questions/14132409/java-confusion-about-thread-interrupted)

```java
/**
* Tests whether the current thread has been interrupted. The interrupted status of the thread is cleared by this method. In other words, if this method were to be called twice in succession, the second call would return false (unless the current thread were interrupted again, after the first call had cleared its interrupted status and before the second call had examined it).
  A thread interruption ignored because a thread was not alive at the time of the interrupt will be reflected by this method returning false.
  
  Returns:
  true if the current thread has been interrupted; false otherwise.
*/
public static boolean interrupted() {
    return currentThread().isInterrupted(true);
}
```

### 参考
[java interrupt-掘金](https://juejin.im/post/5c876d19f265da2dc675f50e)