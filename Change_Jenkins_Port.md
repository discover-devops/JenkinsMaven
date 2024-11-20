To change the default Jenkins port (8080) on an Ubuntu Linux system, follow these steps:

---

### 1. **Determine How Jenkins Was Installed**
- **Installed via `apt`**: Jenkins typically runs as a systemd service.
- **Manual installation**: Jenkins might run as a standalone JAR file.

---

### 2. **Change the Port for Systemd-based Installation**
If Jenkins was installed using `apt`, modify its configuration file:

1. **Open the Configuration File**:
   ```bash
   sudo nano /etc/default/jenkins
   ```

2. **Locate the Port Configuration**:
   Find the line that looks like this:
   ```bash
   HTTP_PORT=8080
   ```

3. **Change the Port Number**:
   Update `8080` to your desired port number (e.g., `9090`):
   ```bash
   HTTP_PORT=9090
   ```

4. **Save and Exit**:
   Press `Ctrl + O`, then `Enter` to save, and `Ctrl + X` to exit.

5. **Restart Jenkins**:
   ```bash
   sudo systemctl restart jenkins
   ```

---

### 3. **Change the Port for Manual Installation**
If you run Jenkins manually using `java -jar`, you can specify the port using the `--httpPort` option:

1. Stop the existing Jenkins instance:
   ```bash
   ps aux | grep jenkins
   kill -9 <PID>
   ```

2. Start Jenkins with a new port:
   ```bash
   java -jar jenkins.war --httpPort=9090
   ```

---

### 4. **Check the New Port**
After changing the port, verify Jenkins is accessible using the new port. Open a browser and visit:
```
http://<your_server_ip>:9090
```

---

### 5. **Firewall Rules (If Applicable)**
Ensure the new port is allowed through the firewall. For example:
```bash
sudo ufw allow 9090
sudo ufw reload
```

---
