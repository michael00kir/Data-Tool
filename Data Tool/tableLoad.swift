//
//  tableLoad.swift
//  Data Tool
//
//  Created by Michael Kir on 24/11/2025.
//
import Foundation
import TabularData

func tableLoad(loadTableName: String) async throws -> DataFrame {
    
    let fileName = "\(loadTableName).csv"
    let currentDirectory = FileManager.default.currentDirectoryPath
    let fileUrl = URL(fileURLWithPath: currentDirectory).appendingPathComponent(fileName)

    // Check if it actually exists before trying to load
    if FileManager.default.fileExists(atPath: fileUrl.path) {
        print("File found at: \(fileUrl.path)")
        // Proceed to load your data
    } else {
        fatalError("File not found at \(fileUrl.path). Make sure the CSV is in the same folder you are running the app from.")
    }

    // creating a dataframe instance of it
    let table1 = try! DataFrame(contentsOfCSVFile: fileUrl)
    
    return table1
}
