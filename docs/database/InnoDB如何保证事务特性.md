[InnoDB如何保证事务特性](https://www.toutiao.com/a6745765002562519556/)

redo log重做日志用来保证事务的持久性

undo log回滚日志用来保证事务的原子性

redo log + undo log 用来保证事务的一致性

锁用来保证事务的隔离性