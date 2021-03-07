## hyperloglog
基数计数
```text
PFADD
PFCOUNT
PFMERGE
```

```text
基本原理的个人理解：
伯努利实验。
数量特别小的时候，误差很大。
```

```text
使用场景：
1、统计网站的PV UV。
```

hyperloglog原理：[HyperLogLog 算法的原理讲解以及 Redis 是如何应用它的](https://juejin.im/post/5c7900bf518825407c7eafd0)

## bloomfilter
布隆过滤器
```text

```
```text
使用场景：
1、防止缓存穿透。
2、判断用户是否阅读过某视频或文章。
```


[Redis 高级主题之布隆过滤器(BloomFilter)](https://juejin.im/post/5cfd060ee51d4556f76e8067)

## geohash
地理位置
```text
GEOADD
GEODIST
GEOHASH
GEOPOS
GEORADIUS
GEORADIUSBYMEMBER
```
geohash原理：[高效的多维空间点索引算法 — Geohash 和 Google S2](https://halfrost.com/go_spatial_search/)

## bitmap
```text
SETBIT
GETBIT
BITCOUNT
BITOP
BITPOS
BITFIELD
```
```text
使用场景：
1、用户签到。
2、统计活跃用户。按照天记录活跃用户，然后通过BITOP的AND运算，可计算出周活跃和月活跃用户等。
```

## stream
支持多播的可持久化的消息队列

[Redis 5.0 新特性 Stream 尝鲜](https://toutiao.io/posts/2agvp3/preview)

[Redis Streams，Redis Pub/Sub 和 Kafka 比较，同步和异步通信该选谁？](https://www.infoq.cn/article/d50KrBOzW3kDoW1eU3YW)