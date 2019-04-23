<?php
    // loads database object
    require_once('database.php');
    
    // sorts by CourseID or Price
    $order_by = filter_input(INPUT_GET, 'orderby', FILTER_VALIDATE_INT); // retrieves orderby value as int from html
    $course_sort = 0; // 0 indicates course sort
    $price_sort = 1; // 1 indicates price sort
    if ($order_by == 0) {
        $sort_type = "Course.CourseID";
    }
    if ($order_by == 1) {
        $sort_type = "Book.Price";
    }

    
    // main query
    $query_main =
        "SELECT *
        FROM course
        INNER JOIN coursebook ON course.courseID = coursebook.course
        INNER JOIN book ON coursebook.book = book.isbn13
        ORDER BY $sort_type
        LIMIT :page_start_position, :page_limit";
    $stmt_main = $db->prepare($query_main);
    
    // pagination
    $stmt_count = $db->query("SELECT COUNT(Course) FROM CourseBook");
    $fetch_count = $stmt_count->fetch();
    $rows_count = $fetch_count[0]; // row_count contains int of how many entries are in array
    $page_limit = 6; // change this to change entries displayed per page
    $page = filter_input(INPUT_GET, 'page', FILTER_VALIDATE_INT); // retrieves page value as int from html
    $page_start_position = ($page * $page_limit); // calculates starting entry for each page
    $stmt_main->bindValue(':page_limit', $page_limit, PDO::PARAM_INT);
    $stmt_main->bindValue(':page_start_position', $page_start_position, PDO::PARAM_INT);
    
    // execute and fetch all rows
    $stmt_main->execute();
    $book_catalog_arr= $stmt_main->fetchAll();
    $stmt_main->closeCursor();
    
//    // book info query
//    $query_book_info = "SELECT * FROM Book WHERE Isbn13 = :selected_book";
//    $stmt_book_info = $db->prepare($query_book_info);
//    $selected_book = filter_input(INPUT_GET, 'poop', FILTER_VALIDATE_INT);
//    $stmt_book_info->bindValue(':selected_book', $selected_book, PDO::PARAM_INT);
//    $stmt_book_info->execute();
//    $book_info_arr = $stmt_book_info->fetch();
//    $stmt_book_info->closeCursor();
?>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Book Catalog</title>

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
        <!-- displays result set stats -->
        <?php
            echo "Total Entries: $rows_count | 
            Displayed Per Page: ".count($book_catalog_arr);
        ?>
        <h1 align="center" style="color: #ff9d14">CIS Department Book Catalog</h1>
        <h4 align="center" style="color: #ff9d14"><i>Project by: Michael Nguyen</i></h4>
        <br />

        <table style="width:80%" align="center" table="table">
            <!-- table headers -->
            <tr>
                <th style="width:8%">
                    <a href="?page=0&orderby=<?php echo $course_sort; ?>"> <!-- returns to first page when new sort is set -->
                    Course #
                    </a>
                </th>
                <th>Course Title (Units)</th>
                <th>Book Image</th>
                <th>Book Title</th>
                <th>
                    <a href="?page=0&orderby=<?php echo $price_sort; ?>"> <!-- returns to first page when new sort is set -->
                    Price
                    </a>
                </th>
            </tr>

            <!-- table data -->
            <?php foreach ($book_catalog_arr as $item) : ?>
            <tr>
                <!-- course number -->
                <td><a href="http://bit.ly/2EmXNIH">
                    <?php echo $item['courseID'] ?></a></td>

                <!-- course title -->
                <td><?php echo $item['courseTitle']." ($item[credit])" ?></td>

                <!-- book image -->
                <td align="center">
                    <a href="book_details.php?book=<?php echo $item['isbn13'] ?>"> <!-- passes isbn13 to book_details.php -->
                        <?php
                            $image = "$item[isbn13].jpg"; // append ".jpg" to isbn13 names
                            echo "<img src='images/".$image."'>"; // uses html <img> tag
                        ?>
                    </a>
                </td>

                <!-- book title -->
                <td><?php echo $item['bookTitle'] ?></td>

                <!-- price -->
                <td align="right"><?php echo "$$item[price]" ?></td>
            </tr>
            <?php endforeach; ?>
        </table>

        <br />
        <p align="center" style="color: #ff9d14">
            
            <!-- pagination continued -->
            Page:<br />
            <?php
                $counter_limit = ceil($rows_count/$page_limit); // divides total entries by entries per page and rounds up to whole number
                for ($counter = 0; $counter < $counter_limit; $counter++) {
                  $page_num_displayed = $counter +1; // displays starting page number on website as 1
                  echo "<a href='?page=".$counter."&orderby=".$order_by."'> ".$page_num_displayed." </a>";
                }
            ?>
        </p>
        <br />
    </body>
</html>
