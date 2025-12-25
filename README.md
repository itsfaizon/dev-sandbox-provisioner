# Dev-Sandbox-Provisioner
A lightweight Bash utility designed to instantly provision isolated, web-based VS Code environments (containers) for guest developers.

## The Logic
This project demonstrates **Infrastructure as Code (IaC)** principles by automating the deployment of Docker containers with persistent storage and unique networking ports.

### Technical Breakdown (Docker Flags):
* `-d`: **Detached**. Runs the sandbox in the background.
* `-p [HostPort]:8443`: **Port Mapping**. Assigns a unique "door" for each guest to access their environment.
* `-v [HostPath]:[ContainerPath]`: **Volume Binding**. Ensures that if the container is destroyed, the user's code survives on the VPS.
* `-e PASSWORD="..."`: **Environment Variables**. Injects security credentials into the container at runtime.

## Usage
To jail a new guest on a specific port:
```bash
./project-jail.sh [GuestName] [PortNumber]
