<%@ page import="java.util.ArrayList" %>
<%@ page import="com.javaee.bitlab.db.models.Item" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nurbek</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
          crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
</head>
<body>
<div class="navbar">
    <div>
        <strong>SHOP</strong>
    </div>
    <div id="navbar">
        <a class="navbuttons" href="/">Top Sales</a>
        <a class="navbuttons" href="/">New Sales</a>
    </div>
</div>
<div class="container" style="margin-top: 60px;display:flex;">
    <%ArrayList<Item> items = (ArrayList<Item>) request.getAttribute("items");%>
    <div class="content">
        <div class="main-items">
            <div class="items ml-2" style="display:flex;margin-left: 50px;">
                <% for (Item item : items) {%>
                <div class="card  mb-3 "
                     style="max-width: 18rem;box-shadow: 5px 5px 5px 5px lightgrey;margin-right: 25px;min-height: 150px;min-width: 150px">
                    <div class="card-header">
                        <h2><%=item.getName()%>
                        </h2>
                    </div>
                    <div class="card-body">
                        <center>
                            <h3 class="card-title"><%=item.getPrice()%>$</h3>
                            <div><%=item.getDescription()%>
                            </div>
                            <a href="/details?id=<%=item.getId()%>" class="btn sm w-50 btn-success"
                              >detail</a>
                        </center>
                    </div>
                </div>
                <%}%>
            </div>

        </div>
    </div>
</div>
<script>
    const activeUser = localStorage.getItem("user")
    const navbar = document.getElementById("navbar")
    if (activeUser) {
        let prf = Object.assign(document.createElement('a'), {
            href: "/profile",
            className: "navbuttons",
            innerText: "profile"
        })
        let addI = Object.assign(document.createElement('a'), {
            href: "/add_item",
            className: "navbuttons",
            innerText: "add Item"
        })
        navbar.appendChild(prf)
        navbar.appendChild(addI)
    } else {
        let login = Object.assign(document.createElement('a'), {
            href: "/login",
            className: "navbuttons",
            innerText: "login"
        });
        navbar.appendChild(login)
    }
</script>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
</body>
</html>