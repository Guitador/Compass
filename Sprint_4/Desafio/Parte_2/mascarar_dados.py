import hashlib

def gerar_hash(texto):
    return hashlib.sha1(texto.encode()).hexdigest()

while True:
    entrada = input("Digite uma string (ou 'sair' para terminar): ")
    if entrada.lower() == 'sair':
        break
    hash_resultado = gerar_hash(entrada)
    print(f"Hash SHA-1: {hash_resultado}")
