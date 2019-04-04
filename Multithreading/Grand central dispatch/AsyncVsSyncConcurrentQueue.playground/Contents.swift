import UIKit

/*
 Async - управление возвращается вызывающему потоку.
 Sync - вызывающий поток ожидает выполнения вашей задачи.
 
 Гарантируется только то, что с начало выполнится test three, затем test four.
 Между test three и test four может быть test one и test two.
*/

final class ConcurrentQueue {
    
    private let concurrentQueue = DispatchQueue.global()
    
    func test() {
        concurrentQueue.async {
            print("test one")
        }
        concurrentQueue.async {
            print("test two")
        }
        concurrentQueue.sync {
            print("test three")
        }
        concurrentQueue.sync {
            print("test four")
        }
    }
}

ConcurrentQueue().test()
