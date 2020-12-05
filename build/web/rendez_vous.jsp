<%-- 
    Document   : rendez_vous
    Created on : 4 janv. 2020, 18:36:51
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>rendez-vous</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    </head>
    <body>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" href="nots.jsp">les notes</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="rendez_vous.jsp">demande un rendez-vous</a>
                </li>

            </ul>
        </div>
        <div class="container">
            <h1>demande rendez-vous</h1> 
            <form action="email" method="post">
                <div class="form-group">
                    <label for="exampleFormControlInput1">Entre l'heur</label>
                    <input type="text" class="form-control" name="heur">
                </div>
                <div class="form-group">
                    <label for="exampleFormControlTextarea1">Description</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="Description"></textarea>
                </div>
                <input type="submit" class="form-control">
            </form>
        </div>

    </body>
</html>
