import UIKit

/*
 Псевдокод.
 Deadlock - потоки пытаются обратиться к уже захваченным ресурсам, в следствие чего программа зависает.
 Leave lock - оба потока выполняют бесполезную работу.
 Priority inversion - низкоприоритетный поток захватывает ресурс, остальные потоки ждут.
*/

final class Deadlock {
    
    private let lockOne = NSLock()
    private let lockTwo = NSLock()
    
    var resourceA = false
    var resourceB = false
    
    let threadOne = Thread {
        self.lockOne.lock()
        self.resourceA = true
        self.lockTwo.lock()
        self.resourceB = true
        self.lockTwo.unlock()
        self.lockOne.unlock()
    }
    
    threadOne.start()
    
    let threadTwo = Thread {
        self.lockTwo.lock()
        self.resourceB = true
        self.lockOne.lock()
        self.resourceA = true
        self.lockOne.unlock()
        self.lockTwo.unlock()
    }
    
    threadTwo.start()
}
