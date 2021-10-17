# villa-helena
http://villa-helena.com.ua/

## Local development
- `cp .env.example .env`
- `docker-compose build`
- `docker-compose run --rm web bundle install`
- `docker-compose run --rm web rails db:migrate`
- `docker-compose run --rm web rails db:seed`
- `docker-compose up -d`