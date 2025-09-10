""" Часть 2: Функции и ООП
Упражнение 3 (Опционально) """

def calculate_average_score(scores, ignore_lowest=False):
    for dicts in scores:
        if ignore_lowest == False:
            result = sum(dicts["scores"]) / len(dicts["scores"])
            print(result)
        elif ignore_lowest == True and len(dicts["scores"]) != 1:
            result = (sum(dicts["scores"]) - min(dicts["scores"])) / (len(dicts["scores"]) - 1)
            print(result)
            """ Если в списке всего одна оценка, отбрасывать её не нужно. """
        elif ignore_lowest == True and len(dicts["scores"]) == 1:
            result = sum(dicts["scores"])
            print(result)

student_data = [
{'name': 'Алексей', 'scores': [85, 92, 78, 95]},
{'name': 'Марина', 'scores': [65, 70, 58, 82]},
{'name': 'Светлана', 'scores': [98, 95, 100]}
]

calculate_average_score(student_data, False)

""" Если ignore_lowest равен True, функция отбрасывает наименьшую оценку
    перед вычислением среднего """
calculate_average_score(student_data, True)