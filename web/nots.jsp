<%-- 
    Document   : notes
    Created on : 4 janv. 2020, 18:36:51
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="classes.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>notes</title>
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
            <%      
                //il faut mettre un session dans le servlet d'apres lauthentification de parent comme ...
                //session.setAttribute("id_user")=mettes la valeur de id_user pour récuperer dans ce page par methode getAttribute 
                    int uder_id=Integer.parseInt(session.getAttribute("id_user")+"");
                    Connection con = MyConnection.getMyConnection();
                    String sql = "select * from  etudiant ett inner join etudier etr on(ett.id_user= etr.id_user) inner join module m on(etr.id_module=m.id_module) where id_user=?";
                    PreparedStatement prst = con.prepareStatement(sql);
                    prst.setInt(1,uder_id);
                    ResultSet rst = prst.executeQuery();
                     out.println("<table class='table table-striped'>"
                             + "<tr><th>Module </th><th>la note</th> </tr>"); 
                    while (rst.next()) {%>
                    
                <% out.println("<tbody><tr><td>" + rst.getString(9) + "</td>"
                                + "<td>" + rst.getString(7) + "</td></tr>"
                                
                        );
                out.println("</table>"); 
                    }%>
        </div>
        
    </body>
</html>
