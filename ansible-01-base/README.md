# Домашнее задание к занятию 1 «Введение в Ansible»

## Задание 1 

<center>
  <img src="img/ansible-t1.JPG">
</center>

## Задание 3

При выполнении столкнулся с ошибкой `No python interpreters found for host ubuntu`. 
Поэтому был собран образ на базе ubuntu:22.04 с установкой **python**. [Dockerfile](https://github.com/alex-bel31/ansible/tree/main/ansible-01-base/Dockerfile)

## Задание 4

<center>
  <img src="img/ansible-t4.JPG">
</center>

## Задание 6

<center>
  <img src="img/ansible-t6.JPG">
</center>

## Задание 7

<center>
  <img src="img/ansible-vault-t7.JPG">
</center>

## Задание 8

<center>
  <img src="img/ansible-vault-t8.JPG">
</center>

## Задание 9

```bash
ansible-doc -t connection -l
```
`ansible.builtin.local` - подходящий плагин для работы на control node.

## Задание 11

В `prod.yml` добавлена новая группа хостов **local**. `some_fact` для каждого из хостов определены из верных **group_vars**.

<center>
  <img src="img/ansible-t11.JPG">
</center>