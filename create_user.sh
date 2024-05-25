#!/bin/bash

# Tạo người dùng mới
username="lhda"
password="lhda"

# Kiểm tra xem người dùng đã tồn tại hay chưa
if id "$username" &>/dev/null; then
    echo "Người dùng $username đã tồn tại!"
else
    # Tạo người dùng mới
    adduser --disabled-password --gecos "" $username
    
    # Đặt mật khẩu cho người dùng
    echo "$username:$password" | chpasswd

    # Thêm người dùng vào nhóm sudo
    usermod -aG sudo $username

    echo "Đã tạo người dùng mới $username với mật khẩu $password."
fi

# Đặt người dùng mới làm tài khoản mặc định
echo "[user]\ndefault=$username" | tee -a /etc/wsl.conf

echo "Hoàn thành. Hãy khởi động lại WSL."
