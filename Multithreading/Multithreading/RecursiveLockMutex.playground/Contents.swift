import UIKit

/*
 Рекурсивный mutex отличается от обычного тем, что позволяет потоку множество раз захватывать один и тот же ресурс.
 Ядро операционной системы сохраняет след потока, который уже захватил ресурс и позволяет ему захватывать ресурс закрытый этим mutex.
*/

final class RecursiveLockMutex {
    
    private let recursiveLock = NSRecursiveLock()
    
    func testOne() {
        recursiveLock.lock()
        testTwo()
        recursiveLock.unlock()
    }
    
    func testTwo() {
        recursiveLock.lock()
        // Do something.
        print("test two")
        recursiveLock.unlock()
    }
}

RecursiveLockMutex().testOne()
