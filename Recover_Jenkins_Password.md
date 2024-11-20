To recover Jenkins credentials, follow one of these methods based on your setup:

### 1. **If You Have Access to Jenkins Home Directory (`config.xml` method)**

1. **Stop the Jenkins Service**:
   - Run the following command to stop Jenkins:
     ```bash
     sudo systemctl stop jenkins
     ```

2. **Edit the `config.xml` File**:
   - Navigate to the Jenkins home directory (default is `/var/lib/jenkins` on Linux).
   - Open the `config.xml` file in a text editor:
     ```bash
     sudo nano /var/lib/jenkins/config.xml
     ```

3. **Disable Security Temporarily**:
   - Look for the `<useSecurity>` tag in the `config.xml` file and set it to `false`:
     ```xml
     <useSecurity>false</useSecurity>
     ```
   - Save and close the file.

4. **Restart Jenkins**:
   - Start Jenkins again:
     ```bash
     sudo systemctl start jenkins
     ```

5. **Login Without Authentication**:
   - Open Jenkins in your browser; it should not require login.
   - Navigate to **Manage Jenkins > Configure Global Security** and reset the admin password or add a new user.
  
6. **Re-enable Security**:
   - Once you reset credentials, change `<useSecurity>` back to `true` in `config.xml` and restart Jenkins to re-enable security.

### 2. **Using Jenkins CLI to Reset Password**

If you have access to the Jenkins command line interface (CLI) and a known admin account exists:

1. **Open Jenkins CLI**:
   - Run the following command to reset a specific user’s password:
     ```bash
     java -jar jenkins-cli.jar -s http://localhost:8080/ groovy = <<EOF
     import jenkins.model.*
     def instance = Jenkins.getInstance()
     def user = instance.getUser("admin")
     user.setPassword("new_password")
     user.save()
     EOF
     ```

Replace `"admin"` with the username and `"new_password"` with the desired new password.

### 3. **Reset Admin Password via Jenkins Script Console (if still logged in)**

1. **Navigate to the Jenkins Script Console**:
   - Go to `http://<jenkins_url>/script` (requires login).

2. **Run Script to Reset Password**:
   - Run the following script in the console:
     ```groovy
     import hudson.security.HudsonPrivateSecurityRealm
     def user = Jenkins.instance.securityRealm.createAccount("admin", "new_password")
     user.save()
     ```

This script resets the admin password to `"new_password"`.

### 4. **Restore from Backup**

If you have a backup of Jenkins:

1. Restore the backup files to the Jenkins home directory.
2. Restart Jenkins to recover the previous credentials.

After following these methods, be sure to secure Jenkins again by re-enabling security and resetting passwords as needed.
