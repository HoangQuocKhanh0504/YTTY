# Sử dụng image Node.js chính thức
FROM node:16

# Cài đặt yt-dlp (công cụ tải video)
RUN apt-get update && apt-get install -y curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp


# Tạo thư mục làm việc
WORKDIR /app

# Copy mã nguồn vào container
COPY . /app

# Cài đặt các dependencies của ứng dụng
RUN npm install

# Cổng mà ứng dụng sẽ lắng nghe
EXPOSE 3000

# Chạy ứng dụng khi container được khởi động
CMD ["node", "index.js"]
