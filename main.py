# Rastgelelik için kendi basit LCG (Linear Congruential Generator) üretecimiz
# Her çağrıldığında bir sonraki "rastgele" sayıyı üretir
def pseudo_random(seed=[123456789]):
    # LCG parametreleri (Yaygın kullanılan sayısal değerler)
    seed[0] = (1103515245 * seed[0] + 12345) % 2147483648
    return seed[0]

# 10x10 matrisi kütüphanesiz oluşturma ve ekrana yazdırma
matrix_size = 10

for i in range(matrix_size):
    row = ""
    for j in range(matrix_size):
        # Rastgele sayının çift veya tek olmasına göre yıldız ya da boşluk koyuyoruz
        # Yazdırmayı daha net görmek için boşluk yerine nokta (.) kullanabilirsiniz
        if pseudo_random() % 2 == 0:
            row += "* "
        else:
            row += ". "
    print(row)
