import UIKit

/*
 Начиная с iOS 10 появляется новый вид mutex, unfire lock.
 Если в системе несколько потоков обращаются к ресурсу, доступ к ресурсу может получить произвольный поток в незаисимости от того, в каком порядке они к нему обращаются.
 Предпочтение будет даваться тому потоку, который обращается к системе несколько раз, для того что бы сократить context switch.
*/

final class UnfairLock {
    
    private var lock = os_unfair_lock_s()
    
    func test() {
        os_unfair_lock_lock(&lock)
        // Do something.
        print("test")
        os_unfair_lock_unlock(&lock)
    }
}
