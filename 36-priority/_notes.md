
# Hello OS
[实现进程优先级](https://blog.csdn.net/tyler_download/article/details/54406141)


https://www.bilibili.com/video/BV1hJ411n7rs?p=36


# Add priority field
````
struct TASK {
    int sel, flags;
    int priority;
    struct TSS32 tss;
};
````

# Adjust 
```
task_init

void task_run(struct TASK *task, int priority)

task_switch
```

每个任务分配时，它的优先级会默认设置成100，也就是该任务能获得1秒的运行时间。task_run多增加了一个参数，也就是任务优先级，当一个任务准备加入调度队列时，需要指定它的优先级，在task_switch中，任务切换时，我们通过timer_settime来设置任务的运行时间，大家可以看到，时钟的长度设置为task->priority, 也就是说，任务的优先级同时也是任务的CPU运行时间。