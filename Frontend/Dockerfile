FROM node:10.16
WORKDIR user/app/src
ADD package.json package.json
RUN npm install
COPY . .
RUN npm install -g @angular/cli
CMD ng serve --host 0.0.0.0 --disable-host-check
//CMD ng serve --port 8080 --host 0.0.0.0 --disableHostCheck true
