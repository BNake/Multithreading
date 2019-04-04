import UIKit

/*
 Использование quality of service в рамках unix потоков.
*/

final class PthreadQos {
    
    func test() {
        var thread = pthread_t(bitPattern: 0)
        var attribute = pthread_attr_t()
        
        pthread_attr_init(&attribute)
        pthread_attr_set_qos_class_np(&attribute, QOS_CLASS_USER_INITIATED, 0)
        
        pthread_create(&thread, &attribute, { pointer in
            // Do something.
            print("test")
            pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0)
            return nil
        }, nil)
    }
}

PthreadQos().test()
