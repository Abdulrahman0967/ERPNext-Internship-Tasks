# Linux Basic Commands Cheat Sheet

## 1. Folder Management
* **`mkdir`**: Creates directories.
  * *Example:* `mkdir -p my_project/logs` (Creates parent and child directories at once).

## 2. File Creation and Writing
* **`echo` and `>` / `>>`**: Prints text and redirects it to a file.
  * *Example (Create/Overwrite):* `echo "Server started" > server.log`
  * *Example (Append):* `echo "New error found" >> server.log`

## 3. Searching inside Files
* **`grep`**: Searches for a specific word or pattern inside a file.
  * *Example:* `grep "error" server.log`

## 4. Live File Monitoring
* **`tail -f`**: Monitors a file and outputs appended data in real-time as the file grows.
  * *Example:* `tail -f server.log`

## 5. Execution Permissions
* **`chmod +x`**: Grants execution permissions to a file/script.
  * *Example:* `chmod +x run_app.sh`
* **Run Script**: Use `./` to execute a script in the current directory.
  * *Example:* `./run_app.sh`  