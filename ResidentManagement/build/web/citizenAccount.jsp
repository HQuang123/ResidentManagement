<%-- 
    Document   : citizenAccount
    Created on : Feb 2, 2025, 8:40:09 AM
    Author     : huyng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Account</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="icon" href="images/star.png" type="image/x-icon"/>
        <style>
            body {
                font-family: 'Nunito', Arial;
                font-size: 18px;
                line-height: 1.3333;
                color: #1E2F41;
                height: 100%;
            }
            *{
                margin:0;
                padding:0;
                box-sizing: border-box;
            }
            body {
                background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/trong-dong.jpg');
                background-size: cover;
            }
            .account-card {
                max-width: 500px;
                margin: 50px auto;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                background: white;
            }

        </style>
    </head>
    <body>
        <div class="container hero">
            <div class="account-card p-4">
                <c:set var="account" value="${sessionScope.account}"/>
                <h2 class="text-center mb-4">Thông tin tài khoản</h2>
                <div class="mb-3 fs-4">
                    <label class="form-label"><strong>Họ và tên:</strong></label>
                    <p id="fullName">${account.fullName}</p>
                    <input type="text" id="editFullName" class="form-control" style="display: none;" />
                </div>
                <div class="mb-3 fs-4">
                    <label class="form-label"><strong>Email:</strong></label>
                    <p id="email">${account.email}</p>
                    <input type="text" id="editEmail" class="form-control" style="display: none;" />
                </div>
                <div class="mb-3 fs-4">
                    <label class="form-label"><strong>Số điện thoại:</strong></label>
                    <p id="phone">${account.phoneNumber}</p>
                    <input type="text" id="editPhone" class="form-control" style="display: none;" />
                </div>
                <div class="mb-3 fs-4">
                    <label class="form-label"><strong>Địa chỉ:</strong></label>
                    <p id="address">${account.address}</p>
                </div>
                <div class="text-center fs-4">
                    <button id="editBtn" class="btn btn-primary fs-4">Thay đổi thông tin</button>
                    <button id="saveBtn" class="btn btn-primary fs-4" style="display:none">Save</button>
                </div>
            </div>
        </div>
    </body>
    <script>
        const editBtn = document.getElementById("editBtn");
        const saveBtn = document.getElementById("saveBtn");
        const fullName = document.getElementById("fullName");
        const editFullName = document.getElementById("editFullName");
        const email = document.getElementById("email");
        const editEmail = document.getElementById("editEmail");
        const phone = document.getElementById("phone");
        const editPhone = document.getElementById("editPhone");

        editBtn.addEventListener('click', () => {
            editFullName.value = fullName.textContent;
            fullName.style.display = 'none';
            editFullName.style.display = 'block';

            editEmail.value = email.textContent;
            email.style.display = 'none';
            editEmail.style.display = 'block';

            editPhone.value = phone.textContent;
            phone.style.display = 'none';
            editPhone.style.display = 'block';

            editBtn.style.display = 'none';
            saveBtn.style.display = 'inline-block';
        });

        saveBtn.addEventListener('click', () => {
            const updatedData = {
                fullName: editFullName.value,
                email: editEmail.value,
                phone: editPhone.value
            };

            // AJAX call to update the information on the server
            fetch('updateAccount', {// 
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(updatedData)
            })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            // Update the UI with the new values
                            fullName.textContent = updatedData.fullName;
                            email.textContent = updatedData.email;
                            phone.textContent = updatedData.phone;

                            fullName.style.display = 'block';
                            editFullName.style.display = 'none';

                            email.style.display = 'block';
                            editEmail.style.display = 'none';

                            phone.style.display = 'block';
                            editPhone.style.display = 'none';

                            saveBtn.style.display = 'none';
                            editBtn.style.display = 'inline-block';

                            alert('Account information updated successfully!');
                            window.location.href = 'citizenMain.jsp';
                        } else {
                            alert('Failed to update information. Please try again.');
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('An error occurred. Please try again.');
                    });
        });
    </script>

</html>
