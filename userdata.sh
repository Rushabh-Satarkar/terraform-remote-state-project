#!/bin/bash

apt update -y
apt install nginx -y

systemctl enable nginx
systemctl start nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Rushabh | Portfolio</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      text-align: center;
      padding: 50px;
    }
    h1 { color: #333; }
    p  { font-size: 18px; color: #666; }
  </style>
</head>
<body>
  <h1>Hi, I'm Rushabh</h1>
  <p>Cloud · DevOps</p>
</body>
</html>
EOF
