""" Задача 5: Рисуем Прямоугольник (optional) """

print(f"Введите высоту прямоугольника: ", end="")
height = int(input())
print(f"Введите ширину прямоугольника: ", end="")
width = int(input())

for i in range(height):
    for j in range(width):
        print("*", end="")    
    print()