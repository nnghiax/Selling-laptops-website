<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <title>Update Account</title>
    <style>
        body {
            background: #f9f9fb;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            color: #333;
        }
        .form-update {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-update .form-group label {
            font-weight: bold;
            color: #555;
        }
        .form-update .btn {
            background: #007bff;
            color: #fff;
            border-radius: 5px;
            padding: 10px 15px;
            font-size: 16px;
        }
        .form-update .btn:hover {
            background: #0056b3;
        }
        .user-image {
            text-align: center;
            margin-bottom: 20px;
        }
        .user-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <jsp:include page="Admin.jsp"></jsp:include>
    <div class="container">
        <div class="profile-header" style="color: wheat">Profile</div>
        <div class="form-update">
            <div class="user-image">
                <img src="${user.user_image}" alt="User Image">
            </div>
            <form action="updateAccount" method="POST">
                <input type="hidden" name="id" value="${user.user_id}">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${user.user_name}" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="${user.user_phone}" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${user.user_email}" required>
                        </div>
                        <div class="form-group">
                            <label for="role">Role</label>
                            <input type="text" class="form-control" id="role" name="role" value="${user.role_id}" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="image">Profile Image</label>
                            <input type="file" class="form-control-file" id="image" name="image">
                        </div>
                        <div class="form-group">
                            <label for="image_url">Or Image URL</label>
                            <input type="text" class="form-control" id="image_URL" name="image_URL" value="${user.user_image}">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn">Update</button>
            </form>
        </div>
    </div>
</body>
</html>
