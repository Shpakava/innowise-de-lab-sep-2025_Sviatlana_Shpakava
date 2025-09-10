""" Task 1: Приветствие """
print("Как тебя зовут?")
name = input()
print(f"Привет, {name}! Приятно познакомиться")

""" Task 2: Площадь прямоугольника """
print("Введите длину прямоугольника: ", end="")
length = int(input())
print("Введите ширину прямоугольника: ", end="")
width = int(input())
print(f"Площадь прямоугольника: {length * width}")

""" Task 3: Конвертер температур """
print("Введите температуру в градусах Цельсия: ", end="")
tc = float(input())
tf = 9 / 5 * tc + 32
print(f"{tc}°C это {tf}°F")

""" Task 4: Игра «Угадай число» """
import random
num = random.randint(1, 5)
print("Я загадал число от 1 до 5. Попробуй угадать!")

def guess_num():
        number = int(input())
        if number < num:
            print("Слишком мало!")
        elif number > num:
            print("Слишком много!")
        else:
            print("Ты угадал!")

guess_num()

""" Task 5: Проверка числа на четность» """
print("Введите целое число: ", end="")
num = int(input())
if num % 2 == 0:
    print(f"Число {num} - четное")
else:
    print(f"Число {num} - нечетное")

""" Task 6: Калькулятор (Опциональное) """
print("Введите число: ", end="")
a = int(input())
print("Введите число: ", end="")
b = int(input())
print("Введите оператор: ", end="")
op = input()
if op == "+":
    print (a + b)
elif op == "-":
    print (a - b)
elif op == "*":
    print(a * b)
elif op == "/" and b != 0:
    print(a / b)
elif op == "/" and b == 0:
    print("На ноль делить нельзя!")
else:
    print("Неверная операция")