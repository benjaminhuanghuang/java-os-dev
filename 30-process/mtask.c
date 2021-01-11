#include "os.h"

#define MAX_TASKS		1000	/* maximum number of tasks  */
#define TASK_GDT0		3		/* What number to assign TSS from in the GDT */
#define MAX_TASKS_LV	100
#define MAX_TASKLEVELS	10

struct TSS32 {
	int backlink, esp0, ss0, esp1, ss1, esp2, ss2, cr3;
	int eip, eflags, eax, ecx, edx, ebx, esp, ebp, esi, edi;
	int es, cs, ss, ds, fs, gs;
	int ldtr, iomap;
};
struct TASK {
	int sel, flags; /* sel: number of the GDT */
	int level, priority;
	struct TSS32 tss;
};
struct TASKLEVEL {
	int running; /* number of running tasks */
	int now; /* which task is currently running */
	struct TASK *tasks[MAX_TASKS_LV];
};
struct TASKCTL {
	int now_lv; /* current level  */
	char lv_change; /* whether the level should also be changed at the next task switch */
	struct TASKLEVEL level[MAX_TASKLEVELS];
	struct TASK tasks0[MAX_TASKS];
};

extern struct TIMER *task_timer;
struct TASK *task_init(struct MEMMAN *memman);
struct TASK *task_alloc(void);
void task_run(struct TASK *task, int level, int priority);
void task_switch(void);
void task_sleep(struct TASK *task);
