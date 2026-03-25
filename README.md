# Application LLM Interfacing: A Deterministic Local Semantic Routing Engine Using Apple Foundation Models

**Author:** Michael Kir
**Supervisor:** Yongchao Huang
**Institution:** University of Westminster - School of Computer Science & Engineering
**Degree:** MSc Data Science & Analytics
**Date:** January 2026

---

## Abstract
This project represents a shift from generative AI that writes code to **Intelligent Engines** where natural language serves as a deterministic interface for native execution. It showcases a fully local, privacy-centric application capable of complex data frame manipulation and chart building by leveraging **Apple Foundation Models** to drive pre-compiled, optimized Swift binaries. 

Unlike Python-based agents or Model Context Protocol (MCP) servers that rely on stochastic code generation, this architecture eliminates risks of hallucinated syntax by acting as a **semantic router**.

---

# Introduction

The history of computing is not merely a history of hardware; it is the history of the **diminishing barrier** between human intent and machine execution. 

For the first few decades, that barrier was a wall. The terminal interfaces of the early era demanded that the user speak the machine's language. If you didn't know the syntax, you didn't have the power. Then, in 1984, the paradigm shifted. When the Macintosh introduced the **Graphical User Interface (GUI)** to the consumer world, it democratised computing. Suddenly, you didn't need to be a linguist to operate a computer; you just needed to point and click.

### The Evolution of Interfaces
* **The Tyranny of the Button**: But the GUI introduced a new tyranny. As applications grew from simple spreadsheets like Excel to complex behemoths like Tableau and Power BI, the interface became crowded. 
* **The Complexity of Navigation**: Complexity was solved by adding more menus, more ribbons, and more toggles. The user knew what they wanted—*"Show me the sales trend for the last quarter"*—but to get there, they had to navigate a labyrinth of interface elements. We had traded the complexity of syntax for the complexity of navigation.
* **The Natural Language Interface**: Then came November 30, 2022. The release of ChatGPT oﬀered a tantalising glimpse of a third paradigm: the **Natural Language Interface**. For the first time, we could simply tell the computer what we wanted. 

### The Project Philosophy
The industry’s immediate reaction was to force this new intelligence into an "old box." Developers rushed to build systems where the AI would frantically write Python code to bridge the gap, eﬀectively trading the rigidity of the button for the **chaos of hallucinated scripts**.

This project was born from a refusal to accept that compromise. It is founded on a philosophy best articulated by **Steve Jobs** at the 1997 WWDC:

> "The way you get programmer productivity is by eliminating lines of code you have to write. The line of code that's the fastest to write, that never breaks, that doesn't need maintenance, is the line you never had to write."

This principle has always been true for software development. That’s why **low-code frameworks** have always prevailed and provide robust code even in production environments. It posed a need to conceptualise an application that would interface the same way with the user while preserving the benefits of a traditional GUI application.

The core question driving this project is: **“Can we directly interface an LLM through to the tools that it needs to use?”**—in this instance, directly to the data frame and the charts creation.

---

## Paper Structure

* **Structural Vulnerabilities**: Analyses current generative architectures, demonstrating why **hardware determinism** is a necessity for high-security environments.
* **Implementation Details**: Documents the development of a local, privacy-centric engine built upon **Apple Foundation Models**.
* **System Evaluation**: Validates the thesis that **intelligent engines** oﬀer a superior paradigm to generative scripting.

---

## Core Philosophy: The "Engine" Approach
The project validates that pre-compiled, native Swift engines outperform the generative code paradigm in stability, security, and speed.

* **LLM as the Interface**: The model is used strictly for natural language understanding and intent detection.
* **Deterministic Logic**: User intent is passed as arguments to pre-validated, pre-compiled functions.
* **Hardware Determinism**: Running locally on Apple Silicon ensures a constant **Batch Size of 1**, guaranteeing that the GPU executes identical kernel paths for every inference pass. This eliminates the "Logit Flip" risk common in non-deterministic cloud-based inference.

---

## Technical Stack
* **Language**: Swift (compiling directly to machine code via LLVM).
* **AI Framework**: `FoundationModels` (macOS 15.1+) providing system-level access to on-device LLMs.
* **Data Manipulation**: `TabularData` (Apple's native framework for data manipulation).
* **Visualization**: `SwiftUI` + `Swift Charts`.
* **Interface Bridge**: `AppKit` (used to manage the `NSApplication` lifecycle for spawning GUI windows from a CLI tool).

---

## System Architecture & Modules
The application is modular, separating the entry point from data processing and the UI layer:

### 1. Entry Point & Session Management
* **`main.swift`**: Bootstraps the application, initiates the interactive loop, and manages the lifecycle of the AI model sessions.

### 2. The Tooling Layer
* **`LoadTableTool.swift`**: Handles CSV ingestion using `@Generable` and `@Guide` macros to enforce strict JSON schemas for arguments.
* **`SummaryTool.swift`**: Generates high-level overviews of the dataset, including column names and types.
* **`ChartTool.swift`**: Defines the schema for visualization, restricting inputs to specific **Enums** for Aggregation and Chart types (Bar, Line, Point, Area).

### 3. Data Logic & Calculation
* **`DataAggregator.swift`**: The calculation engine for math aggregations (sum, average, count).
* **`ChartController.swift`**: Coordinates between the LLM and the data layer, implementing "fuzzy" column matching for user prompts.

---

## Security & Privacy
* **Data Sovereignty**: All inference occurs strictly on-device; user data never leaves the local environment.
* **Structural Immunity**: Security is an inherent property of the system design. Because there is no Python interpreter or generative scripting, the system is immune to traditional prompt injection attacks that target raw code execution.
* **Constrained Decoding**: The framework masks invalid tokens at the probability level, making it mathematically impossible for the model to output a syntax error.

---

## Implementation Limitations
* **Platform Exclusive**: Relies exclusively on macOS and Apple Silicon.
* **Memory Bound**: Loads the entire dataset into RAM; cannot handle datasets larger than available memory.
* **Context Window**: Uses a small context window (4,096 tokens), requiring a stateless session approach where the session re-initializes for every prompt.
