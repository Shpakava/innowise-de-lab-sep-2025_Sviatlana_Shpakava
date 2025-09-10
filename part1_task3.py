""" Часть 1: Строки, Списки, Словари
Упражнение 3: Методы списка """

fruits = ["apple", "banana"]

""" Добавление "orange" в конец списка """
fruits.append("orange")
print(fruits)

""" Вставка "grape" по индексу 1 """
fruits.insert(1, "grape")
print(fruits)

""" Удаление "banana" """
fruits.remove("banana")
print(fruits)

""" Сортировка списка """
fruits.sort()
print(fruits)

""" Переворачиваем список """
print(fruits[::-1])
