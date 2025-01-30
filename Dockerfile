FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

ENV VITE_API_URL=http://lex.aoseudispor.com.br:5000/api
ENV VITE_SITE_URL=http://lex.aoseudispor.com.br:3001
ENV VITE_SITE_CLIENTE_URL=http://lex.aoseudispor.com.br:3001/p
ENV VITE_SITE_CONSULTANT_URL=http://lex.aoseudispor.com.br:3001/c

RUN npm run build

EXPOSE 3001

CMD ["npm", "run", "preview", "--", "--port", "3001", "--host", "0.0.0.0"] 