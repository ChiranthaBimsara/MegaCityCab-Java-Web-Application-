## Continuous Integration (CI) Setup

This project uses GitHub Actions to automate the build and deployment process for the Java Web Application.

### CI Workflow Steps:
1. **Code Checkout**: Pulls the latest code from the repository.
2. **JDK Setup**: Installs JDK 11 on the CI server.
3. **Tomcat Setup**: Installs and runs Tomcat 9 to deploy the Java web application.
4. **Build & Deploy**: Compiles Java code, creates a `.war` file, and deploys it to Tomcat.
5. **Test Execution** (optional): Executes any predefined tests (if set up).

### Viewing Workflow Results
You can view the status of the workflow in the **Actions** tab of the repository.
