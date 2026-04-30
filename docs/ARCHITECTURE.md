# TaskApp AWS Architecture

## Overview
Full-stack task management application deployed on AWS using a multi-service architecture.

## AWS Services Used

### EC2 (Elastic Compute Cloud)
- Hosts the Flask backend API
- Instance type: t2.micro (Free Tier eligible)
- OS: Ubuntu 22.04 LTS
- Nginx as reverse proxy on port 80
- Gunicorn running Flask on port 5000

### S3 (Simple Storage Service)
- Hosts the React frontend static files (HTML, CSS, JS)
- Configured for static website hosting
- Bucket policy allows public read access

### CloudFront
- CDN sitting in front of S3
- Provides HTTPS for the frontend
- Caches static files at edge locations for fast loading

### RDS (Relational Database Service)
- Managed PostgreSQL database
- Instance type: db.t3.micro (Free Tier eligible)
- Accessible only from EC2 security group (not public)

## How It Connects
Users visit the CloudFront URL which serves the React frontend from S3. The frontend makes API calls to the EC2 backend. The backend connects to the RDS PostgreSQL database. RDS is only accessible from EC2, not from the public internet.

## Security
- RDS is not publicly accessible - only EC2 can connect
- EC2 security group allows inbound on ports 22 (SSH) and 80 (HTTP)
- JWT-based authentication for API endpoints
- CORS restricted to CloudFront domain

## Environment Variables (Backend)
- DATABASE_URL: RDS PostgreSQL connection string
- SECRET_KEY: JWT signing key
- ALLOWED_ORIGINS: CloudFront frontend URL
- PORT: Application port (default 5000)

## Repositories
- GitHub: github.com/charvenswhales/taskapp
