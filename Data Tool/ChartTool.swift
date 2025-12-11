//
//  ChartTool.swift
//  Data Tool
//
//  Created by Michael Kir on 08/12/2025.
//

import FoundationModels
import TabularData

// Enums must be visible to the tool for @Generable to work
@Generable
enum AggregationType: String, CaseIterable {
    case sum, average, count, none
}

@Generable
enum ChartType: String, CaseIterable {
    case bar, line, point, area
}

struct ChartTool: Tool {
    let name = "ChartTool"
    let description = "Summarizes data and displays a chart. Requires grouping column (X), value column (Y), and aggregation type."

    @Generable
    struct Arguments {
        @Guide(description: "Column for X-axis (Group by this, e.g. Year/Category)")
        var groupColumn: String
        
        @Guide(description: "Column for Y-axis (Value to calculate, e.g. Sales)")
        var valueColumn: String
        
        @Guide(description: "Aggregation method: sum, average, count, or none")
        var operation: AggregationType = .sum
        
        @Guide(description: "Visual style: bar, line, point")
        var type: ChartType = .bar
    }

    func call(arguments: Arguments) async throws -> String {
        // Delegate all work to the Controller
        return await ChartController.shared.processAndLaunch(
            groupBy: arguments.groupColumn,
            valueBy: arguments.valueColumn,
            agg: arguments.operation,
            chartType: arguments.type
        )
    }
}
