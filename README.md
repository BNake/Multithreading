
# Multithreading

Depending on your application, there may still be times when you need to create custom threads. If you do create custom threads,
you should strive to create as few threads as possible yourself and you should use those threads only for specific tasks that cannot be 
implemented any other way. Threads are still a good way to implement code that must run in real time. Dispatch queues make every attempt to 
run their tasks as fast as possible but they do not address real time constraints. If you need more predictable behavior from code running in the background, 
threads may still offer a better alternative.

# GCD

With GCD you don’t interact with threads directly anymore. Instead you add blocks of code to queues, and GCD manages a thread pool behind the scenes. 
GCD decides on which particular thread your code blocks are going to be executed on, and it manages these threads according to the available system resources.
This alleviates the problem of too many threads being created, because the threads are now centrally managed and abstracted away from application developers.
The other important change with GCD is that you as a developer think about work items in a queue rather than threads. This new mental model of concurrency is 
easier to work with. GCD exposes five different queues: the main queue running on the main thread, three background queues with different priorities, and one 
background queue with an even lower priority, which is I/O throttled. Furthermore, you can create custom queues, which can either be serial or concurrent queues.
While custom queues are a powerful abstraction, all blocks you schedule on them will ultimately trickle down to one of the system’s global queues and its thread
pool(s).
