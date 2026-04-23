![CI/CD Pipeline](https://github.com/charvenswhales/taskapp/actions/workflows/ci.yml/badge.svg)

# Team Task Manager

A full-stack Team Task Manager application with a Kanban-style board. Built with Flask, React and PostgreSQL. Fully containerized with Docker.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React 18, TypeScript, Vite, Tailwind CSS |
| Backend | Python Flask, SQLAlchemy, JWT Auth |
| Database | PostgreSQL |
| DevOps | Docker, Docker Compose |

## Features

- Kanban board with To Do, In Progress and Done columns
- Drag and drop tasks between columns
- Create, update and delete tasks
- Task priorities (low, medium, high)
- JWT Authentication with login/logout
- Responsive design for mobile and desktop

## Running with Docker

Clone the repository and start all services with one command:

    git clone https://github.com/charvenswhales/taskapp.git
    cd taskapp
    docker-compose up --build

Open your browser at http://localhost:5173

## Demo Credentials

| Role | Username | Password |
|------|----------|----------|
| Admin | admin | admin123 |
| User | user | user123 |

## Author

Olajesu Duro Francis — DevOps Engineer
GitHub: https://github.com/charvenswhales
LinkedIn: https://www.linkedin.com/in/olajesu-duro-francis
