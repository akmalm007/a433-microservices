FROM node:14-alpine as base
WORKDIR /src
COPY . . 

FROM base as production
ENV NODE_ENV=production
ENV PORT=3001
ENV AMQP_URL="amqp://localhost:5672"
RUN npm ci
COPY . . 
CMD ["npm", "run", "start"]
 
FROM base as dev
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh
 
ENV NODE_ENV=development
ENV PORT=3001
ENV AMQP_URL="amqp://localhost:5672"
RUN npm install
COPY . . 
CMD ["npm", "run", "start"]
