from datetime import datetime

""" Часть 2: Функции и ООП
Упражнение 1: Функции без параметров
Функция show_current_time() печатает текущие дату и время """

def show_current_time():
    current_datetime = datetime.now()
    print(f"Текущие дата и время: {current_datetime}")

show_current_time()
