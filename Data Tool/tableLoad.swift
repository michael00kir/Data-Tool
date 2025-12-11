//
//  tableLoad.swift
//  Data Tool
//
//  Created by Michael Kir on 24/11/2025.
//
import Foundation
import TabularData

enum TableLoadError: Error, LocalizedError {
    case fileNotFound(path: String)

    var errorDescription: String? {
        switch self {
        case .fileNotFound(let path):
            return "File not found at \(path). Make sure the CSV is in the same folder you are running the app from."
        }
    }
}

var table: DataFrame!
var currentChartData: DataFrame!

func tableLoad(loadTableName: String) async throws -> DataFrame {
    
    let fileName = "\(loadTableName).csv"
    let currentDirectory = FileManager.default.currentDirectoryPath
    let fileUrl = URL(fileURLWithPath: currentDirectory).appendingPathComponent(fileName)

    // Check if it actually exists before trying to load
    if FileManager.default.fileExists(atPath: fileUrl.path) {
        print("File found at: \(fileUrl.path)")
        // Proceed to load your data
    } else {
        throw TableLoadError.fileNotFound(path: fileUrl.path)
    }

    // creating a dataframe instance of it
    table = try DataFrame(contentsOfCSVFile: fileUrl)
    
    return table
}
