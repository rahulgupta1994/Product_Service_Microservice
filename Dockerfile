FROM openjdk:17-jdk

#WORKDIR /usr/src/app
RUN mkdir C:/Users/rahul/product-service
ADD . C:/Users/rahul/product-service
WORKDIR C:/Users/rahul/product-service

/var/lib/docker/tmp/
#COPY package.json ./
#COPY. .

EXPOSE 8087
ADD target/product-service-microservices.jar product-service-microservices.jar
ENTRYPOINT ["java","-jar","/product-service-microservices.jar"]