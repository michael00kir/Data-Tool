//
//  main.swift
//  Data Tool
//
//  Created by Michael Kir on 18/11/2025.
//

import Foundation
import FoundationModels
import TabularData

import Foundation

// 1. Initialize the session once (outside the loop)
let session = LanguageModelSession(
    tools: [LoadTableTool()],
    instructions: "Help the person with getting weather information"
)

print("Chart Bot Started. Type 'exit' or 'quit' to end the program.")
print("------------------------------------------------------------")

// 2. Start an infinite loop
while true {
    // Print the prompt indicator
    print("\nEnter the prompt: ", terminator: "")
    
    // 3. Read input securely
    guard let input = readLine() else {
        break // Handles if the input stream is closed (Ctrl+D)
    }
    
    // 4. Check for exit condition (case insensitive)
    let cleanedInput = input.trimmingCharacters(in: .whitespacesAndNewlines)
    if ["exit", "quit"].contains(cleanedInput.lowercased()) {
        print("Exiting program. Goodbye!")
        break // Breaks the loop to finish the program
    }
    
    // Skip empty enters to avoid unnecessary API calls
    if cleanedInput.isEmpty {
        continue
    }

    // 5. Make the request
    // It is best practice to wrap async/await calls in a do-catch block
    // so one error doesn't crash the whole loop.
    do {
        let response = try await session.respond(
            to: cleanedInput
        )
        print("\nResponse: \(response)")
    } catch {
        print("\nAn error occurred: \(error)")
    }
}
