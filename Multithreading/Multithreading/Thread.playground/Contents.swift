import UIKit

/*
 Создание потока.
*/

private var thread = Thread {
    // Do something.
    print("test")
}

thread.start()
