import Foundation

#if !os(macOS)
public typealias Process = Task
#endif

public typealias Command = String

public struct CommandLine {

    public init() { }

    public func execute(_ command: Command, with arguments: [String] = []) -> CommandLineResult {
        let process = Process()
        process.launchPath = command
        process.arguments = arguments

        let outputPipe = Pipe()
        let errorPipe = Pipe()
        process.standardOutput = outputPipe
        process.standardError = errorPipe
        process.launch()

        if let errorOutput = output(from: errorPipe), errorOutput.characters.count > 0 {
            return .error(errorOutput)
        } else {
            return .output(output(from: outputPipe) ?? "")
        }
    }

    private func output(from pipe: Pipe) -> String? {
        let outputData = pipe.fileHandleForReading.readDataToEndOfFile()
        return String(data: outputData, encoding: .utf8)
    }
    
}
