## spring bean的生命周期
1. 实例化BeanFactoryPostProcessor实现类。
2. 执行BeanFactoryPostProcessor的postProcessBeanFactory方法。
3. 实例化BeanPostProcessor实现类。
4. 实例化InstantiationAwareBeanPostProcessor实现类。
5. 执行InstantiationareBeanPostProcessor的postProcessBeforeInstantiation方法。
6. 执行Bean的构造器。
7. 执行InstantiationAwarePostProcessor的postProcessPropertyValues方法。
8. 为Bean注入属性。
9. 调用BeanNameAware的setBeanName方法。
10. 调用BeanFactoryAware的setBeanFactory方法。
11. 调用ApplicationContextAware的setApplicationContext方法。
12. 执行BeanPostProcessor的postProcessBeforeInitialization方法。
13. 调用@PostConstruct注解的方法
14. 调用InitializingBean的afterPropertiesSet方法。
15. 调用<bean>的init-method属性指定的初始化方法。
16. 执行InstantiationAwareBeanPostProcessor的postProcessAfterInitialization方法。
17. 执行BeanPostProcessor的postProcessAfterInitialization方法。

=======至此，bean可以使用了=======

18. 调用@PreDestroy注解的方法。
19. 调用DisposableBean的destroy方法。
20. 调用<bean>的destroy-method属性指定的销毁方法。
