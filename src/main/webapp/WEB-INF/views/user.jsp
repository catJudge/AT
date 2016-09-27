<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="../../static/js/jquery-2.2.1.min.js"></script>

    <link rel="stylesheet" href="../../static/bootstrap-3.3.6-dist/css/bootstrap.css"/>
    <script type="text/javascript" src="../../static/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../../static/css/styles.css"/>
    <link rel="shortcut icon" href="../../static/images/favicon.ico" type="image/x-icon">
    <title>Users</title>

    <script type="text/javascript">

        function addRowToTable(tableId, book) {
            var table = document.getElementById(tableId);

//            var tbody = document.createElement("tbody");
//            table.appendChild(tbody);
            var tbody = table.lastElementChild;
            var tr = document.createElement('tr');
            tbody.appendChild(tr);

            var td1 = document.createElement('td');
            var td2 = document.createElement('td');
            var td3 = document.createElement('td');
            var td4 = document.createElement('td');

            tr.appendChild(td1);
            tr.appendChild(td2);
            tr.appendChild(td3);
            tr.appendChild(td4);

            td1.innerHTML = book.isn;
            td2.innerHTML = book.name;
            td3.innerHTML = book.author;
            td4.innerHTML = book.owner;

        }

        $(document).ready(function () {
            $.ajax("/book/", {
                method: "GET",
                dataType: "json",
                contentType: 'application/json; charset=utf-8'
            }).done(function (data) {
                $(data).each(function (i, book) {
                    addRowToTable("table_with_books", book)
                });
            });

        })

    </script>
</head>
<body style="background: #f8f8f8">
<div class="container">
    <div class="col-md-2"></div>
    <div class="col-md-8" style="font-size: 15px">
        <div class="panel panel-default" style=" margin-top: 60pt">
            <div class="panel-body">
                <div style=" text-align: center ;">
                    <a href="${pageContext.request.contextPath}/view/user"
                       style="color: #3897f0; text-decoration: none">
                        Users</a>
                    <a href="${pageContext.request.contextPath}/view/book"
                       style="color: #3897f0; text-decoration: none">
                        Books</a>
                </div>
            </div>
        </div>
        <div class="panel panel-default" style=" margin-top: 10pt">
            <table class="table table-condensed" id="table_with_users">
                <thead>
                <tr>
                    <th>login</th>
                    <th>Name</th>
                    <th>Author</th>
                    <th>Owner</th>
                </tr>
                </thead>
                <tbody id="tbody_with_books"></tbody>
            </table>
        </div>
        <div class="btn-group btn-group-justified">
            <button type="button" class="btn btn-default"
                    style="width: 50%">Add new user
            </button>
            <button type="button" class="btn btn-default"
                    style="width: 50%">Show more users
            </button>
        </div>
    </div>
    <div class="col-md-2"></div>
</div>

</body>
</html>
