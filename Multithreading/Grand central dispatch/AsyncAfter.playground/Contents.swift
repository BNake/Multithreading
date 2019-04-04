import UIKit

/*
 Позволяет отложить выполение задачи на определенное время, в примере на 3 секунды.
*/

final class AsyncAfter {
    
    private let concurrentQueue = DispatchQueue(label: "asyncAfter", attributes: .concurrent)
    
    func test() {
        concurrentQueue.asyncAfter(deadline: .now() + 3) {
            print("test")
        }
    }
}

AsyncAfter().test()
