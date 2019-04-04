import UIKit

/*
 Синхронизация в GCD.
 С помощью метода async мы ставим нашу задачу в очередь, далее вызываем метод wait который блокирует наш поток до того момента, пока внутри задачи которая была поставлена в очередь на выполнение, не вызовется метод signal.
*/

final class Semaphore {
    
    private let semaphore = DispatchSemaphore(value: 0)
    
    func test() {
        DispatchQueue.global().async {
            sleep(3)
            print("1")
            self.semaphore.signal()
        }
        semaphore.wait()
        print("2")
    }
}

Semaphore().test()

/*
 Передавая в конструктор симафора целочисленное значение, мы можем определять количество потоков, которые одновременно могут обращаться к ресурсу.
*/

final class SemaphoreValueTest {
    
    private let semaphore = DispatchSemaphore(value: 2)
    
    private func doWork() {
        semaphore.wait()
        print("test")
        sleep(3) // Do something.
        semaphore.signal()
    }
    
    func test() {
        DispatchQueue.global().async {
            self.doWork()
        }
        DispatchQueue.global().async {
            self.doWork()
        }
        DispatchQueue.global().async {
            self.doWork()
        }
    }
}

SemaphoreValueTest().test()
