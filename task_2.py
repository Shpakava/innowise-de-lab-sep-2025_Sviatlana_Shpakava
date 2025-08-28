""" Задача 2: Обратный отсчет до запуска """

print("Введите число для обратного отсчета: ", end="")
number = int(input())
for i in range(number, 0, -1):
    print(f"{i}. . .")
print("Go!")