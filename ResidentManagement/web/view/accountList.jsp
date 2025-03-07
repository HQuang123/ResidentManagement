<%-- 
    Document   : accountList
    Created on : Mar 6, 2025, 9:19:39 PM
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
        <title>Home Page</title>
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
                color: white;
                display: flex;
                align-items: center;
                justify-content: center;
                text-align: center;
                flex-direction: column;
            }
            .navbar-nav .nav-link:hover {
                color: #ffcc00 !important;
                transform: scale(1.1);
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
            table {
                margin: auto;
                text-align: center;
            }
            td {
                padding: 10px;
            }

            a {
                font-size: 20px;
            }
            .page {
                text-align: center;
            }
            
            table {
                background-color: white;
                border-radius: 10px;
                color: black;
            }
            
            .page{
                background: white;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="hero">
            <h1>Danh sách:</h1>
            <c:if test="${list == null || list.isEmpty()}">
                <h2>Không có dân</h2>
            </c:if>
            <c:if test="${list != null && !list.isEmpty()}">
                <div>
                    <table border="1">
                        <thead>
                            <tr>
                                <th>Họ và tên</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Chức vụ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${list}">
                                <tr>
                                    <td><c:out value="${user.fullName}"></c:out></td>
                                    <td><c:out value="${user.address}"></c:out></td>
                                    <td><c:out value="${user.phoneNumber}"></c:out></td>
                                    <td><c:out value="${user.role}"></c:out></td>                        
                                        <td>
                                            <input type = "button" value="Chỉnh sửa" onclick="location.href = 'PoliceUpdateAccount?action=update&userid=<c:out value="${user.userId}"></c:out>'" />
                                        </td>
                                    </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            <div class = "page">
                <c:forEach var="pagenum" begin="${1}" end="${page}">                    
                    <a href="PoliceUpdateAccount?pagenum=${pagenum}">${pagenum}</a>                  
                </c:forEach>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
