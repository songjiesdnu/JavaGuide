## 概念
C：一致性。意思是，写操作之后的读操作，必须返回该值。

A：可用性。意思是，只要收到用户的请求，服务器就必须给出回应。

P：分区容错性。意思是，区间通信可能失败，而分布式系统必须能够容忍这种情况。以实际效果而言，分区容错性相当于对通信的时限要求。系统如果不能在时限内达成数据一致性，就意味着发生了分区的情况。

一般来说，分区容错性无法避免，因此可以认为CAP的P总是成立的。CAP定理告诉我们，剩下的C和A无法同时做到。

## 和BASE的关系
BASE是基本可用（Base Avalable），软状态（Sofe state），最终一致性（Eventually consistent）三个短语的缩写。

BASE是对CAP中一致性（C）和可用性（A）的权衡，其来源于对大规模互联网系统分布式实践的结论，是基于CAP定理逐步演化而来的，其核心思想是即使无法做到强一致性，但每个应用都可以根据自身的业务特点，采用适当的方式来使系统达到最终一致性。

基本可用：指分布式系统在出现不可预知故障的时候，允许损失部分可用性。但是这绝不等价于系统不可用。一般是指响应时间上的损失或功能上的损失。

软状态：是指允许系统中的数据存在中间状态，并认为中间状态的存在不会影响系统的整体可用性，即允许系统在不同节点的数据副本之间进行数据同步的过程存在延时。

最终一致性：强调的是系统中所有的数据副本，在经过一段时间的同步后，最终能够达到一个一致的状态。因此，最终一致性的本质是需要系统保证最终数据能够达到一致，而不需要实时保证系统数据的强一致性。


## 实际项目中对CAP是如何考虑的？


## 参考
[百度百科-CAP原则](https://baike.baidu.com/item/CAP%E5%8E%9F%E5%88%99/5712863?fr=aladdin)

[阮一峰-CAP定理的含义](http://www.ruanyifeng.com/blog/2018/07/cap.html)