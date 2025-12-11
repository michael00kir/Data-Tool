//
//  SummaryTool.swift
//  Data Tool
//
//  Created by Michael Kir on 27/11/2025.
//


import FoundationModels
import TabularData

struct SummaryTool: Tool {
  let name = "Summary"
  let description = "Give full summary about the dataframe."


  @Generable
  struct Arguments {
      @Guide(description: "Names of the columns")
      var summary: Bool = true
  }


  func call(arguments: Arguments) async throws -> String {
      let tableSummery = table.summary().description
      return tableSummery
  }
}
