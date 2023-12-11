<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .login-container {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
      width: 300px;
      text-align: center;
    }

    .login-container h2 {
      color: #333;
    }

    .login-form {
      display: flex;
      flex-direction: column;
      gap: 10px;
      margin-top: 20px;
    }

    .login-form label {
      font-weight: bold;
      margin-bottom: 5px;
      color: #555;
    }

    .login-form input {
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
    }

    .login-form input[type="submit"] {
      background-color: #4caf50;
      color: #fff;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .login-form input[type="submit"]:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>

  <div class="login-container">
    <h2>Login Form</h2>
    <form action="login" method="POST" class="login-form">
      <label for="username">Ten dang nhap:</label>
      <input type="text" name="username" id="username" required>
      <label for="password">Mat khau:</label>
      <input type="password" name="password" id="password" required>
      <input type="submit" value="Dang nhap">
    </form>
  </div>

</body>
</html>
