import UIKit

/*
 Для реализации подхода read write lock, используюя средства GCD, существует конструкция dispatch barrier.
 Dispatch barrier оптимален, если к ресурсу обращается несколько потоков на чтение и мало на запись.
*/

final class DispatchBarrier {
    
    private let queue = DispatchQueue(label: "dispatchBarrier", attributes: .concurrent)
    private var iternalTest = 0
    
    func setTest(_ test: Int) {
        queue.async(flags: .barrier) {
            self.iternalTest = test
        }
    }
    
    func test() -> Int {
        var temp = 0
        queue.sync {
            temp = iternalTest
        }
        return temp
    }
}
