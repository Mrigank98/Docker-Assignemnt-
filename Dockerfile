FROM ubuntu:16.04
Label version = 1.0
Label author = "Mrigank Bhaskar"
COPY script.sh /
ENTRYPOINT ["/script.sh"]

