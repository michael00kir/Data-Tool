# Security

## Overview
This project is built on the philosophy that **security should be an inherent property of system design**, not a reactive layer of filters or guardrails. By utilizing a **Deterministic Local Semantic Routing Engine**, this application eliminates the primary vectors for data exfiltration and malicious code execution common in cloud-based AI systems.

---

## Core Security Pillars

### 1. Data Sovereignty & Local Execution
* **Zero Data Transportation**: All inference occurs strictly on-device using Apple Foundation Models. 
* **Air-Gapped Potential**: The architecture requires no internet connectivity or remote API calls, rendering network-based interception mathematically impossible.
* **Privacy by Architecture**: Sensitive data remains within the device's secure enclave, ensuring compliance with strict regulations like GDPR or HIPAA by design.

### 2. Structural Immunity to Injection
Unlike standard AI agents that generate and execute raw Python code, this system utilizes a **Semantic Router** approach:
* **No Interpreter Access**: The application environment does not include a Python interpreter, meaning there is no "weak link" for executing hallucinated or malicious scripts.
* **Pre-Compiled Boundaries**: The AI is restricted to selecting from a finite, immutable list of pre-compiled Swift functions. 
* **Binary Constraints**: If an attacker attempts a prompt injection to trigger a malicious action, the request simply fails because the underlying engine possesses no vocabulary or capability to execute it.

### 3. Hardware Determinism
* **Logit Flip Mitigation**: Cloud-based LLMs often suffer from non-determinism due to dynamic batching on shared GPUs. 
* **Reproducible Logic**: By running locally on Apple Silicon with a constant Batch Size of 1, the system ensures bitwise reproducibility in the AI’s decision-making process.

---

## Technical Safeguards

| Feature | Protection Mechanism |
| :--- | :--- |
| **Guided Generation** | Uses **@Generable** macros to force the model to adhere to rigid mathematical schemas, preventing syntax errors. |
| **Constrained Decoding** | Masks invalid tokens at the probability level so the model cannot generate unauthorized function calls. |
| **Stateless Sessions** | Re-initializes the AI session for every prompt to prevent "reasoning spirals" or emotional escalation. |
| **Data Isolation** | Visualization windows use **"Slices"** (memory copies) of data to ensure rendering processes cannot corrupt the primary data store. |

---

## Reporting a Vulnerability
While this system is designed to be deterministic and secure, we value the contribution of the security community. If you discover a potential vulnerability within the Swift engine or the semantic routing logic:

1. Please **do not** open a public Issue.
2. Contact the maintainer directly at the email provided in the project documentation.
3. Provide a detailed summary of the prompt or data state required to reproduce the issue.

We aim to acknowledge all reports within 48 hours and provide a resolution plan for any verified architectural flaws.
