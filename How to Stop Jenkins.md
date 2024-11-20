To stop Jenkins on an Ubuntu Linux system, you can use the following commands depending on how Jenkins was installed.

---

### 1. **Stop Jenkins (Systemd-based Installation)**
If Jenkins was installed as a service and uses **systemd**, you can stop it with:
```bash
sudo systemctl stop jenkins
```

---

### 2. **Check the Jenkins Service Status**
To confirm Jenkins has stopped:
```bash
sudo systemctl status jenkins
```
Look for the `inactive` or `stopped` state in the output.

---

### 3. **If Jenkins is Running in a Custom Way**
If you started Jenkins manually (e.g., using the `java -jar` command), you can stop it by:
- **Finding the Jenkins Process ID (PID):**
  ```bash
  ps aux | grep jenkins
  ```
  Look for the Jenkins process (e.g., `java -jar jenkins.war`) and note the PID.

- **Killing the Process:**
  ```bash
  kill -9 <PID>
  ```
  Replace `<PID>` with the actual process ID.

---

### 4. **If Jenkins is Running in a Docker Container**
If Jenkins is running inside a Docker container, stop the container:
```bash
docker ps
docker stop <container_id_or_name>
```

---

