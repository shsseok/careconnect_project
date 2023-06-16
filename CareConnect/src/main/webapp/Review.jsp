<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>리뷰 작성 페이지 입니다.</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        

        .container {
            max-width: 1200px; /* Increase form width */
            margin: 0 auto;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        form div {
            margin-bottom: 10px;
        }

        form div label {
            display: block;
            margin-bottom: 5px;
        }

        form div input, form div textarea {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        form div button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: #ffffff;
            cursor: pointer;
        }

        form div button:hover {
            background-color: #0056b3;
        }
        
        /* CSS for star rating */
        .star-rating {
            display: inline-block;
        }

        .star-rating input {
            display: none;
        }

        .star-rating label {
            color: lightgray;
            float: right;
            font-size: 30px;
        }

        .star-rating input:checked ~ label {
            color: gold;
        }

        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: gold;
        }
    </style>
</head>
<body>
<%@include file = "header.jsp" %>
    <div class="container">
        <h1>리뷰를 작성하세요</h1><br>
        <div></div>
        <form action="submit_review.jsp" method="POST">
            <div>
                <label for="username">작성자</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div>
                <label for="review">이용후기</label>
                <textarea id="review" name="review" rows="5" required></textarea>
            </div>
            <div class="star-rating">
                <label for="star5">☆</label>
                <input id="star5" name="rating" type="radio" value="5">
                <label for="star4">☆</label>
                <input id="star4" name="rating" type="radio" value="4">
                <label for="star3">☆</label>
                <input id="star3" name="rating" type="radio" value="3">
                <label for="star2">☆</label>
                <input id="star2" name="rating" type="radio" value="2">
                <label for="star1">☆</label>
                <input id="star1" name="rating" type="radio" value="1">
            </div>
            <div>
                <button  onClick="location.href='main.jsp'">제출</button>
            </div>
        </form>
    </div>


</body>
</html>
