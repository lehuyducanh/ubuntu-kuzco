#!/bin/bash

# Tạo user mới
username="lhda"
password="lhda"

# Kiểm tra nếu user đã tồn tại
if id "$username" &>/dev/null; then
    echo "User $username đã tồn tại."
else
    # Tạo user mới
    useradd -m -s /bin/bash "$username"

    # Đặt mật khẩu cho user
    echo "$username:$password" | chpasswd

    # Thêm user vào nhóm sudo (tùy chọn)
    usermod -aG sudo "$username"

    echo "User $username đã được tạo với mật khẩu $password."
fi
