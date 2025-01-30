FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --frozen-lockfile

COPY . .

ENV VITE_API_URL=http://lex.aoseudispor.com.br:5000/api
ENV VITE_SITE_URL=http://lex.aoseudispor.com.br:3001
ENV VITE_SITE_CLIENTE_URL=http://lex.aoseudispor.com.br:3001/p
ENV VITE_SITE_CONSULTANT_URL=http://lex.aoseudispor.com.br:3001/c

RUN npm run build

FROM nginx:alpine

# Remove arquivos default do Nginx e copia o build da aplicação
RUN rm -rf /usr/share/nginx/html/*
COPY --from=0 /app/dist /usr/share/nginx/html

# Copia a configuração do Nginx
# Copia a configuração do Nginx para o diretório correto
COPY ./nginx.conf /etc/nginx/conf.d/default.conf  

EXPOSE 3001

CMD ["nginx", "-g", "daemon off;"] 