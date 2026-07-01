## Product Backlog - Bookly📚

## User stories

**User Login**

As a reader, I want to log in with my email address and password so that I can access my account, view my books, and save my favorite books from any device.


*User Login – Acceptance Criteria*


Given the user is on the login page
When the user enters valid credentials
And selects the login option
Then the system validates that the entered credentials are correct
And grants access to the application
And keeps the session active while the user is using the application

Given the user is on the login page
When the user attempts to log in with one or more required fields empty
Then the system does not allow access
And displays a message indicating that all required fields must be completed

Given the user is on the login page
When the user enters invalid credentials
Then the system validates the entered credentials
And denies access
And displays a message indicating that the credentials are incorrect

Given the user is logged in
When the user selects the logout option
Then the system ends the session
And redirects the user to the login page
⸻

**User Registration**

As a new reader, I want to create an account by providing my personal information (name, email, and password) so that I can access the platform and save the books I have read and my favorite books.


*Acceptance Criteria*


Given the user is on the registration page
When the user enters their name, email address, and password
Then the system verifies that the email address has not been previously registered
And validates that the password meets the minimum security requirements
And creates the user account successfully

Given the user enters an email address that has already been registered
When the user submits the registration form
Then the system does not create the account
And displays a message indicating that the email address is already in use

Given the user enters a password that does not meet the minimum security requirements
When the user submits the registration form
Then the system does not create the account
And displays a message indicating that the password does not meet the security requirements
⸻

**CRUD (Book Management)**

As a reader, I want to manage my lists of read books and favorite books so that I can keep my information organized and up to date.


*Acceptance Criteria*


Given the user is on the book management page
When the user enters the required book information
And selects the option to add the book
Then the system adds the book to the list successfully

Given the user has one or more books registered
When the user accesses the book list
Then the system displays the list of registered books

Given the user has one or more books registered
When the user selects a book and chooses the delete option
Then the system removes the book from the list successfully
