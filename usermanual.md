# 📘 User Manual: Data Tool

[cite_start]The **Data Tool** is a deterministic local semantic routing engine that allows you to interface with complex data frames using natural language[cite: 4, 28]. [cite_start]This application leverages local Apple Foundation Models to drive pre-compiled Swift binaries, ensuring your data remains private and your results remain stable[cite: 29, 32].

---

## 💻 System Requirements

To ensure the application functions correctly, your system must meet these specific hardware and software standards:

* [cite_start]**Processor:** Apple Silicon Mac with at least an M1 chip[cite: 875].
* [cite_start]**Operating System:** macOS 15.1 or later[cite: 267, 875].
* [cite_start]**Features:** Apple Intelligence must be enabled[cite: 875].
* [cite_start]**Tools:** Xcode must be installed to build and run the project[cite: 876, 878].

---

## 🚀 Getting Started

### 1. Setup
* [cite_start]**Open the Project:** Launch Xcode and open the provided project files[cite: 876].
* [cite_start]**Data Placement:** Place your target CSV files (e.g., `sales.csv`) into the same directory where the executable runs[cite: 877].
* [cite_start]**Execution:** Run the app within Xcode to build and initiate the terminal-based command prompt[cite: 878, 879].

### 2. Core Operation
* [cite_start]**Natural Language Ingestion:** You can load data by describing the file you want to access[cite: 540].
* [cite_start]**Automated Summaries:** Request a high-level overview of the data structure, including column names and row counts[cite: 542, 543].
* [cite_start]**Hybrid Visualization:** The application uses a terminal interface to process requests but launches a graphical SwiftUI window to display charts[cite: 544, 545].

---

## 🗣️ Example Prompts

[cite_start]The engine acts as a **semantic router**, interpreting your intent and passing it to validated Swift functions[cite: 113, 114].

| Task | Example Prompt |
| :--- | :--- |
| **Load Data** | [cite_start]"Load the table sales_data_sample" [cite: 885] |
| **Summarize** | [cite_start]"Summarise the dataset" [cite: 886] |
| **Chart (General)** | [cite_start]"Plot YEAR_ID and SALES" [cite: 887] |
| **Chart (Specific)** | [cite_start]"Create a bar chart for SALES and YEAR_ID" [cite: 764] |

> [cite_start]**Note:** Column names must be exact to be processed by the engine[cite: 888]. [cite_start]If you are unsure of the names, ask the tool to "Summarise the dataset" first[cite: 889].

---

## 📊 Visualization & Data Safety

* [cite_start]**Modal Blocking:** When a chart is launched, the terminal execution pauses until the user closes the chart window[cite: 605, 852].
* [cite_start]**Data Slicing:** To prevent data corruption, the application does not share the live DataFrame with the chart window[cite: 493]. [cite_start]Instead, it creates a "Slice" (a distinct copy in memory) specifically for rendering[cite: 494, 495].
* [cite_start]**Aggregation:** The application is designed to plot aggregated summaries rather than millions of raw data points to maintain performance[cite: 844, 845].

---

## 🔧 Troubleshooting

| Issue | Potential Solution |
| :--- | :--- |
| **"File not found"** | [cite_start]Verify the file name in your prompt matches the physical file name exactly (excluding .csv) and ensure it is in the working directory[cite: 895, 896]. |
| **"Column not found"** | [cite_start]Check the output of the "Summarise" command to see the actual column headers[cite: 899]. |
| **Chart window hidden** | [cite_start]Ensure you are running in a standard macOS GUI session; charts will not appear in headless or SSH environments[cite: 902]. |
| **App won't accept input** | [cite_start]Ensure you have closed any previously opened chart windows, as the terminal remains blocked until they are dismissed[cite: 605, 853]. |

---

## 🔒 Privacy & Security

[cite_start]This system is built to avoid the security deficits of cloud-based AI[cite: 189].
* [cite_start]**Local Inference:** All processing occurs strictly on-device; user data is never transmitted to external servers[cite: 363, 411].
* [cite_start]**Air-Gapped Intelligence:** By executing logic via native local code, the system is immune to targeted adversarial extraction of query data[cite: 208, 209].
* [cite_start]**Deterministic Security:** Security is an inherent property of the system; if the AI requests an action not in the pre-compiled library, the request simply fails[cite: 181, 183].
