# library-subscription-department
Application for library subscription department. User can add readers, issue and return books from library. Also can watch lists with books and readers.

This application is designed to manage the library's subscription department. In it, you can add and edit information about library readers. And also issue and return books. View the library's automatic report. And through the admin panel, you can add and edit information about books, authors, and more.
After launching the application, the user can see the main menu, where you can select the desired tab "Books", "Readers", "Issuance of books", "Report". This page is informational. The table headings are links to the corresponding pages. The table also provides a description of each of the pages.

![image](https://user-images.githubusercontent.com/90632114/235372909-f4ca4017-413f-40a7-b08d-dc18e2f53d53.png)
Main page


On the "Search for books" page, you can see a list of books in the form of a table. Also find the book you need, for example, by book title or author. It is also possible to sort the available books by various criteria. This sort can also be done both in ascending and descending order.

![image](https://user-images.githubusercontent.com/90632114/235372932-328fd887-5a90-4ac9-912f-3631e957cc63.png)
Page "Search for books"


The "Reader tickets" page displays data about readers in the form of tables. A form to search for readers, a form to sort by various fields and buttons to add, change or remove readers are provided.
If the reader is under 17 years old, it will not be possible to add him to the database. A corresponding error will appear and the reader will not be added to the database. Also, if the following fields are not filled in: name, address, work phone number and date of birth, it will not be possible to create a new reader's ticket.
Changing information is the same as adding. But it is impossible to change the date of birth there. But all other data is possible. This is provided in the event that the librarian accidentally entered the wrong information or filled it in incorrectly.

![image](https://user-images.githubusercontent.com/90632114/235372961-155aed03-e698-4263-bc1f-e68c33d87690.png)
Page "Reader tickets"


From the "Issuance and return of books" information page, you can go to pages with book issuance, book return, a page with information about debtors, and a list of issued books.

![image](https://user-images.githubusercontent.com/90632114/235372981-7f7e6aa5-111f-4acb-876c-fb6893bd8ad7.png)
Page "Issuance and return of books"


The pages with issuing and returning the book look almost the same. But on the page with the return, there are no fields with the date of issue and the date of the expected return. But there is a return date field that is automatically filled with today's date. Also, in the fields with the reader's name and the title of the book, there is a field where you can perform a search. This is implemented so that you can quickly find the right reader and book in a large database.

![image](https://user-images.githubusercontent.com/90632114/235373023-90778673-8ef8-49a0-b1c7-289dc240d0d0.png)
Page "Issue"

![image](https://user-images.githubusercontent.com/90632114/235373032-df616a7f-9c56-46e7-9240-7d4ac548f3b4.png)
Page "Return"


On the page "List of debtors" you can view information about all debtors of the library in the form of a table. This table presents such information as the reader's ticket number, the reader's name, the book the reader took, the ISBN of the book, the date of issue and the expected return date of the book. After returning the book, the reader is removed from this table.

![image](https://user-images.githubusercontent.com/90632114/235373054-8fe83404-88f1-4dcb-ba57-d02c0c16867e.png)
Page "List of debtors"


In the "Report" section, you can view information about the number of books, readers, published books, debts, authors, publishers, and the total number of books in the library.

![image](https://user-images.githubusercontent.com/90632114/235373069-c7127999-9e74-454e-b1fd-7ca58702836e.png)
Page "Report"

For ease of switching between pages, you can use the tabs at the top of the screen.


