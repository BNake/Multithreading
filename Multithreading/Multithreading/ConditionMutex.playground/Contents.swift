import UIKit

/*
 Примитив синхронизации condition.
 Ключевая особенность condition заключается в том, что задача закрытая condition, не начнет выполняться до того момента, пока не получит некий сигнал из другого потока.
*/

final class ConditionMutex {
    
    private let condition = NSCondition()
    private var check = false
    
    func testOne() {
        condition.lock()
        while !check {
            condition.wait()
        }
        // Do something.
        print("test one")
        condition.unlock()
    }
    
    func testTwo() {
        condition.lock()
        check = true
        condition.signal()
        condition.unlock()
    }
}
