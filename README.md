# gRPC-Web Nginx Reverse Proxy

## Описание проекта

Содержит готовую конфигурацию **Reverse proxy** для
проксирования gRPC-Web запросов к gRPC бэкенду.

### Цель

Обойти CORS ограничения при работе с gRPC-Web.

### Возможности

- **HTTP/2 поддержка** - поддержка HTTP/2 протокола
- **gRPC-Web совместимость** - обработка gRPC-Web запросов и ответов
- **CORS** - автоматическая обработка CORS preflight запросов
- **Trailing headers** - сохранение trailing headers в HTTP/2
- **Переменные окружения**

## Структура проекта

```
nginx-proxy/
├── docker-compose.yml      # Docker Compose конфигурация
├── nginx.conf.template     # Nginx конфиг с переменными окружения
├── .env.template           # Шаблон для .env
└── README.md
```

## Запуск

Необходимо создать .env файл.

```bash
# В папке проекта

# Поднять контейнер с логами
docker-compose up nginx
```

## Настройка

### Переменные окружения (`.env`)

| Переменная          | Описание                                  | Примеры                                   |
|---------------------|-------------------------------------------|-------------------------------------------|
| `NGINX_PORT`        | Порт на хосте                             | `8090`, `443`, `80`                       |
| `NGINX_LISTEN_PORT` | Порт слушания (обычно равен `NGINX_PORT`) | `8090`, `443`, `80`                       |
| `GRPC_BACKEND`      | Адрес:порт gRPC сервера                   | `localhost:8080`, `api.example.com:50051` |

## Команды

```bash
# Поднять (с логами)
docker-compose up nginx

# Поднять в фоне
docker-compose up -d nginx

# Посмотреть логи
docker-compose logs -f nginx

# Остановить
docker-compose stop nginx

# Перезагрузить (перечитает конфиг)
docker-compose restart nginx

# Остановить и удалить контейнер
docker-compose down

# Пересоздать контейнер с новыми переменными
docker-compose down && docker-compose up -d nginx
```
