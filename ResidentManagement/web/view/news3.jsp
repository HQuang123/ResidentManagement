<%-- 
    Document   : accountList
    Created on : Mar 5, 2025, 9:28:11 PM
    Author     : AN515-57
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>News page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="css/main.css"/>
        <link rel="icon" href="images/star.png" type="image/x-icon"/>
        <style>
            body {
                font-family: 'Nunito', Arial;
                font-size: 18px;
                line-height: 1.3333;
                color: #1E2F41;
                height: 100%;
            }

            .hero {
                height: 100vh;
                background: linear-gradient(rgba(144, 7, 13), rgba(0, 0, 0, 0.5)), url('images/trong-dong.jpg');
                background-size: cover;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
            }
            .form-container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 700px;
                text-align: left;
                font-size: 1.5rem;
            }
            table {
                width: 100%;
            }
            td {
                padding: 8px 0;
            }
            select, input {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .hidden {
                display: none;
            }
            .dan {
                max-width: 800px;
                margin: auto;
                font-family: Arial, sans-serif;
                line-height: 1.6;
                color: #333;
            }

            .news-title {
                font-size: 24px;
                font-weight: bold;
                color: #164b7d;
                margin-bottom: 5px;
            }

            .news-date {
                font-size: 14px;
                color: gray;
                margin-bottom: 15px;
            }
            .news-highlight {
                background-color: #d4f8c4;
                padding: 10px;
                border-left: 4px solid #4CAF50;
                font-weight: bold;
            }
            body {
                font-family: 'Nunito', Arial;
                font-size: 18px;
                line-height: 1.3333;
                color: #1E2F41;
                height: 100%;
            }
            .hero {
                height: 100vh;
                background: linear-gradient(rgba(144, 7, 13), rgba(0, 0, 0, 0.5)), url('images/trong-dong.jpg');
                background-size: cover;
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
            }
            .hero{
                height: 100vh;
                background: linear-gradient(rgba(144, 7, 13), rgba(0, 0, 0, 0.5)), url('https://free.vector6.com/wp-content/uploads/2021/03/E269-vector-trong-dong.jpg');
                background-size: cover;
                color: yellow;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
            }
            .buttons{
                width: 40%;
            }
            .btn:hover {
                background-color: #CE7A58;
                color: #fff;
            }
            .btn{
                margin: 0px 3px;
                border-color: #CE7A58;
                color: #1E2F41;
                border-radius: 3px;
                width: 130px;
                min-width: 0px;
                font-size: 18px;
                height: auto;
                font-weight: 500;
            }
            .btn-fourth:hover {
                background: #ffb01e;
            }
            .btn-fourth {
                background: #FFC251;
                color: #000;
                font-weight: 500;
                width: 100%;
                min-height: 100px;
            }
            
            .actions{
                margin:-200px;
                max-width: 800px;
            }
            @media (max-width: 768px) {
                .hero h1 {
                    font-size: 2rem;
                    height: 300px;
                }
                .navbar-brand{
                    width: 100%;
                }
                .navbar-brand img {
                    width: 150px; /* Reduce logo size on mobile */
                }
                .navbar-nav {
                    text-align: center; /* Center navigation items */
                }
                .navbar-nav .nav-item {
                    margin-bottom: 10px; /* Space out items */
                }
                .hero {
                    height: auto; /* Adjust height */
                    padding: 50px 20px;
                }
            }

        </style>
    </head>

    <body>
        <c:if test="${sessionScope.account ne null}">
            <jsp:include page="header.jsp"/>
        </c:if>
        <c:if test="${sessionScope.account eq null}">
            <nav class="navbar navbar-expand-lg custom-navbar"> 
                <!--            used for responsive when using smaller screen-->
                <div class="container">
                    <a class="navbar-brand col-lg-5" href="home.html">
                        <img src="images/logo/logo.png" width="100%"  alt="logo"/>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse px-5" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item"><a href="login" class="btn btn-login">Đăng nhập</a></li>
                            <li class="nav-item"><a href="RegisterAccount" class="btn btn-login">Đăng ký</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
            
        </c:if>
        <div class="dan">
            <h2 class="news-title">Cung cấp dịch vụ công "Giải quyết hưởng trợ cấp thất nghiệp" trên Cổng Dịch vụ công quốc gia</h2>
            <p class="news-date">22/04/2022</p>
            <p>
                Triển khai nội dung Nghị quyết số 107/NQ-CP ngày 11 tháng 9 năm 2021 của Chính phủ và Quyết định số 06/QĐ-TTg ngày 06 tháng 01 năm 2022 của Thủ tướng Chính phủ, Văn phòng Chính phủ đã phối hợp với Bộ Lao động - Thương binh và Xã hội, Bảo hiểm xã hội Việt Nam hoàn thiện quy trình nghiệp vụ, cung cấp trên Cổng Dịch vụ công quốc gia dịch vụ công Giải quyết hưởng trợ cấp thất nghiệp từ ngày 12 tháng 4 năm 2022 tại địa chỉ:
            </p>
            <p>
                https://dichvucong.gov.vn/p/home/dvc-chi-tiet-thu-tuc-nganh-doc.html?ma_thu_tuc=1.001978
            </p>
            <p>
                Theo quy định tại Nghị quyết 107/NQ-CP của Chính phủ, người lao động có thể nộp bản chụp một trong các giấy tờ theo quy định tại Khoản 6 Điều 1 Nghị định số 61/2015/NĐ-CP sửa đổi, bổ sung một số điều của Nghị định số 28/2015/NĐ-CP của Chính phủ.
            </p>
            <p>
                Mọi khó khăn, vướng mắc trong quá trình thực hiện dịch vụ công đề nghị liên hệ với Tổng đài hỗ trợ: 18001096
            </p>
        </div>

        
        <jsp:include page="footer.jsp"/>
    </body>
</html>