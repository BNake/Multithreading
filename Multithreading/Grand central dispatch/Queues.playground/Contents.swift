import UIKit

/*
 Основными примитивами в GCD являются очереди.
 Serial queue - выполняет свои задачи последовательно.
 Concurrent queue - выполняет задачи параллельно.
 Global - очередь из пула очередей. Все глобальные очереди являются concurrent.
 Main - является serial global queue, все задачи выполняются в главном потоке.
*/

final class Queues {
    
    private let serialQueue = DispatchQueue(label: "serialQueue")
    private let concurrentQueue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    private let globalQueue = DispatchQueue.global()
    private let mainQueue = DispatchQueue.main
}
