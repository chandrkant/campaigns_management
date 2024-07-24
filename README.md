# User Management API

This project implements a User Management API using Ruby on Rails and MySQL. The API allows for listing all users, adding new user records, and filtering users based on campaign names present in their `campaigns_list`. The project also includes a simple frontend UI for interacting with the API.

## Table of Contents

- [Installation](#installation)
- [Database Setup](#database-setup)
- [API Endpoints](#api-endpoints)
- [Frontend UI](#frontend-ui)
- [Deployment](#deployment)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. Clone the repository:

   ```bash

   ```

2. Install the required gems:

   ```bash
   bundle install
   ```

3. Set up the database:

   ```bash
   rails db:create
   rails db:migrate
   ```

## Database Setup

Ensure you have MySQL installed and running. Create a database and a table with the following structure:

```sql
CREATE DATABASE user_management;

USE user_management;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  campaigns_list JSON NOT NULL
);

h1 API Endpoints
List Users
Endpoint: GET /users.json
Endpoint: GET /users
Description: Retrieve all users from the database.
Add New User
Endpoint: POST /users
Description: Add a new user to the database.
Request Body:


{
  "user": {
    "name": "John",
    "email": "john@gmail.com",
    "campaigns_list": [{"campaign_name": "cam1", "campaign_id": "id1"}, {"campaign_name": "cam2", "campaign_id": "id2"}]
  }
}

Filter Users by Campaign Names
Endpoint: GET /users/filter
Description: Retrieve users whose campaigns_list contains any of the specified campaign names.
Query Parameters:
campaign_names: Comma-separated list of campaign names.
```
