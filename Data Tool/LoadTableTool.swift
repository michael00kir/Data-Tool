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
      _ = try await tableLoad(loadTableName: arguments.tableName)
      let columns = table.columns.map { $0.name }
      let formattedResult = """
          Successfully loaded the '\(arguments.tableName)'file. The columns for it, are '\(columns)'.
          """
      return formattedResult
  }
}
