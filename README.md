# Project Setup Guide

This is the start of the **Maven Project** collegetutorial. This is entirely done for the assistance of the students in setting up the project while working in a group.

This project is initially set up with **Tomcat Version 8.5**, with the project properties of **dynamic web module** version 3.1. I would like to request the maintainers to know this. 

**DATABASE SETUP** Please read **README.MD** in the **db** folder.

## Prerequisites
Before you start, make sure you have the following installed on your system:
- **JDK 11 or later**
- **Apache Maven**
- **Apache Tomcat** (or any other servlet container)
- **Eclipse IDE** (or any other IDE that supports Maven and Servlets)

## Steps to Set Up the Project

### 1. Clone the Repository

First, clone the project from GitHub to your local machine:

```bash
git clone https://github.com/yourusername/collegetutorial.git

cd your-repository
```
### 2. Import the project in eclipse

- Open Eclipse.

- Go to File → Import.

- Select Maven → Existing Maven Projects and click Next.

- Click Browse and select the cloned project folder.

- Make sure pom.xml is detected, then click Finish.

### 3. Update Maven Dependencies

- Right-click on the project in Eclipse.

- Select Maven → Update Project (Alt + F5).

- Check Force Update of Snapshots/Releases and click OK.

### 4. Set Up Tomcat Server (If Needed Otherwise go to Next Step)

If your project runs on Tomcat, follow these steps:

- Open Eclipse and go to Servers view. >>> If the Servers tab is not visible, enable it via Window → Show View → Servers.

- Right-click inside the Servers tab → New → Server.

- Select Apache → Tomcat (8.5 to work on same server) and click Next.

- Set the Tomcat installation directory and click Finish.

- Add your Maven project to the Tomcat server:	
	- Right-click on the Tomcat server → Add and Remove.
	- Move your project from Available to Configured and click Finish.

- Start the Tomcat server.

### 5. Add Server Runtime Libraries in Eclipse

To add server runtime libraries (such as Tomcat) to the classpath of your Maven project, follow these steps:

**5.1 Open Project Properties**
- Right-click on your project in **Eclipse**.
- Select **Properties** from the context menu.

**5.2 Navigate to Build Path**
- In the **Properties** dialog, select **Java Build Path** on the left.

**5.3 Add Library**
- In the **Java Build Path** window, go to the **Libraries** tab.
- Click **Add Library** → **Server Runtime** → **Next**.

**5.4 Select the Server**
- In the list of available server runtimes, select your **Tomcat** server
- If your server runtime is not listed, you can add it by clicking **Add External Servers**, and then browse to the location where your server is installed.

**5.5 Finish**
- After selecting the server runtime, click **Finish** to add it to your project.

**5.6 Apply Changes**
- Click **Apply and Close** to save the changes.

**Verify Classpath**

Once the server runtime libraries are added to your classpath, you should be able to access the required classes (such as HttpServlet, ServletException, etc.) from your servlet API in your project.

### 6. Troubleshooting

These are some **troubles** that you could mostly likely face. If there are any other problem that you think needs to be mentioned which will help others, please feel free to add here.
**6.1 Missing Class Errors**
- If you are still seeing missing class errors after adding the runtime libraries, ensure the Maven scope for your dependencies is set correctly (e.g., provided).

**6.2 404 Not Found**
- Ensure that the servlet URL mapping in web.xml or @WebServlet annotation matches the path you are trying to access in the browser.

**6.3 Servlet not deploying**
- Make sure that the Dynamic Web Module facet is enabled in Eclipse. Go to Project Facets → ensure Dynamic Web Module is checked.

**6.4 ClassNotFoundException**
- Ensure that the correct dependencies are in your pom.xml, and run mvn clean install to rebuild the project.
