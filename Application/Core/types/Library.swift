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
