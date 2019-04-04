import UIKit

/*
 Существуют ситуации в которых нам необходимо определить порядок выполнения задач. Для разрешения подобных ситуаций, можно воспользоваться симафором либо dispatch group.
 Dispatch group позволяет объеденить наши задачи в группу, затем дожидаться пока не выполняться все задачи входящие в эту группу.
*/

final class DispatchGroupTest {
    
    private let group = DispatchGroup()
    private let queue = DispatchQueue(label: "dispatchGroup", attributes: .concurrent)
    
    func testNotification() {
        queue.async(group: group) {
            sleep(1)
            print("1")
        }
        queue.async(group: group) {
            sleep(2)
            print("2")
        }
        group.notify(queue: DispatchQueue.main) {
            print("finish all")
        }
    }
}

DispatchGroupTest().testNotification()

/*
 Пример с использованием enter(), leave(), wait() методов у dispatch group.
 wait() - означает что, пока все задачи перед которыми был вызван метод enter(), не завершили свое выполнение и не вызвали метод leave(), вызывающий поток будет блокироваться.
*/

final class DispatchGroupTestTwo {
    
    private let group = DispatchGroup()
    private let queue = DispatchQueue(label: "dispatchGroupTestTwo", attributes: .concurrent)
    
    func testWait() {
        group.enter()
        queue.async {
            sleep(1)
            print("1")
            self.group.leave()
        }
        group.enter()
        queue.async(group: group) {
            sleep(2)
            print("2")
            self.group.leave()
        }
        group.wait()
        print("finish all")
    }
}

DispatchGroupTestTwo().testWait()
