import UIKit

/*
 Примитив синхронизации condition с unix имплементацией.
 Ключевая особенность condition заключается в том, что задача закрытая condition, не начнет выполняться до того момента, пока не получит некий сигнал из другого потока.
*/

final class PthreadConditionMutex {
    
    private var condition = pthread_cond_t()
    private var mutex = pthread_mutex_t()
    private var check = false
    
    init() {
        pthread_cond_init(&condition, nil)
        pthread_mutex_init(&mutex, nil)
    }
    
    func testOne() {
        pthread_mutex_lock(&mutex)
        while !check {
            pthread_cond_wait(&condition, &mutex)
            testTwo()
        }
        // Do something.
        print("test one")
        pthread_mutex_unlock(&mutex)
    }
    
    func testTwo() {
        pthread_mutex_lock(&mutex)
        check = true
        pthread_cond_signal(&condition)
        pthread_mutex_unlock(&mutex)
    }
}
