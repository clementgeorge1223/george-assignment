FROM java:8
VOLUME /tmp
ADD target/spring-petclinic-2.5.0-SNAPSHOT.jar app.jar
EXPOSE 8082
ENTRYPOINT ["java","PetClinicApplication","-jar","app.jar"]