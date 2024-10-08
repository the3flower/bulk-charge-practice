# Bulk Create Charge Exercise

## Project Overview

This project involves developing a Rails application to handle bulk creation of charges through CSV file uploads. The system will process the CSV files, create charges (transactions) based on the data, and track the status of each CSV file and its associated transactions.

## Story Breakdown

### 1. Project Setup

**Objective:** Initialize a new Rails application with the required tools and configurations.

- **Ruby Version:** 3.3
- **Rails Version:** 7.2
- **Background Job Processing:** Implement Sidekiq for managing background jobs.
  - Reference: [Sidekiq GitHub Repository](https://github.com/sidekiq/sidekiq)
- **Unit Testing:** Set up Minitest for testing and Fabricator for generating test data.
  - References:
    - [Minitest GitHub Repository](https://github.com/minitest/minitest)
    - [Fabricator Documentation](https://fabricationgem.org/)
- **External HTTP Requests:** Use Faraday for handling external HTTP requests.
  - Reference: [Faraday GitHub Repository](https://github.com/lostisland/faraday)
- **File Upload:** Configure ActiveStorage for handling file uploads.
  - Reference: [ActiveStorage Overview](https://guides.rubyonrails.org/active_storage_overview.html)

### 2. Authentication

**Objective:** Implement Basic Authentication to secure endpoints.

- **Details:** Implement HTTP Basic Authentication for the application. No user login is required for this assignment.
  - Reference: [Rails Basic Authentication Documentation](https://api.rubyonrails.org/classes/ActionController/HttpAuthentication/Basic.html)

### 3. Database Design

**Objective:** Design the database schema to support the application's functionality.

- **Details:** Design the database schema to support CSV file uploads, transaction processing, and status tracking.
  - Reference: [Database Schema Diagram](https://dbdiagram.io/d/bulk-charge-66f05f79a0828f8aa6aa5592)

### 4. CSV File Handling

**Objective:** Implement functionality for uploading, processing, and downloading CSV files.

#### 4.1 CSV Upload
- **Details:** Users should be able to upload CSV files containing card information to create charges (transactions).

#### 4.2 CSV Download
- **Details:** Users should be able to download previously uploaded CSV files for reference.

### 5. Transaction Monitoring

**Objective:** Implement functionality to monitor and track transactions related to CSV file uploads.

- **Details:** The application should allow users to view previous transaction attempts for each CSV row, including the API responses returned for each (both token and charge endpoints).

### 6. Background Processing

**Objective:** Process CSV files in the background to improve performance and user experience.

- **Details:** Use Sidekiq to process CSV files in the background, ensuring that large files do not block the main thread.

### 7. CSV Status Tracking

**Objective:** Track the processing status of each CSV file.

- **Details:** Track the status of each CSV file, with possible statuses including:
  - `pending`
  - `in_process`
  - `finished`
  - `finished_with_error`

### 8. Endpoint Configuration

**Objective:** Allow configuration of API endpoints via environment variables.

- **Details:** Use environment variables (`ENV`) to configure endpoints for making requests to external services (e.g., vault and core services).

### 9. Testing

**Objective:** Write comprehensive unit tests to ensure code quality and reliability.

- **Details:** Write unit tests for all models, controllers, background jobs, and service classes.

### 10. GitHub Integration

**Objective:** Ensure the project is ready for collaboration and review.

- **Details:** Push the project to GitHub and split the work into multiple stories or PRs. This breakdown will make it easier for reviewers to review and understand the changes.

## APIs Used

- **About APIs Guide:** [Step-by-Step Guide](https://docs.opn.ooo/step-by-step-guide)
- **Token API:** [Documentation](https://docs.opn.ooo/tokens-api)
- **Charge API:** [Documentation](https://docs.opn.ooo/charges-api)