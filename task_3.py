""" Задача 3: Угадай число """

secret_number = 7

user_number = ""

while user_number != secret_number:
    print(f"Угадайте число от 1 до 10: ", end="")
    user_number = int(input())
    if user_number != secret_number:
        print("Неверно, попробуйте еще раз.")

print("Поздравляю! Вы угадали число!")