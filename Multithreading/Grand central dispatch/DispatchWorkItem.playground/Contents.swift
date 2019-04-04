import UIKit

/*
 Существует возможность ставить на выполнение не только блоки, но объекты специального класса, который называется dispatch work item.
 Данный класс является абстракцией над выполняемой задачей, который предоставляет нам несколько удобных методов. Например получить уведомление о выполнении текущей задачи.
*/

final class DispatchWorkItemTest {
    
    private let queue = DispatchQueue(label: "dispatchWorkItem", attributes: .concurrent)
    
    func test() {
        let item = DispatchWorkItem {
            print("test")
        }
        item.notify(queue: DispatchQueue.main) {
            print("finish")
        }
        queue.async(execute: item)
    }
}

DispatchWorkItemTest().test()

/*
 Dispatch work wtem так же позволяет отменять выполнение нашей задачи.
 Если задача будет поставлена на выполнение, отменить её не получится.
*/
 
final class DispatchWorkItemTestTwo {
    
    private var serialQueue = DispatchQueue(label: "dispatchWorkItemTestTwo")
    
    func testCancel() {
        serialQueue.async {
            sleep(1)
            print("test one")
        }
        serialQueue.async {
            sleep(1)
            print("test two")
        }
        let item = DispatchWorkItem {
            print("test")
        }
        serialQueue.async(execute: item)
        item.cancel()
    }
}

DispatchWorkItemTestTwo().testCancel()
