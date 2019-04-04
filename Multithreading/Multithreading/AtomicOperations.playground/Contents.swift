import UIKit

/*
 Атомарная операция — операция, которая либо выполняется целиком, либо не выполняется вовсе; операция, которая не может быть частично выполнена и частично не выполнена.
*/

final class AtomicOperations {
    
    private var number: Int64 = 0
    
    func test() {
        OSAtomicCompareAndSwap64Barrier(number, 10, &number)
        OSAtomicAdd64Barrier(20, &number)
        OSAtomicIncrement64Barrier(&number)
    }
}
