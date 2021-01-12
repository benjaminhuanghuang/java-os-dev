
# Hello OS
[自动化进程切换](https://blog.csdn.net/tyler_download/article/details/53940437)


https://www.bilibili.com/video/BV1hJ411n7rs?p=33


添加进程控制模块
TASK 结构体用来表示一个进程，其中的sel表示该进程的TSS32结构所对应的段描述符下标，flag用来表示当前任务状态，例如是空闲还是占用。

TASKCTL 是任务控制器，它包含了TASK数组，也就是TASKCTL是一组进程的集合，runnging表示当前有多少个正在运行的进程，now表示下一个将被切换到前台的进程编号。

```
struct TASK {
    int sel, flags;
    struct TSS32 tss;
};

#define  MAX_TASKS  2
#define  TASK_GDT0  7
#define  SIZE_OF_TASK  112

struct TASKCTL {
    int  running;
    int  now;
    struct TASK  *tasks[MAX_TASKS];
    struct TASK tasks0[MAX_TASKS];
};

struct TASK *task_init(struct MEMMAN *memman);

#define SIZE_OF_TASKCTL  (4 + 4 + 4*MAX_TASKS + SIZE_OF_TASK*MAX_TASKS)

struct TASK *task_alloc(void);
```

task_init主要是初始化任务控制器对象，同时创建一个时钟，用于进程调度，同时为每个任务分配一个全局描述符，这个描述符指向该任务所对应的TSS32结构，并且将第一个任务的TSS32加载进CPU.

当有新的进程需要调度时，需要调用task_alloc为该进程创建一个任务对象，有了任务对象才能加入调度队列，与其他进程一起参与调度。

一旦为新进程分配任务对象后，需要调用task_run,将其加入调度队列，这样，新添加的任务会在调度队列中等待，当排在前面的任务运行后，它才会被切换到前台。

task_switch 是由时钟中断调用的，目前我们的任务调度算法很简单，就是排队处理，排在前面的先调度，运行1秒后，切换到下一个，如果队列中所有的任务都调度过了，那么重新回到队列头，再开启新一轮的调度。

还需要修改 时钟中断处理函数， 在时钟中断处理函数中调用 task_switch();


