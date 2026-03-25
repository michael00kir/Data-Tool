Application LLM Interfacing: Deterministic Local Semantic Routing
This project represents a fundamental paradigm shift in software engineering: the transition from AI that generates code to Intelligent Engines where natural language serves as the interface for deterministic, native execution.

By leveraging Apple Foundation Models to drive pre-compiled, optimized Swift binaries, this application eliminates the risks of hallucinated syntax and execution failures common in Python-based agents and MCP servers.

🚀 Key Features
Semantic Routing: The AI functions solely as a router, passing user intent as arguments to pre-validated, deterministic functions.

Privacy-Centric Architecture: 100% local inference ensuring data sovereignty; no data ever leaves the device, making it mathematically impossible for remote interception.

Hardware Determinism: By running locally on Apple Silicon with a constant batch size of 1, the system eliminates the non-determinism and "logit flips" inherent in cloud-based providers.

Hybrid TUI/GUI Visualization: A robust terminal interface capable of spawning isolated, thread-safe SwiftUI windows for data visualization (Bar, Line, Point, and Area charts).

Automated Data Summarization: Instant semantic analysis of CSV datasets, providing high-level textual overviews of data structures.

🏗️ Technical Architecture
The system decouples AI reasoning from application execution to achieve "structural immunity".

Interface Layer: Uses Apple’s SystemLanguageModel to detect intent and extract parameters via Guided Generation (Constrained Decoding).

Logic Layer (The Engine): A modular Swift backend that handles data manipulation via the TabularData framework.


Execution Loop: Follows a strict "Re-Act" (Reason and Act) loop where the model generates a "stop token" to request client-side tool execution.

🛠️ Technology Stack
Language: Swift (Compiled via LLVM for type and memory safety).

AI Framework: Apple FoundationModels (macOS 15.1+).

Data Management: TabularData (Native DataFrame handling).

UI/UX: SwiftUI & Swift Charts for visualization; AppKit for window management.

⚠️ Current Limitations
Platform Specific: Exclusively developed for macOS using first-party frameworks.

Memory Bound: Loads entire CSV files into RAM; not suitable for datasets exceeding available memory.

Context Window: Restricted to 4,096 tokens, requiring a stateless session approach for prompt handling.
