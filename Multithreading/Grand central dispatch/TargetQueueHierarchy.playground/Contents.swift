import UIKit

/*
 Специальная техника, которая позволяет нам сократить переключение контекстов.
 Применение в случае если вы хотите уменьшить количество switch context за счет target queue.
*/

final class TargetQueueHierarchy {
    
    private let targetQueue = DispatchQueue(label: "targetQueue")
    
    func test() {
        let queueOne = DispatchQueue(label: "queueOne", target: targetQueue)
        let dispatchSourceOne = DispatchSource.makeTimerSource(queue: queueOne)
        dispatchSourceOne.setEventHandler {
            print("test one")
        }
        dispatchSourceOne.activate()
        
        let queueTwo = DispatchQueue(label: "queueTwo", target: targetQueue)
        let dispatchSourceTwo = DispatchSource.makeTimerSource(queue: queueTwo)
        dispatchSourceTwo.setEventHandler {
            print("test two")
        }
        dispatchSourceTwo.activate()
    }
}

TargetQueueHierarchy().test()
