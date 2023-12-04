#!/bin/bash

# Configuracoes do banco de dados
DB_HOST="localhost"
DB_USER="user"
DB_PASS="password_bd"
DB_NAME="name_bd"
TABLE_NAME="table_name"

# Nome do arquivo CSV
CSV_FILE="/tmp/lista1.csv"

# Definir separador de campo como ponto e virgula (;)
IFS=";"

# Loop para ler o arquivo CSV
while read -r col1
do
    # Comando SQL para atualizacao
    SQL="update subscriber set ha1 = md5(concat(username, ':', domain, ':', password)), ha1b = md5(concat(username, '@', domain, ':', domain, ':', password)) where username='${col1}';"

    # Executa o comando no banco de dados MySQL
    mysql -h ${DB_HOST} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} -e "${SQL}"

done < ${CSV_FILE}
