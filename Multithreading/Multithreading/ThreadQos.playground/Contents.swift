import UIKit

/*
 Использование quality of service в рамках потоков.
*/

final class ThreadQos {
    
    func test() {
        let thread = Thread {
            // Do something.
            print("test")
            print(qos_class_self())
        }
        thread.qualityOfService = .userInteractive
        thread.start()
        print(qos_class_main())
    }
}

ThreadQos().test()
