""" Часть 2: Функции и ООП
Упражнение 2: Функции с параметрами
Расчет цены с НДС """

def add_vat(prices, nds):
    for price in prices:
        result_price = price + price * nds
        print(f"Итоговая цена: {result_price}")

prices = [1000, 3499, 250]
nds = 0.20

add_vat(prices, nds)