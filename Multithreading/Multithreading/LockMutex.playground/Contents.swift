import UIKit

/*
 Примитив синхронизации mutex.
 Под захватом ресурса подразумевается то, что как только поток обратиться к ресурсу, никакой другой поток не сможет с ним взаимодействовать и будет ожидать до того момента, пока текущий поток не освободит этот ресурс.
*/

final class LockMutex {
    
    private let lock = NSLock()
    
    func test() {
        lock.lock()
        // Do something.
        print("test")
        lock.unlock()
    }
}

LockMutex().test()
