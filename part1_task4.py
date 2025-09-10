""" Часть 1: Строки, Списки, Словари
Упражнение 4: List comprehension и словари """

words = ["hello", "world", "python", "code"]

""" Создание списка длин слов, используя списковое включение """
len_words = [len(i) for i in words]
print(len_words)

""" Создание списка слов длиннее 4 символов """
len_words_4 = [i for i in words if len(i) > 4]
print(len_words_4)

""" Создание словаря: {слово: длина} для всех слов
Использовалась функция zip() """
lenth_words = [len(i) for i in words]

dict_words_lenth = dict(zip(words, lenth_words))
print(dict_words_lenth)