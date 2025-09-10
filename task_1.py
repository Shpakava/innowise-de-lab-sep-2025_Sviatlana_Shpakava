""" Задача 1: Список покупок """

shopping_list = ["milk", "bread", "eggs", "butter", "apples"]
counter = 1
print("Список покупок:")
for i in shopping_list:
    print(f"{counter}. {i}")
    counter = counter + 1

""" С помощью встроенной функции enumerate() """
shopping_list = ["milk", "bread", "eggs", "butter", "apples"]
print("Список покупок:")
for j, item in enumerate(shopping_list):
    print(f"{j + 1}. {item}")

