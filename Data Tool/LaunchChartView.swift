//
//  LaunchChartView.swift
//  Data Tool
//
//  Created by Michael Kir on 08/12/2025.
//

import SwiftUI
import AppKit
import Charts
import TabularData

struct UniversalChartView: View {
    let data: DataFrame
    let type: ChartType // Using the Enum from ChartTool.swift
    let xName: String
    let yName: String

    var body: some View {
        VStack {
            Text("\(type.rawValue.capitalized) Chart")
                .font(.headline)
            Chart {
                ForEach(Array(data.rows.enumerated()), id: \.offset) { _, row in
                    if let xVal = row[xName] as? String,
                       let yVal = row[yName] as? Double {
                        
                        switch type {
                        case .bar: BarMark(x: .value(xName, xVal), y: .value(yName, yVal))
                        case .line: LineMark(x: .value(xName, xVal), y: .value(yName, yVal))
                        case .point: PointMark(x: .value(xName, xVal), y: .value(yName, yVal))
                        case .area: AreaMark(x: .value(xName, xVal), y: .value(yName, yVal))
                        }
                    }
                }
            }
            .chartYAxis {
                            AxisMarks(format: Decimal.FormatStyle.number.notation(.compactName))
                        }
            .padding()
        }
        .frame(minWidth: 800, minHeight: 500)
    }
}

class ChartLauncher {
    @MainActor
    static let appDelegate = PreventExitDelegate() // Keep a static reference

    @MainActor
    static func launch(type: ChartType, xLabel: String, yLabel: String) {
        guard let data = currentChartData else { return }
        
        let app = NSApplication.shared
        
        // 1. Assign Delegate
        app.delegate = appDelegate
        
        // 2. FORCE APP MODE
        app.setActivationPolicy(.regular)
        app.finishLaunching() // <--- CRITICAL FIX: Initializes app lifecycle
        
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 850, height: 600),
            styleMask: [.titled, .closable, .resizable, .miniaturizable], // Added miniaturizable
            backing: .buffered,
            defer: false
        )
        window.center()
        window.title = "Chart: \(yLabel) by \(xLabel)"
        window.isReleasedWhenClosed = false // Prevent auto-release
        
        let view = UniversalChartView(data: data, type: type, xName: xLabel, yName: yLabel)
        window.contentViewController = NSHostingController(rootView: view)
        
        let delegate = ModalWindowDelegate(window: window)
        window.delegate = delegate
        
        // 3. BRING TO FRONT
        app.activate(ignoringOtherApps: true) // <--- CRITICAL FIX: Forces window on top
        
        app.runModal(for: window)
        
        // Cleanup
        window.orderOut(nil)
        app.setActivationPolicy(.accessory)
    }
}
// Delegate remains the same...
class ModalWindowDelegate: NSObject, NSWindowDelegate {
    let window: NSWindow
    init(window: NSWindow) { self.window = window }
    func windowWillClose(_ notification: Notification) {
        NSApplication.shared.stopModal()
    }
}

class PreventExitDelegate: NSObject, NSApplicationDelegate {
    // This tells macOS: "Even if the user closes the window, do NOT kill the app process."
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }
}
