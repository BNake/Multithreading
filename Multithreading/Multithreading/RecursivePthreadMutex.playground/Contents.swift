import UIKit

/*
 Рекурсивный unix mutex отличается от обычного тем, что позволяет потоку множество раз захватывать один и тот же ресурс.
 Ядро операционной системы сохраняет след потока, который уже захватил ресурс и позволяет ему захватывать ресурс закрытый этим mutex.
 
 В случае, если же мы не указали бы тип mutex PTHREAD_MUTEX_RECURSIVE, при попытке вызвать функцию testTwo наш поток перешел бы в состояние ожидания до тех пор, пока он же сам не освободит наш mutex.
 Использование типа PTHREAD_MUTEX_RECURSIVE позволяет избежать подобных ситуаций.
*/

final class RecursivePthreadMutex {
    
    private var mutex = pthread_mutex_t()
    private var attribute = pthread_mutexattr_t()
    
    init() {
        pthread_mutexattr_init(&attribute)
        pthread_mutexattr_settype(&attribute, PTHREAD_MUTEX_RECURSIVE)
        pthread_mutex_init(&mutex, &attribute)
    }
    
    func testOne() {
        pthread_mutex_lock(&mutex)
        testTwo()
        pthread_mutex_unlock(&mutex)
    }
    
    func testTwo() {
        pthread_mutex_lock(&mutex)
        // Do something.
        print("test two")
        pthread_mutex_unlock(&mutex)
    }
}

RecursivePthreadMutex().testOne()
