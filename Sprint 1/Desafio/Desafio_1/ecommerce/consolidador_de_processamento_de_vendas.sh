#!/bin/bash

# Nome do arquivo de saída
arquivo_saida="relatorio_completo.txt"

# Remove o arquivo de saída se ele já existir
if [ -f "$arquivo_saida" ]; then
    rm "$arquivo_saida"
fi

# Itera sobre todos os arquivos .txt que começam com "relatorio"
for arquivo in relatorio*.txt; do
    # Verifica se o arquivo realmente existe
    if [ -f "$arquivo" ]; then
        # Adiciona o conteúdo do arquivo ao arquivo de saída
        cat "$arquivo" >> "$arquivo_saida"
        # Adiciona uma nova linha para separar os arquivos
        echo >> "$arquivo_saida"
    else
        echo "Nenhum arquivo correspondente encontrado."
    fi
done

echo "Todos os arquivos foram concatenados em $arquivo_saida."

