
# Lienzu LLM

Lienzu LLM is an open source project that seeks to integrate data sources from a company without exposing sensitive data from them; for this purpose, an isolated ecosystem made up of four elements is developed:

- A local microservice developed with FastAPI.
- A database built on postgres SQL.
- An LLM that understands the needs of non-technical users. Converting prompts into SQL queries.
- A second LLM that returns the best possible answer to the query made by the initial user.


## Installation

Deploy the Docker images with docker compose, open your terminal and execute this commands. 

```bash
mkdir ./init.sql
wget -O ./init.sql/init_users.sql https://raw.githubusercontent.com/Natan1995/llm_docker_service/refs/heads/main/init.sql/init_users.sql
wget -O docker-compose.yml https://raw.githubusercontent.com/Natan1995/llm_docker_service/refs/heads/main/docker-compose.yml

docker-compose up

```
    
## Usage/Examples

In a browser of your preference, you can get the database information with these routes:

```javascript
Get all users from database: 
http://localhost:8000/users

Get all products from database: 
http://localhost:8000/products

Get all sales from database: 
http://localhost:8000/sales

Custom queries for databases: 
http://localhost:8000/query/?query=SELECT%20*%20FROM%20users
```


## Authors

- [@Natan1995](https://github.com/Natan1995)

