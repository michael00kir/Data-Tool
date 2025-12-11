//
//  ChartController.swift
//  Data Tool
//
//  Created by Michael Kir on 10/12/2025.
//


import TabularData
import Foundation

class ChartController {
    // Singleton for easy access
    static let shared = ChartController()
    
    private init() {}

    private func findColumn(named input: String, in df: DataFrame) -> String? {
            // A. Exact Match
            if df.columns.contains(where: { $0.name == input }) {
                return input
            }
            
            // B. Case Insensitive Match (e.g. "sales" -> "Sales")
            if let match = df.columns.first(where: { $0.name.caseInsensitiveCompare(input) == .orderedSame }) {
                return match.name
            }
            
            // C. Partial Match (e.g. "Year" -> "Year_ID")
            // Be careful with this one, but it's very helpful for "ID" columns
            if let match = df.columns.first(where: { $0.name.localizedCaseInsensitiveContains(input) }) {
                return match.name
            }
            
            return nil
        }

        // 2. UPDATE: Use this helper in your main process function
        func processAndLaunch(groupBy xCol: String, valueBy yCol: String, agg: AggregationType, chartType: ChartType) async -> String {
            currentChartData = nil
            
            guard let sourceData = table else { return "Error: No data." }

            // --- SMART COLUMN LOOKUP ---
            guard let validX = findColumn(named: xCol, in: sourceData) else {
                // Return a helpful error so the AI can learn
                return "Error: Column '\(xCol)' not found. Did you mean one of these? \(sourceData.columns.map { $0.name })"
            }
            
            guard let validY = findColumn(named: yCol, in: sourceData) else {
                return "Error: Column '\(yCol)' not found. Did you mean one of these? \(sourceData.columns.map { $0.name })"
            }
            // ---------------------------

            print(">> Processing \(agg.rawValue) of \(validY) by \(validX)...")

            let processedData = aggregateData(
                df: sourceData,
                groupBy: validX, // Use the corrected name
                sumBy: validY,   // Use the corrected name
                op: agg
            )
        
        guard processedData.rows.count > 0 else {
            return "Error: Aggregation resulted in empty data. Check column names."
        }
        
        // 4. Update State
        currentChartData = processedData
        
        // 5. Launch UI (Must happen on Main Thread)
        await MainActor.run {
            ChartLauncher.launch(
                type: chartType,
                xLabel: xCol,
                yLabel: yCol
            )
        }
        
        return "Chart displayed successfully."
    }
}
