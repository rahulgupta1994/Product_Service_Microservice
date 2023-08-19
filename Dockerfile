FROM openjdk:17

#RUN mkdir C:/Users/rahul/product-service
#ADD . C:/Users/rahul/product-service
WORKDIR C:/Users/rahul/product-service
#C:\\Users\\rahul\\product-service\\Dockerfile

#/var/lib/docker/tmp/
#COPY package.json ./
#COPY. .

EXPOSE 8087
ADD target/product-service-microservices.jar product-service-microservices.jar
ENTRYPOINT ["java","-jar","/product-service-microservices.jar"]