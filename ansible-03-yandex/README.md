# Ansible Playbook for Lighthouse Stack Deployment

## Описание

Данный Ansible playbook автоматизирует развертывание и настройку компонентов стекa Lighthouse:

- Установка и настройка **NGINX** на группе хостов `lighthouse`.
- Клонирование репозитория Lighthouse и конфигурация сайта в NGINX.
- Установка и настройка **ClickHouse** на группе хостов `clickhouse`, включая создание базы данных и таблицы.
- Установка и настройка **Vector** на группе хостов `vector` для сбора и отправки логов.

## Параметры

- `git_url` — URL репозитория Lighthouse (используется в задаче клонирования).
- `lighthouse_path` — путь на хосте для размещения кода Lighthouse.
- `clickhouse_database` — имя базы данных ClickHouse, которая создаётся.
- `clickhouse_table` — имя таблицы для хранения логов.
- `vector_config_path` — путь к конфигурационному файлу Vector на целевой машине.

Переменные можно задавать в `group_vars`, `host_vars` или передавать через `--extra-vars`.

## Теги

- `install_nginx` — установка и настройка NGINX.
- `install_lighthouse` — установка Lighthouse (клонирование репозитория и настройка сайта).
- `install_clickhouse` — установка ClickHouse, создание БД и таблицы.
- `install_vector` — установка и настройка Vector.

## Инвентарь и инфраструктура

Виртуальные машины и Ansible инвентарь создаются отдельно с помощью Terraform. Реализацию можно посмотреть в [/terraform](https://github.com/alex-bel31/ansible/tree/main/ansible-03-yandex/terraform).



