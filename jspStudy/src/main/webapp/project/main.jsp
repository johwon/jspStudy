<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹페이지</title>
    <link rel="stylesheet" href="./main.css">
    <script src="https://kit.fontawesome.com/7ab22df35b.js" crossorigin="anonymous"></script>
    <script src="script.js?timestamp=<%= System.currentTimeMillis() %>"></script>
</head>
<body>
    <header>
        <a href="main.jsp"><i class="fa-solid fa-cart-shopping"></i><h2>K-SHOP</h2></a>
        <ul>
            <li><a href="#">menu</a></li>
            <li><a href="#">menu</a></li>
            <li><a href="#">menu</a></li>
            <li class="dropdown">
                <a href="#">menu</a>
                <div class="dropdown_content">
                    <a href="#">1.menu</a>
                    <a href="#">2.menu</a>
                    <a href="#">3.menu</a>
                </div>
            </li>
        </ul>
        <div class="header_icon">
            <a href="loginPage.jsp" class="sign"><li>로그인</li></a>
            <a href="registerPage.jsp" class="sign"><li>회원가입</li></a>
            <!-- <a href="#"><i class="fa-solid fa-phone"></i></a>
            <a href="#"><i class="fa-regular fa-comments"></i></a> -->
        </div>
    </header>
    <div class="carousel">
    </div>
    <main>
        <aside class="left">
        </aside>
        <section>
        </section>
        <aside class="right">
        </aside>
    </main>
    <footer></footer>
</body>
</html>