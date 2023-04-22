<%@ page import="com.javaee.bitlab.db.models.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tasks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp"
          crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <style>
        .card {
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            max-width: 300px;
            margin: auto;
            text-align: center;
            font-family: arial;
        }

        .title {
            color: grey;
            font-size: 18px;
        }

        button {
            border: none;
            outline: 0;
            display: inline-block;
            padding: 8px;
            color: white;
            background-color: #000;
            text-align: center;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
        }

        a {
            text-decoration: none;
            font-size: 22px;
            color: black;
        }

        button:hover, a:hover {
            opacity: 0.7;
        }
    </style>
</head>
<body>
<div class="navbar">
    <div>
        <strong>BITLAB SHOP</strong>
    </div>
    <div>
        <a class="navbuttons" href="/">Top Sales</a>
        <a class="navbuttons" href="/">New Sales</a>
        <a class="navbuttons" href="/add_item">Add Item</a>
        <a class="navbuttons" href="/profile">profile</a>
    </div>
</div>
<%
    User user = (User) request.getAttribute("user");
    if (user != null) {
%>
<script>
    let r1 = "<%=user.getFullName()%>";
    const r2 = " <%=user.getEmail()%>";
    const rs = "<%=user.getId()%>";

    const user = {id: rs, fullName: r1, email: r2}
    localStorage.setItem("user", JSON.stringify(user))
</script>

<%}%>

<div class="container" style="margin-top: 60px">
    <div class="container">

        <h1 id="userName"></h1>
        <p class="title">junior Laravel backend developer at Leadbros QAZAQSTAN</p>
        <p id="userEmail"></p>
        <p>
            <button class="btn btn-danger btn-sm" onclick="logout()">logout</button>
        </p>
    </div>
</div>

<script>
    function logout() {
        localStorage.clear();
        const text = location.href
        location.href = text.replace("/profile", "/")
    }

    const activeUser = localStorage.getItem("user")
    if (activeUser) {
        const u = JSON.parse(activeUser)
        document.getElementById("userName").innerText = u.fullName
        userEmail.innerText = u.email
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
<%--jdbc:postgresql://localhost:5432/bitlab_java_ee_db1--%>