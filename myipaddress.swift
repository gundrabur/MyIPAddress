//
//  main.swift
//  MyIPAddress
//
//  Created by Christian Möller on 13.08.23.
import Foundation

// Function to get the local IP address using a shell command
func getLocalIP() -> String {
    // Create a new Process instance
    let task = Process()
    // Set the launch path for the process to the Zsh shell executable
    task.launchPath = "/bin/zsh"
    // Set the arguments for the shell command to retrieve the IP address using ifconfig, grep, and awk
    task.arguments = ["-c", "ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2; exit}'"]

    // Create a Pipe to capture the standard output of the task
    let pipe = Pipe()
    // Set the standard output of the task to the created Pipe
    task.standardOutput = pipe
    // Launch the process
    task.launch()

    // Read the data from the Pipe's file handle (output of the shell command)
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    // Convert the data to a UTF-8 encoded string and trim whitespace and newline characters
    if let ip = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) {
        return ip // Return the obtained IP address
    }

    return "" // Return an empty string if IP address couldn't be obtained
}

// Main function to periodically get the local IP address and write it to a file
func main(outputFile: String) {
    var prevIPAddress = "" // Store the previously obtained IP address

    // Start an infinite loop
    while true {
        // Get the current timestamp in a specific format
        let timestamp = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
        // Get the local IP address using the getLocalIP function
        let ipAddress = getLocalIP()

        // Check if the IP address is not empty and has changed since the previous iteration
        if !ipAddress.isEmpty, ipAddress != prevIPAddress {
            // Print the timestamp and IP address to the console
            print("[\(timestamp)] \(ipAddress)")

            // Write the timestamp and IP address to the specified output file
            do {
                try "[\(timestamp)] \(ipAddress)\n".write(toFile: outputFile, atomically: true, encoding: .utf8)
            } catch {
                print("Error writing to file: \(error)")
            }

            // Update the previous IP address to the current one
            prevIPAddress = ipAddress
        }

        // Sleep for 60 seconds before the next iteration
        sleep(60)
    }
}

// Check the number of command-line arguments
if CommandLine.arguments.count == 1 {
    // If only one argument is provided (executable name), create an output file path on the user's desktop
    let outputFilePath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Desktop/ip_address.txt").path
    // Call the main function with the generated output file path
    main(outputFile: outputFilePath)
} else if CommandLine.arguments.count == 2 {
    // If two arguments are provided (executable name and output file path), use the provided output file path
    let outputFilePath = CommandLine.arguments[1]
    // Call the main function with the provided output file path
    main(outputFile: outputFilePath)
} else {
    // If incorrect number of arguments are provided, print usage information and exit
    print("Usage: \(CommandLine.arguments[0]) [output_file]")
    exit(1)
}
