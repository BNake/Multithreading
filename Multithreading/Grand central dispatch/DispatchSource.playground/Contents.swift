import UIKit

/*
 Dispatch source - фундаментальный тип данных, который позволяет взаимодействовать с системными событиями.
 Виды dispatch source:
  Timer dispatch source - тип dispatch source, который генерирует периодические нотификации.
  Signal dispatch source - тип dispatch source, который взаимодействует с unix сигналами
  Descriptor dispatch source - тип dispatch source, который оповещает о том, что с файлом были произведены различные операции.
  Process dispatch source - тип dispatch source, который позволяет слушать события процесса.
*/

final class DispatchSourceTimer {
    
    private let source = DispatchSource.makeTimerSource()
    
    func test() {
        source.setEventHandler {
            print("test")
        }
        source.schedule(deadline: .now(), repeating: 3)
        source.activate()
    }
}

DispatchSourceTimer().test()

/*
 makeUserDataAddSource - позволяет суммировать события приходящие в source из других потоков.
*/

final class DispatchSourceUserDataAddSource {
    
    private let source = DispatchSource.makeUserDataAddSource(queue: DispatchQueue.main)
    
    init() {
        source.setEventHandler {
            print(self.source.data)
        }
        source.activate()
    }
    
    func test() {
        DispatchQueue.global().async {
            self.source.add(data: 10)
        }
    }
}

DispatchSourceUserDataAddSource().test()
