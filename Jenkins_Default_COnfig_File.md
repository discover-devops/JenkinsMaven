The default configuration file for Jenkins is located at:

```bash
/var/lib/jenkins/config.xml
```

This file contains the main Jenkins configuration, including system settings, security, and global configurations. 

Other important Jenkins configuration files and directories include:

- **User-specific configurations**: Located in `/var/lib/jenkins/users/`, where each user has a folder with settings.
- **Job configurations**: Each job has its own `config.xml` file within the job's directory, typically found at `/var/lib/jenkins/jobs/<job_name>/config.xml`.

The path `/var/lib/jenkins` is the default Jenkins home directory on Linux systems, but it may vary depending on your installation method or operating system. You can find the actual Jenkins home directory by checking the `JENKINS_HOME` environment variable.


The default port for Jenkins (8080) is usually specified in the Jenkins startup configuration, depending on how Jenkins is installed:

1. **For Linux installations using the default package**:
   - The port is typically defined in the Jenkins service file, which may be located at `/etc/default/jenkins` or `/etc/sysconfig/jenkins`.
   - In the configuration file, you’ll find a line like this:

     ```bash
     HTTP_PORT=8080
     ```

2. **For Docker installations**:
   - When running Jenkins in a Docker container, the port is specified in the Docker run command, e.g., `-p 8080:8080`, or in the Docker Compose file.

3. **Custom Installations**:
   - If Jenkins is started as a standalone Java application, you can specify the port with the `--httpPort` parameter:

     ```bash
     java -jar jenkins.war --httpPort=8080
     ```

If you need to change the port, you can edit the `HTTP_PORT` value in the relevant configuration file and restart Jenkins.
