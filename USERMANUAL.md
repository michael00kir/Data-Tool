# User Guide

## How to Run
1. **Prerequisites:** Ensure you are on a macOS device with Xcode installed with Apple Intelligence Enabled with at least MacOS 15.1 running on an Apple Silicon Mac with at least M1 chip.
2. **Setup:** Open the project in Xcode.
3. **Data Preparation:** The datasets are provided inside, however you can place any target CSV files (e.g., `sales.csv`) in the same directory where the executable runs.
4. **Execution:** Run the app. This will automatically build and run the app for you inside Xcode. You will be greeted by a command prompt.
5. **Interaction:** Type natural language commands.
6. **Visualisation:** If a chart launches, view it, then close the window to resume typing commands.

---

## Example Prompts
Use these examples to explore the capabilities of the tool:

* "Load the table sales_data_sample." (Loads `sales_data_sample.csv`)
* "Summarise the dataset." (Prints column names and types and provides the dataframe summary)
* "Plot YEAR_ID and SALES" (Aggregates revenue and displays a bar graph as standard, if another is not chosen. Other types need to be specifically mentioned in the prompt)

> **Keep in mind:** The column name needs to be exact as it is passed in straight into the function. This can be provided by the model in the response when a table is successfully loaded and also when the dataset is summarised if unsure, ask to summarise the dataset.

---

## Troubleshooting

* **Issue: "File not found" error.**
    * **Fix:** Verify that the file name matches your prompt exactly (excluding the .csv extension in the prompt) and that the file is physically located in the current working directory of the terminal shell.
* **Issue: "Column not found" error.**
    * **Fix:** The model might have hallucinated a column name. Check the output of the "Summarise" command to see the actual column headers.
* **Issue: Chart window does not appear.**
    * **Fix:** This usually happens if the app is run in a headless environment (like SSH) or if the activation policy failed. Ensure you are running this within a standard macOS GUI session.
