#!/bin/bash

# Definir o diretório atual
dir=$(pwd)

# Criar o diretório 'vendas' e o subdiretório 'backups'
mkdir -p "$dir/vendas/backups"

# Voltar para o diretório inicial
cd "$dir"

# Adicionar arquivo na pasta vendas
cp dados_de_vendas.csv vendas

# Obter a data no formato yyyymmdd
d1=$(date +%Y%m%d)
d2=$(date +%Y/%m/%d)

# Copiar o arquivo com o novo nome
cd vendas
cp dados_de_vendas.csv backups/backup-dados-$d1.csv
cd $dir

# Criar o arquivo relatorio.txt
relatorio="vendas/backups/relatorio-$d1.txt"

# Obter a data atual no formato yyyy/mm/dd
{
  echo "Data de execução do script: $d2"

  # Extrair o primeiro e o último registro de venda
  data_inicial=$(awk -F, 'NR==2 {print $5}' vendas/backups/backup-dados-$d1.csv)
  data_final=$(awk -F, 'END {print $5}' vendas/backups/backup-dados-$d1.csv)

  echo "Data do primeiro registro de venda: $data_inicial"
  echo "Data do último registro de venda: $data_final"

  # Contar a quantidade total de itens diferentes vendidos
  itens=$(awk -F, '{if(NR>1) qty+=$3} END {print qty}' vendas/backups/backup-dados-$d1.csv)
  echo "Quantidade total de itens vendidos: $itens"

  # Adicionar as primeiras 10 linhas do arquivo
  echo -e "\nPrimeiras 10 linhas do arquivo:"
  head -n 10 vendas/backups/backup-dados-$d1.csv
  echo "///////////////////////////////////////////////////////////////////"
  echo "\n"
} > "$relatorio"

echo "Relatório gerado em $relatorio"

# Compactar o arquivo CSV para ZIP
cd vendas/backups
zip backup-dados-$d1.zip backup-dados-$d1.csv

# Apagar o arquivo CSV
rm backup-dados-$d1.csv

# Apagar o arquivo dados_de_vendas.csv da pasta vendas
cd ..
rm dados_de_vendas.csv

echo "Arquivo CSV compactado e excluído. Relatório e arquivo ZIP permanecem na pasta backups."

echo "Finalizado."

