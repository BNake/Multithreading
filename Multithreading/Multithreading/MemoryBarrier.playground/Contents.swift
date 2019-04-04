import UIKit

/*
 Некоторые архитектуры переставляют процессорные команды с целью повышения производительности, в таких случаях им помагает "volatile" который служит для контроля переупорядочиваний осуществляемых компилятором.
*/

final class MemoryBarrier {
    
    var testClass: TestClass?
    
    func test() {
        let threadOne = Thread {
            let temp = TestClass()
            temp.testOne = 100
            temp.testTwo = 500
            OSMemoryBarrier()
            self.testClass = temp
        }
        threadOne.start()
        let threadTwo = Thread {
            while self.testClass == nil {}
            OSMemoryBarrier()
            print(self.testClass?.testOne ?? 0)
        }
        threadTwo.start()
    }
}

final class TestClass {
    
    var testOne: Int?
    var testTwo: Int?
}
