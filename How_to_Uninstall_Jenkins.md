To uninstall Jenkins from an Ubuntu system, follow these steps based on how Jenkins was installed:

---

### **1. Uninstall Jenkins (Installed via `apt`)**
If Jenkins was installed using `apt`, you can remove it with the following commands:

#### **Step 1: Stop Jenkins Service**
```bash
sudo systemctl stop jenkins
```

#### **Step 2: Uninstall Jenkins**
```bash
sudo apt-get remove --purge jenkins
```

#### **Step 3: Remove Residual Configuration Files**
```bash
sudo apt-get autoremove
sudo apt-get autoclean
```

#### **Step 4: Remove Jenkins Files**
To delete all Jenkins-related files (e.g., workspace, logs, and configurations):
```bash
sudo rm -rf /var/lib/jenkins
sudo rm -rf /etc/jenkins
sudo rm -rf /var/log/jenkins
```

---

### **2. Uninstall Jenkins (If Manually Installed)**
If Jenkins was manually installed (e.g., as a JAR file), follow these steps:

#### **Step 1: Stop the Jenkins Process**
Find the Jenkins process and stop it:
```bash
ps aux | grep jenkins
kill -9 <PID>
```

#### **Step 2: Remove Jenkins Files**
Delete the directory where Jenkins was extracted or stored:
```bash
sudo rm -rf /path/to/jenkins
```

#### **Step 3: Clean Up**
Remove any symbolic links or leftover files:
```bash
sudo rm -rf ~/.jenkins
```

---

### **3. Check for Additional Cleanup**
Ensure no Jenkins-related ports are active:
```bash
sudo netstat -tuln | grep 8080
```

If any Jenkins-specific rules were added to the firewall, you can remove them:
```bash
sudo ufw delete allow 8080
sudo ufw reload
```

---

