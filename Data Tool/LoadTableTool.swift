//
//  Untitled.swift
//  Data Tool
//
//  Created by Michael Kir on 24/11/2025.
//
import FoundationModels
import TabularData

struct LoadTableTool: Tool {
  let name = "LoadTable"
  let description = "Load a table in the dataframe"


  @Generable
  struct Arguments {
      @Guide(description: "Name of the table")
      var tableName: String
  }


  func call(arguments: Arguments) async throws -> String {
      // Get a random temperature value. Use `WeatherKit` to get
      // a temperature for the city.
      let loadedTable = try await tableLoad(loadTableName: arguments.tableName)
      let columns = loadedTable.columns.map { $0.name }
      let formattedResult = """
          The columns for '\(arguments.tableName)' are '\(columns)'. 
          """
      return formattedResult
  }
}
