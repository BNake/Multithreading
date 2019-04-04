import UIKit

/*
 Конструкция используемая в objective-c для синхронизации.
 Основана на recursive mutex.
*/

final class Synchronized {
    
    private let lock = NSObject()
    
    func test() {
        objc_sync_enter(lock)
        // Do something.
        print("test")
        objc_sync_exit(lock)
    }
}
