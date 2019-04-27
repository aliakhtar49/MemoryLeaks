//
//  SecondViewController.swift
//  MemoryLeaks
//
//  Created by Ali Akhtar on 24/04/2019.
//  Copyright © 2019 Ali Akhtar. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {
    var a = 20
    var b = 30
    var someClosure: (() -> Int)?
    override func viewDidLoad() {
        super.viewDidLoad()
     
        someClosure = { [unowned self] in
            //guard  let `self` = self else { return 0 }
            return self.a + self.b

        }
        someMethodThatTakeClosure(closure: someClosure!)
        
     
       

    }
    func MemoryLeakUsingSingletongMethod() {
        
        SingletonClass.shared.someSingletonMemoryLeakMethod(self.a) { [weak self] (value) in
            self?.execute()
        }
    }
    
    func noMemoryLeakUsingStaticMethod() {
                StaticClass.someStaticMethod(self.a) { (value) in
                    self.execute()
                }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.execute()
        }
    }
    func execute() {
        print(self.a)
    }
    
    func someMethod() {
      let newSomeClosure = {
            return self.a + self.b
            
        }
        someMethodThatTakeClosure(closure: newSomeClosure)
    }
    
    func someMethodThatTakeClosure(closure: @escaping () -> Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
            print(closure())
        })

    }
    deinit {
        print("Deinit Second View COntroller")
    }
    
    func address(o: UnsafePointer<Void>) -> Int {
        return unsafeBitCast(o, to: Int.self)
    }
    func exampleTwo() {
        
        //        var a: Int = 20
        //        var b: Int = 30
        //
        //        let someHandler: () -> Int = {
        //            print(NSString(format: "%p", self.address(o: &a)))
        //            print(NSString(format: "%p", self.address(o: &b)))
        //            return a + b
        //        }
        //        print(NSString(format: "%p", address(o: &a)))
        //        print(NSString(format: "%p", address(o: &b)))
        //        a = 21
        //        b = 31
        ////
        //        print(NSString(format: "%p", address(o: &a)))
        //        print(NSString(format: "%p", address(o: &a)))
        //        print(someHandler())
    }
    func example() {
        var user: User? = User()        //reference count 1 User object
        var todo: Todo? = Todo()  //reference count 1 Todo Object
        
        user?.todo = todo         //reference count 2 Todo Object
        todo?.associatedUser = user //reference count 1 User object
        
        user = nil    //reference count 0 User object   //reference count  1 Todo object
        
        
        todo = nil    //reference count 0 Todo Object
        
        // Do any additional setup after loading the view.

    }

}
class User {
    var todo: Todo?
}

class Todo {
   weak var associatedUser: User?
}

class SingletonClass{
    
    static let shared = SingletonClass()
    var singletonProperty: ((Int) -> Void)?
    
    
    init(){}
    
    func someSingletonMethod(_ valuePass: Int,compeltion: (Int) -> Void) {
        compeltion(valuePass)
    }
    func someSingletonMemoryLeakMethod(_ valuePass: Int,compeltion: @escaping (Int) -> Void) {
        self.singletonProperty = compeltion
        compeltion(valuePass)
    }
    deinit {
        print("ds")
    }
}
