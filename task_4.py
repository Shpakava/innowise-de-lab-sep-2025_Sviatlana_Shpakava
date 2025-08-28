""" Задача 4: Обработка данных """

scores = [75, 88, 95, 0, 100]

total_score = 0

for score in scores:
    if score < 0:
        continue
    elif score == 0:
        break
    else:
        total_score = total_score + score
        print(f"Добавлен балл: {score}")

print("Все данные обработаны.")

print(f"Итоговая сумма баллов: {total_score}")


scores = [75, 88, -10, 95, 100, -25, 89]

total_score = 0

for score in scores:
    if score < 0:
        continue
    elif score == 0:
        break
    else:
        total_score = total_score + score
        print(f"Добавлен балл: {score}")

print("Все данные обработаны.")

print(f"Итоговая сумма баллов: {total_score}")