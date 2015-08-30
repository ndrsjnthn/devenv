server {
  listen 80;
  server_name devenv;

  root /vagrant/files/html;

  location / {
    try_files $uri $uri/ =404;
  }
}