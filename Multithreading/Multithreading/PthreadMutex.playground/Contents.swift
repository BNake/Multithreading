import UIKit

/*
 Примитив синхронизации unix mutex.
 Под захватом ресурса подразумевается то, что как только поток обратиться к ресурсу, никакой другой поток не сможет с ним взаимодействовать и будет ожидать до того момента, пока текущий поток не освободит этот ресурс.
*/

final class PthreadMutex {
    
    private var mutex = pthread_mutex_t()
    
    init() {
        pthread_mutex_init(&mutex, nil)
    }
    
    func test() {
        pthread_mutex_lock(&mutex)
        // Do something.
        print("test")
        pthread_mutex_unlock(&mutex)
    }
}

PthreadMutex().test()
