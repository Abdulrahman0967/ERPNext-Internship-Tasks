# Linux Basic Commands Cheat Sheet (ERPNext / Bench Prep)

## 1. Navigation & Folder Management
* **`pwd`**: Prints the current working directory.
* **`cd`**: Changes the current directory.
  * *Example:* `cd frappe-bench/`
* **`mkdir -p`**: Creates directories (including parent directories).
  * *Example:* `mkdir -p my_project/logs`

## 2. File Creation & Text Editing
* **`echo` and `>` / `>>`**: Prints text and redirects it to a file.
  * *Example:* `echo "Server started" > server.log`
* **`nano`**: A beginner-friendly terminal text editor.
  * *Example:* `nano site_config.json` (Ctrl+O to save, Ctrl+X to exit).
* **`vim`**: An advanced terminal text editor.
  * *Example:* `vim script.py` (Press 'i' to insert, ':wq' to save and quit).

## 3. Reading & Searching inside Files
* **`cat`**: Reads and outputs the entire content of a file.
  * *Example:* `cat site_config.json`
* **`grep`**: Searches for a specific word or pattern inside a file.
  * *Example:* `grep "error" bench.log`
* **`tail -f`**: Monitors a file and outputs appended data in real-time.
  * *Example:* `tail -f logs/frappe.log`

## 4. Permissions & Execution
* **`chmod +x`**: Grants execution permissions to a file/script.
  * *Example:* `chmod +x setup_bench.sh`
* **Run Bash Script**: Use `./` to execute a script in the current directory.
  * *Example:* `./setup_bench.sh`
* **Run Python Script**: Executes a Python file.
  * *Example:* `python3 custom_script.py`