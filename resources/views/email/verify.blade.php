<!DOCTYPE html>
<html>

<head>
    <title>Xác nhận email</title>
</head>

<body>
    <p>Xin chào,</p>
    <p>Vui lòng nhấp vào liên kết dưới đây để xác nhận email của bạn:</p>
    <a href="{{ url('/xac-nhan-email/' . $token) }}">Xác nhận email</a>
</body>

</html>