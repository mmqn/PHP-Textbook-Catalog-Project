<?php
    // loads database object
    require_once('database.php');

    // query book info
    $query_book_info =
        "SELECT *
        FROM book
        INNER JOIN coursebook ON book.isbn13 = coursebook.book
        INNER JOIN course ON coursebook.course = course.courseID
        INNER JOIN publisher ON book.publisher = publisher.publisherID
        INNER JOIN authorbook ON book.isbn13 = authorbook.book
        INNER JOIN author ON authorbook.author = author.authorID
        WHERE isbn13 = :selected_book
        LIMIT 1";
    /*
    SELECT book, GROUP_CONCAT(author)
    FROM authorbook
    GROUP BY book
     */
    $stmt_book_info = $db->prepare($query_book_info);

    $selected_book = filter_input(INPUT_GET, 'book');
    $stmt_book_info->bindValue(':selected_book', $selected_book);

    $stmt_book_info->execute();
    $book_info_arr = $stmt_book_info->fetchAll();
    $stmt_book_info->closeCursor();
?>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Book Details</title>

        <!-- page styling -->
        <style>
            *{
                font-family: Verdana;
            }

            a:hover {
                font-weight: bold;
            }

            a:visited {
                color: #000000;
            }

            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }

            table {
                font-size: 12pt;
            }

            th {
                color: #000000;
                background-color: #ff9d14;
                padding: 4px;
            }

            td {
                padding: 6px;
            }

            p {
                font-size: 18pt;
            }
        </style>
    </head>

    <body>
        <br />
        <h1 align="center" style="color: #ff9d14">CIS Department Book Catalog</h1>
        <h4 align="center" style="color: #ff9d14"><i>Project by: Michael Nguyen</i></h4>
        <br />

        <?php foreach ($book_info_arr as $book) : ?>

        <table style="width:50%" align="center" table="table1">
            <th colspan="2">
                <?php echo $book['bookTitle'] ?>
            </th>

            <tr>
                <td style="width:40%">
                    <?php
                        $image = "$book[isbn13].jpg"; // append ".jpg" to isbn13 names
                        echo "<img src='images/".$image."'>"; // uses html <img> tag
                    ?>
                </td>

                <td>
                    Course: <?php echo "$book[course] ($book[credit])" ?><br />
                    Book Title: <?php echo $book['bookTitle'] ?><br />
                    Edition: <?php echo $book['edition']." edition ($book[publishDate])" ?><br />
                    Price: <?php echo $book['price'] ?><br />
                    Author: <?php echo "$book[firstName] $book[lastName]" ?><br />
                    Publisher: <?php echo $book['publisher'] ?><br />
                    Length: <?php echo "$book[length] pages" ?><br />
                    ISBN-13: <?php echo $book['isbn13'] ?>
                </td>
            </tr>


        </table>
        <br />
        
        <table style="width:50%" align="center" table="table2">
            <tr><td>
                <strong>Book Description:</strong>
                <br /><?php echo $book['description'] ?>
            </td></tr>
        </table>

        <?php endforeach; ?>
    </body>
</html>
