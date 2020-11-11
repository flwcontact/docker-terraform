# docker-terraform
Testing Docker, Docker Compose and Terraform

## Docker and docker-compose

This a is basic noejs application with a hello message. It also contains a test to check database connection. To run it in your local machine, run: `docker-compose up`

To test it, point your browser to:

`http://localhost:8080/` -- It responds with "Hello Fake Product"

`http://localhost:8080/ready` -- It provides an status of the connection to the database

For making it work, we have the latest official docker images for nodejs and postgres.

This is far away from a production-like environment. I wouldn't recommend docker-compose at all for production.

### Questions for the docker setup

#### "How would you test this application?"
First, I don't have any expertise in nodejs, so this is more like a general answer: for the code level we can start with a linter, then unit tests to check if both hello message and the database conection are working as expected (in a quick search, mocha and/or chai seem to be an option). Also, I included the command `npm ci` as it helps to catch errors and inconsistencies with dependencies.

Thinking in a "production-like" env, I included a simple readiness check on the /ready endpoint which checks database connection. We could do the same for the application port. Some synthetic monitoring could check if the application is running in the right port and presenting the expected results in both endpoints.

#### "How would you deploy this application?"
This is a very general question. I assume we're talking about a "production-like" environment for this nodejs service, but it also depends on your code repo structure and operation ( feature branches, releases, etc).

In general (for docker), after pushing new code to the repo:
- We can have CI tests running
- Then a "docker build" process creates an image which will be published to a docker reposioty
- Then a deployment is triggered towards your infrastructure using the same image from the docker reposity
- We can have many different strategies to switch traffic to this new application version (blue/green, cannary, rolling updates), but it really depends if your infrastructure supports it

There are many different CI/CD tools (Jenkins, Spinnaker, ArgoCD, CircleCI, etc) and probably the best choice is the one that fits better for the ecosystem. If the question is more towards which technology could be used, again, it depends on the infrastructure in place: usually package managers can (should) be used to take care of the right versioning. For Kubernetes we could use helm, for example.

#### "How would you manage configurations for secrets?"
- Not storing on config files or in the code repository
- Using environment variables (I did this in this service just as an example)
- Storing credentials in a credential management tool
