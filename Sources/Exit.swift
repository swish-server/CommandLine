public func exit<T>(_ errormessage: T, errorcode: Int = 1, file: String = #file, line: Int = #line) -> Never  {
    print(file + ":\(line): ")
    print(errormessage)
    exit(Int32(errorcode))
}

func exit(_ error: Error) -> Never {
    exit(error.localizedDescription)
}
