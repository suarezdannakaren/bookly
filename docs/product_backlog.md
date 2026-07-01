## Product Backlog - Bookly📚

## User stories

**User Login**

As a reader, I want to log in with my email address and password so that I can access my account, view my books, and save my favorite books from any device.


*User Login – Acceptance Criteria*


Given the user is on the login page
When the user enters valid credentials and submits the form
Then the system grants access to the application

Given the user is on the login page
When the user submits the login form without entering credentials
Then the system displays an error message requesting required fields

Given the user is on the login page
When the user enters an incorrect password
Then the system denies access and shows an authentication error message

Given the user is logged into the application
When the user clicks on the logout button
Then the system terminates the session and redirects the user to the login page

Given the user has an active session
When the session remains inactive for a period of time
Then the system automatically logs the user out for security reasons

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

⸻

**Manage Favorite Books**

As a user of the personal library application,
I want to add and remove books from my favorites list,
So that I can quickly access my preferred books.

*Acceptance Criteria*

Given the user is viewing a registered book
When the user marks the book as a favorite
Then the system adds the book to the favorites list

Given the user has one or more favorite books
When the user opens the favorites list
Then the system displays all favorite books

Given the user has a favorite book
When the user removes the book from the favorites list
Then the system removes the book from the favorites list

⸻


**Manage Reading Status**

As a user of the personal library application,
I want to mark books as read or unread,
So that I can keep track of my reading progress.

*Acceptance Criteria*

Given the user is viewing a registered book
When the user marks the book as read
Then the system updates the book status to read

Given the user has books marked as read
When the user views the book list
Then the system displays the reading status for each book

Given the user has a book marked as read
When the user marks the book as unread
Then the system updates the book status to unread
