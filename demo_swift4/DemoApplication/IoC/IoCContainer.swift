//
//  DipIocContainer.swift
//  DemoApplication
//
//  Created by Daniel Saidi on 2018-12-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by any classes that can be
 used to resolve dependencies. This makes it possible to use
 dependency injection for the dependency injection framework
 as well.
 
 */

import Foundation

public protocol IoCContainer {
    
    func resolve<T>() -> T
    func resolve<T, A>(arguments arg1: A) -> T
    func resolve<T, A, B>(arguments arg1: A, _ arg2: B) -> T
}
