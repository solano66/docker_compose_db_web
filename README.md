# Docker Compose Practice Project

This project is a practice example using Docker Compose, consisting of the following three main components:
- **MySQL**: Acts as the database to store data.
- **Python (Flask)**: Backend service that retrieves data from the database and passes it to the frontend.
- **Nginx**: Serves as a reverse proxy to handle web requests and forward them to Flask.

The goal of this project is to display data from a MySQL database on a webpage by leveraging containerized services with Docker.

## Project Structure

The project structure is as follows:

```
│  docker-compose.yaml
│  README.md
│
├─flask
│  │  app.py
│  │  Dockerfile
│  │  requirements.txt
│  │
│  └─templates
│          index.html
│
├─MySQL
│      Dockerfile
│      my.csv                # CSV file for initializing data
│      my.sql                # SQL script for initializing the database
│
└─nginx
        default.conf
        Dockerfile
```

## How to Use

1. Ensure Docker and Docker Compose are installed on your system.
2. Clone this repository locally
3. Start Docker Compose:
   ```bash
   docker compose up --build
   ```
4. Open your browser and visit `http://localhost:80` to view the data displayed from the database.

## Component Details

### 1. MySQL
- A custom MySQL image is built using the provided Dockerfile.
- The `my.sql` script is executed during container startup to initialize the database, and data from `my.csv` is imported.

### 2. Flask
- Flask is used as the backend framework to retrieve data from the MySQL database and render it on the `index.html` template.
- Dependencies are listed in `requirements.txt`

### 3. Nginx
- Nginx acts as a reverse proxy, handling external requests and forwarding them to the Flask application.
- The configuration file `default.conf` defines the basic proxy settings.

## Notes

- This project is intended for **practice purposes only**, demonstrating how to integrate multiple services using Docker Compose.
- **For a more convenient way to integrate Flask and Nginx**:
  - Consider using [**tiangolo/uwsgi-nginx-flask**](https://hub.docker.com/r/tiangolo/uwsgi-nginx-flask), a pre-configured image that integrates Flask and Nginx automatically.
  - This project manually configures Flask and Nginx to help with learning and understanding multi-container setups.

## Future Improvements

1. Add test cases to verify the functionality of each component.
2. Optimize the database initialization scripts to support additional data formats.
3. Introduce a CI/CD pipeline for automated building and deployment.

## Authors
[solano66](https://github.com/solano66)

## Acknowledgments
Thank you to all the people who release code on GitHub.
