import UIKit

/*
 Наиболее быстродействующим mutex является spinLock.
 SpinLock является циклом while, который постоянно опрашивает освобожден ресурс или нет.
 Данный способ не является энергоэффективными и ресурсозатратен.
 OSSpinLockLock deprecated in iOS 10.
*/

final class SpinLock {
    
    private var lock = OS_SPINLOCK_INIT
    
    func test() {
        OSSpinLockLock(&lock)
        // Do something.
        print("test")
        OSSpinLockUnlock(&lock)
    }
}

SpinLock().test()
