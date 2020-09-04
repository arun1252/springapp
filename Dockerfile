FROM openliberty/open-liberty:springBoot2-ubi-min as staging
USER root
COPY spring-boot-data-jpa/target/spring-boot-data-jpa-0.0.1-SNAPSHOT.jar /staging/fatjpa.jar

RUN springBootUtility thin \
 --sourceAppPath=/staging/fatjpa.jar \
 --targetThinAppPath=/staging/thinjpa.jar \
 --targetLibCachePath=/staging/lib.index.cache

FROM openliberty/open-liberty:springBoot2-ubi-min
USER root
COPY --from=staging /staging/lib.index.cache /opt/ol/wlp/usr/shared/resources/lib.index.cache
COPY --from=staging /staging/thinjpa.jar /config/dropins/spring/thinjpa.jar

RUN chown -R 1001.0 /config && chmod -R g+rw /config
RUN chown -R 1001.0 /opt/ol/wlp/usr/shared/resources/lib.index.cache && chmod -R g+rw /opt/ol/wlp/usr/shared/resources/lib.index.cache

USER 1001