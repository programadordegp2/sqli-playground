# Explanation
This SQLi Playground comes from the exploit located at https://www.exploit-db.com/exploits/51914

# Exploit Content

Located in file called Exploit.txt in this repo.

# Usage

1. Clone the repository
2. Run docker build -t YourCustomImageName .
3. Start your container with the image:

    3a. docker run -p 80:80 -d --name ContainerName YourCustomImageName

    3b. Use Docker Desktop application

4. Navigate to http://localhost