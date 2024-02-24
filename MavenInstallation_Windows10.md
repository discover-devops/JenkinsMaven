Step-by-step guide on how to install Apache Maven on Windows 10:

### Prerequisites:

- **Java:** Maven requires Java to be installed. Ensure you have Java installed on your system. You can download it from [Java's official website](https://www.oracle.com/java/technologies/javase-downloads.html).

### Steps:

1. **Download Apache Maven:**
   - Go to the [Apache Maven download page](https://maven.apache.org/download.cgi).
   - Under "Files," find the latest version of Apache Maven and download the binary zip archive (e.g., `apache-maven-x.x.x-bin.zip`).

2. **Extract Maven Archive:**
   - Extract the downloaded zip file to a location on your computer (e.g., `C:\Program Files`).
   - This will create a folder like `apache-maven-x.x.x`.

3. **Set Environment Variables:**
   - Right-click on the Start menu and select "System."
   - Click on "Advanced system settings" on the left.
   - Click the "Environment Variables" button.
   - Under "System variables," click on "New" and add the following variables:
     - Variable Name: `M2_HOME`
     - Variable Value: Path to the Maven installation directory (e.g., `C:\Program Files\apache-maven-x.x.x`).
   - Find the "Path" variable in the "System variables" section, select it, and click "Edit."
   - Add a new entry with `%M2_HOME%\bin` to the end of the "Variable value."

4. **Verify Maven Installation:**
   - Open a new Command Prompt or PowerShell window.
   - Type the following command to verify that Maven is installed:
     ```bash
     mvn -version
     ```
   - You should see information about the Maven version, Java version, and other details.
