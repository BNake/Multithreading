import UIKit

/*
 Способ эффективно распараллелить выполнение задачи.
 Это системная имплементация параллельного цикла, которая работает более эффективно, чем вызов dispatch async в цикле for.
 Задачи эффективно распределяются между ядрами процессора.
 Эффективен при большом количестве итераций.
 Позволяет эффективно использовать свободные ресурсы системы.
*/

final class ConcurrentPerform {
    
    func test() {
        DispatchQueue.concurrentPerform(iterations: 3) { number in
            print(number)
        }
    }
}

ConcurrentPerform().test()
