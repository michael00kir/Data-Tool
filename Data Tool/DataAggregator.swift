//
//  DataAggregator.swift
//  Data Tool
//
//  Created by Michael Kir on 10/12/2025.
//

import TabularData
import Foundation

/// Processes the raw dataframe into a summarized slice for plotting
func aggregateData(df: DataFrame, groupBy xCol: String, sumBy yCol: String, op: AggregationType) -> DataFrame {
    
    // Pass-through if no math is needed
    if op == .none { return df }
    
    var groups: [String: Double] = [:]
    var counts: [String: Int] = [:]

    for row in df.rows {
        // 1. Extract Key (X)
        let key: String
        if let s = row[xCol] as? String { key = s }
        else if let d = row[xCol] as? Date {
            // ISO8601 Date Formatter is robust
            key = ISO8601DateFormatter().string(from: d)
        }
        else if let i = row[xCol] as? Int { key = String(i) }
        else { continue }

        // 2. Extract Value (Y)
        var val: Double = 0.0
        if let v = row[yCol] as? Double { val = v }
        else if let v = row[yCol] as? Int { val = Double(v) }
        
        // 3. Math
        if op == .count {
            groups[key, default: 0] += 1
        } else {
            groups[key, default: 0] += val
            if op == .average { counts[key, default: 0] += 1 }
        }
    }

    // 4. Finalize Averages
    if op == .average {
        for (k, total) in groups {
            if let c = counts[k], c > 0 { groups[k] = total / Double(c) }
        }
    }

    // 5. Build Result DataFrame
    var res = DataFrame()
    let sortedKeys = groups.keys.sorted()
    
    var colX = Column<String>(name: xCol, capacity: groups.count)
    var colY = Column<Double>(name: yCol, capacity: groups.count)
    
    for key in sortedKeys {
        colX.append(key)
        colY.append(groups[key] ?? 0.0)
    }
    
    res.append(column: colX)
    res.append(column: colY)
    
    return res
}
