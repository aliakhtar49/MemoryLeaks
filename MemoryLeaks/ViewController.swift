//
//  ViewController.swift
//  MemoryLeaks
//
//  Created by Ali Akhtar on 24/04/2019.
//  Copyright © 2019 Ali Akhtar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // weak var referenceOneTemp =  Person()
  //  var weaksedd: Person?

    override func viewDidLoad() {
        ///self.weaksedd = referenceOneTemp
        super.viewDidLoad()
        
       
    }

    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    
    func exampleTwo() {
        var referenceOne: Person? =  Person() // reference count 1
        
        weak var reference2 = referenceOne    //reference count 1
        
        weak var referecne3 = referenceOne   //reference count 1
        
        
        referenceOne = nil //reference count 0
        
        //Deinit
    }
    
    
    
    
    func exampleOne() {
      
        var referenceOne: Person? =  Person() // reference count 1
        
        weak var reference2 = referenceOne    //reference count 2
        
        var referecne3 = referenceOne   //reference count 3
        
        reference2 = nil //reference count 2
        referecne3 = nil //reference count 1
        referenceOne = nil //reference count 0
    }
    deinit {
        print("UIViewController deinit")
    }
}


class Person {
    var name: String = ""
    
    deinit {
        print("Person deinit")
    }
}
