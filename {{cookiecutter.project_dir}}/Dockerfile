FROM python:3.11.9
ENV PYTHONUNBUFFERED=1

WORKDIR /code

ADD requirements-init.txt /code/

RUN pip install -r requirements-init.txt

ADD poetry.lock pyproject.toml /code/

RUN poetry config virtualenvs.create false && poetry install --only main

ENV PYTHONPATH=$PYTHONPATH:/code/{{cookiecutter.project_slug}}
ENV DJANGO_SETTINGS_MODULE=config.settings.base

ADD . /code

RUN python {{cookiecutter.project_slug}}/manage.py collectstatic

EXPOSE 8000

CMD uvicorn config.wsgi:application --app-dir ./{{cookiecutter.project_slug}} --host 0.0.0.0 --forwarded-allow-ips "*" --interface wsgi
