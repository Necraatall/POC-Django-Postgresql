FROM python:3.9
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /project
COPY Pipfile Pipfile.lock /project/
RUN pip install pipenv && pipenv install --system
COPY . /project/
RUN docker-compose exec web python3 ./project/manage.py migrate