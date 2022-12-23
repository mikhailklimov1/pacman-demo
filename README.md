# pacman-canvas

An old classic, re-written in HTML5.
Visit http://pacman.platzh1rsch.ch to see it live or build it by yourself.

![Alt text](pacman-demo-app/img/game.jpg?raw=true "Game")

---

# Get started
## In local environment

1. Build dockerfile with command "podman build -t pacman ."
2. Run container with the command "podman run -d -p 8080:8080 pacman"
3. Enjoy the game =)
4. Change color of the wall:
  Edit file "pacman-canvas.js": Line 538: Change wall color from "Blue" to "Red"
5. Rebuild and recreate the container and see the changes.

---

## In K8s/ OpenShift environment

1. Create Jenkins mitlibranch pipeline refering to this repository. [Jenkinsfile](Jenkinsfile) 
2. Add variable **dockerhub-creds** to Jenkins with credentials to the image registry.
This variable is presented in the Jenkinsfile: https://github.com/KabarukhinAlexey-org/pacman-demo/blob/main/Jenkinsfile#L7-L8
 
3. Create [ApplicationSet](applicationSet.yaml) in K8s or in OpenShift 
