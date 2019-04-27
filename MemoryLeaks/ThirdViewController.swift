//
//  ThirdViewController.swift
//  MemoryLeaks
//
//  Created by Ali Akhtar on 27/04/2019.
//  Copyright © 2019 Ali Akhtar. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    var a = 20
    var b = 30
    var someClosure: (() -> Int)?

    override func viewDidLoad() {
    
        super.viewDidLoad()
    
        someClosure = { [unowned self] in
            return self.a + self.b
            
        }
        someMethodThatTakeClosure(closure: someClosure!)
        

    }
    func someMethodThatTakeClosure(closure: @escaping () -> Int) {
       // DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            print(closure())
       // })
        
    }
    
    @IBAction func button1Tapped(_ sender: UIButton) {
        SingletonClass.shared.someSingletonMemoryLeakMethod(self.a) { (value) in
            self.execute()
        }
    }
    func execute() {
        
    }
    
    @IBAction func button3Tapped(_ sender: Any) {
    }
    @IBAction func button2Tapped(_ sender: UIButton) {
    }
    @IBAction func button4Tapped(_ sender: Any) {
    }
    deinit {
        print("Third View Controller Deinit Called")
    }
}
