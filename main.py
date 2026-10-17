# Rastgelelik için kendi basit LCG üretecimiz
def pseudo_random(seed=[123456789]):
    seed[0] = (1103515245 * seed[0] + 12345) % 2147483648
    return seed[0]

# 10x10 matrisi kütüphanesiz oluşturma ve ekrana yazdırma
matrix_size = 10
print("--- DOCKER İÇİNDE ÇALIŞAN 10x10 MATRİS ---")

for i in range(matrix_size):
    row = ""
    for j in range(matrix_size):
        num = pseudo_random() % 100
        row += f"{num:3d} "
    print(row)

print("------------------------------------------")
print("Başarıyla tamamlandı!")
