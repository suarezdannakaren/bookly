## Product Backlog - Bookly📚

## User stories

**User Login**

As a reader, I want to log in with my email address and password so that I can access my account, view my books, and save my favorite books from any device.


*Acceptance Criteria*


Given the user is on the login page When the user enters valid credentials and submits the form Then the system grants access to the application

Given the user is on the login page When the user submits the login form without entering credentials Then the system displays an error message requesting required fields

Given the user is on the login page When the user enters an incorrect password Then the system denies access and shows an authentication error message

Given the user is logged into the application When the user clicks on the logout button Then the system terminates the session and redirects the user to the login page

Given the user has an active session When the session remains inactive for a period of time Then the system automatically logs the user out for security reasons
⸻

**User Registration**

As a new reader, I want to create an account by providing my name, email, and password so that I can access the application and manage my personal library.

*Acceptance Criteria*

Feature: User Registration

Given the user is on the registration page When the user enters a valid name, email, and password Then the system creates the user account successfully

Given the user is on the registration page When the user enters an email that is already registered Then the system does not create the account and displays a message indicating that the email is already in use

Given the user is on the registration page When the user enters an invalid email format Then the system does not create the account and displays a message indicating that the email format is invalid

Given the user is on the registration page When the user enters a password that does not meet security requirements Then the system does not create the account and displays a message indicating that the password is not secure enough


⸻

**CRUD (Book Management)**

As a reader, I want to manage my lists of read books and favorite books so that I can keep my information organized and up to date.


*Acceptance Criteria*


Feature: Book Management

Given the user is on the book management page When the user enters the required book information and selects the option to add the book Then the system adds the book to the list successfully

Given the user has one or more books registered When the user accesses the book list Then the system displays the list of registered books

Given the user has one or more books registered When the user selects a book and chooses the delete option Then the system removes the book from the list successfully


⸻

**Manage Favorite Books**

As a user of the personal library application,
I want to add and remove books from my favorites list,
So that I can quickly access my preferred books.

*Acceptance Criteria*

Feature: Favorite Books

Given the user is viewing a registered book When the user marks the book as a favorite Then the system adds the book to the favorites list

Given the user has one or more favorite books When the user opens the favorites list Then the system displays all favorite books

Given the user has a favorite book When the user removes the book from the favorites list Then the system removes the book from the favorites list


⸻


**Manage Reading Status**

As a user of the personal library application,
I want to mark books as read or unread,
So that I can keep track of my reading progress.

*Acceptance Criteria*

Feature: Reading Status

Given the user is viewing a registered book When the user marks the book as read Then the system updates the book status to read

Given the user has books marked as read When the user views the book list Then the system displays the reading status for each book

Given the user has a book marked as read When the user marks the book as unread Then the system updates the book status to unread
