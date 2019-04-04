import UIKit

/*
 Async - управление возвращается вызывающему потоку.
 Sync - вызывающий поток ожидает выполнения вашей задачи.
*/

final class SerialQueue {
    
    private let serialQueue = DispatchQueue(label: "serialQueue")
    
    func test() {
        serialQueue.async {
            print("test one")
        }
        serialQueue.async {
            sleep(1)
            print("test two")
        }
        serialQueue.sync {
            print("test three")
        }
        serialQueue.sync {
            print("test four")
        }
    }
}

SerialQueue().test()
