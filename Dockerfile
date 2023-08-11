FROM openjdk:17

#WORKDIR /usr/src/app
#/var/lib/docker/tmp/
#COPY package.json ./
#COPY. .

EXPOSE 8087
ADD target/product-service-microservices.jar product-service-microservices.jar
ENTRYPOINT ["java","-jar","/product-service-microservices.jar"]