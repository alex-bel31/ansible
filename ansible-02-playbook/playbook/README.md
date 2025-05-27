# Ansible Playbook: ClickHouse и Vector

## 📋 Описание

Данный Ansible-плейбук предназначен для автоматической установки и настройки:

- [ClickHouse](https://clickhouse.com) — колоночная СУБД;
- [Vector](https://vector.dev) — лог-сборщик, конвейер данных наблюдаемости.

Плейбук разворачивает сервисы на хостах с группой `clickhouse` и выполняет следующие действия:

- Загружает и устанавливает необходимые `.deb`-пакеты ClickHouse.
- Запускает ClickHouse-сервер и создает базу данных `logs`.
- Скачивает и устанавливает Vector, распаковывая архив вручную.
- Создает конфигурационный файл Vector на основе шаблона Jinja2.
- Запускает и активирует systemd-сервисы для обоих компонентов.

---

## ⚙️ Параметры

Плейбук использует следующие переменные:

| Переменная              | Описание                                         | Пример                                   |
|------------------------|--------------------------------------------------|------------------------------------------|
| `clickhouse_version`   | Версия ClickHouse для установки                  | `22.7.7.24`                               |
| `clickhouse_packages`  | Список .deb-пакетов ClickHouse                   | `["clickhouse-common-static", "clickhouse-client", "clickhouse-server"]` |
| `vector_url`           | URL для скачивания дистрибутива Vector           | `https://packages.timber.io/vector/0.30.0/vector-x86_64-unknown-linux-gnu.tar.gz` |
| `vector_install_dir`   | Путь установки Vector                            | `/opt/vector`                             |
| `vector_config_path`   | Путь к файлу конфигурации Vector                 | `/etc/vector/vector.toml`                 |

Эти переменные можно определить в `group_vars`, `host_vars` или передавать через `-e`.