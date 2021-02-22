//
//  Library.swift
//  Simple Game Engine
//
//  Created by Artem Vovchenko on 19.02.2021.
//

class Library<T,K> {
    
    init() {
        fillLibrary()
    }
    
    // Function to override the library
    internal func fillLibrary() {}
    
    subscript(_ type: T) -> K? {
        return nil
    }
}
