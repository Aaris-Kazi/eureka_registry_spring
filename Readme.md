## Eureka Project is to monitor and map the ip to registry


## Commands to run
    mvn spring-boot:run


## Docker Commands to build
    docker build -t aariskazi/eureak-server:v1.0.0 .

    docker run -d -p 8761:8761 —name eureka-server aariskazi/eureak-server:v1.0.0