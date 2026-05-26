# Job Platform

A modern Ruby on Rails application configured with Slim templates, Tailwind CSS, Hotwire, and MySQL.

## 🛠 Prerequisites

Make sure you have the following installed on your machine:
- **Ruby:** 3.3.6
- **Database:** MySQL

## 🚀 Getting Started

Follow these steps to set up the project locally:

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd job-platform
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Set up the database**
   Ensure your MySQL server is running. Then run:
   ```bash
   bin/rails db:create db:migrate db:seed
   ```

4. **Start the development server**
   Use the executable script to start both the Rails server and asset watchers (Tailwind):
   ```bash
   bin/dev
   ```
   *The application should now be running at [http://localhost:3000](http://localhost:3000).*

## 🧪 Testing

To run the Minitest test suite:
```bash
# Run unit and functional tests
bin/rails test

# Run system tests
bin/rails test:system
```

## 💅 Linting & Code Formatting

The project enforces code style using **RuboCop** (for Ruby files) and **Slim-Lint** (for views). We enforce the use of single quotes (`'`) over double quotes across both.

**Run linters:**
```bash
bundle exec rubocop
bundle exec slim-lint app/views
```

**Auto-format Ruby code:**
```bash
bundle exec rubocop -A
```

## 📦 Deployment

This project is ready to be containerized using Docker and deployed via [Kamal](https://kamal-deploy.org/).
- `config/deploy.yml`: Contains infrastructure configuration.
- `Dockerfile`: Production-ready image definition.
