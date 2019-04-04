import UIKit

/*
 Пример с unix имплементацией.
 Read write lock блокируют ресурс на запись и не блокируют его на чтение.
 Когда происходит чтение ресурса, мы не блокируем сам ресурс, в случае если же нам понадобится обратиться на запись к данному ресурсу, lock дожидается пока все потоки которые читают ресурс выполнятся и только потом начинается запись в этот ресурс. Причем в этот момент другие потоки не могут обратиться к этому ресурсу, тоесть ресурс захвачен.
*/

final class PthreadReadWriteLock {
    
    private var lock = pthread_rwlock_t()
    private var attribute = pthread_rwlockattr_t()
    
    private var test = 0
    
    init() {
        pthread_rwlock_init(&lock, &attribute)
    }
    
    var testProperty: Int {
        get {
            pthread_rwlock_rdlock(&lock)
            let temp = test
            pthread_rwlock_unlock(&lock)
            return temp
        }
        set {
            pthread_rwlock_wrlock(&lock)
            test = newValue
            pthread_rwlock_unlock(&lock)
        }
    }
}
