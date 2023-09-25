FROM nginx

COPY ./app/ /usr/share/nginx/html/

EXPOSE 80

WORKDIR /usr/share/nginx/html/

ENTRYPOINT ["/usr/sbin/nginx"]
CMD ["-g", "daemon off;"]