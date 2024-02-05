
# Tomcat Installation on Linux Instance

## Install Apache Tomcat

1. Download Tomcat packages from [Tomcat Downloads](https://tomcat.apache.org/download-80.cgi) onto `/opt` on the Linux instance.

    ```sh
    # Create Tomcat directory
    cd /opt
    wget http://mirrors.fibergrid.in/apache/tomcat/tomcat-8/v8.5.35/bin/apache-tomcat-8.5.35.tar.gz
    tar -xvzf /opt/apache-tomcat-<version>.tar.gz
    ```

2. Give executing permissions to `startup.sh` and `shutdown.sh` in the `bin` directory.

    ```sh
    chmod +x /opt/apache-tomcat-<version>/bin/startup.sh 
    chmod +x /opt/apache-tomcat-<version>/bin/shutdown.sh
    ```

    > Note: You may get an error while starting Tomcat if Java is not installed. Ensure Java is installed.

3. Create symbolic links for Tomcat startup and shutdown scripts.

    ```sh
    ln -s /opt/apache-tomcat-<version>/bin/startup.sh /usr/local/bin/tomcatup
    ln -s /opt/apache-tomcat-<version>/bin/shutdown.sh /usr/local/bin/tomcatdown
    tomcatup
    ```

### Checkpoint:

Access the Tomcat application from the browser on port 8080:

- http://<Public_IP>:8080

4. To use unique ports, change Tomcat's port number to 8090. Update the port number in `conf/server.xml` and restart Tomcat.

    ```sh
    cd /opt/apache-tomcat-<version>/conf
    # Update port number in the "connector port" field in server.xml
    # Restart Tomcat after configuration update
    tomcatdown
    tomcatup
    ```

### Checkpoint:

Access the Tomcat application from the browser on port 8090:

- http://<Public_IP>:8090

5. Tomcat application may not allow login from the browser. Change a default parameter in `context.xml` to address this issue.

    ```sh
    # Search for context.xml
    find / -name context.xml
    ```

6. Comment (`<!--` & `-->`) the `Value ClassName` field in files under the `webapp` directory. Restart Tomcat services.

    ```sh
    /opt/tomcat/webapps/host-manager/META-INF/context.xml
    /opt/tomcat/webapps/manager/META-INF/context.xml

    # Restart Tomcat services
    tomcatdown
    tomcatup
    ```

7. Update user information in `tomcat-users.xml`. Add the following users to `conf/tomcat-users.xml`:

    ```sh
    <role rolename="manager-gui"/>
    <role rolename="manager-script"/>
    <role rolename="manager-jmx"/>
    <role rolename="manager-status"/>
    <user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>
    <user username="deployer" password="deployer" roles="manager-script"/>
    <user username="tomcat" password="s3cret" roles="manager-gui"/>
    ```

8. Restart the service and try logging in to the Tomcat application from the browser. It should be successful.
```
