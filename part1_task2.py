""" Часть 1: Строки, Списки, Словари
Упражнение 2: Методы строк и форматинг """

email = " USER@DOMAIN.COM "

""" Очистка и форматирование до вида: "user@domain.com" """
print(f"{email.lower().strip()}")

""" Разделение на имя пользователя и домен """
user_email= email.lower().split("@")

""" Используя f-строку, создаем: "Username: user, Domain: domain.com" """
print(f"Username: {user_email[0]}, Domain: {user_email[1]}")