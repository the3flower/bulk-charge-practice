# README

Bulk Create Charge Excercise

Story Break Down

1. Setup a new Rails application
Description:
- Use latest version Rails and Ruby to setup.
- Setup sidekiq for background job processing.
- Include minitest framework for writing test.
- Include fabricator for defining Test data.
- Include faraday for external HTTP request.
- Readme file for setup guide.

2. Authentication (NO USER LOGIN NEEDED FOR THIS ASSIGNMENT).
Description:
3. Input CSV
4. Download previous CSV
5. can see previous transaction for each CSV row, API response for each of them(token, charge endpoints) 
6. Processing CSV should be using background job(Faraday)
7. Should be able to see CSV status(pending, in_process, finished, finished_with_error)
8. can config the endpoint for making request (vault and core) using 'ENV' variable
9. Write unit test for all models/controllers/background jobs/service classes.
10. Push the project to github, split project to mutiple stories/PRs 
11. 