import UIKit

/*
 Создание unix потока.
*/

private var thread = pthread_t(bitPattern: 0)
private var attribute = pthread_attr_t()

pthread_attr_init(&attribute)
pthread_create(&thread, &attribute, { pointer in
    // Do something.
    print("test")
    return nil
}, nil)
