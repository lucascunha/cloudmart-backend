#!/bin/bash

# Verifica se foi fornecido um parâmetro
if [ $# -ne 1 ]; then
    echo "Uso: $0 <número de repetições>"
    exit 1
fi

# Armazena o número de repetições
repeticoes=$1

# Verifica se o parâmetro é um número
if ! [[ "$repeticoes" =~ ^[0-9]+$ ]]; then
    echo "Erro: O parâmetro deve ser um número inteiro positivo."
    exit 1
fi

echo "Executando comandos kubectl $repeticoes vezes..."

# Loop para executar os comandos o número especificado de vezes
for (( i=1; i<=$repeticoes; i++ ))
do
    echo ""
    echo "==== Execução $i de $repeticoes ===="
    echo ""
    
    echo ">> kubectl get pods"
    kubectl get pods
    echo ""
    
    echo ">> kubectl get deployment"
    kubectl get deployment
    echo ""
    
    echo ">> kubectl get service"
    kubectl get service
    echo ""
    
    # Se não for a última execução, aguarda 30 segundos
    if [ $i -lt $repeticoes ]; then
        echo "Aguardando 30 segundos até a próxima execução..."
        sleep 30
    fi
done

echo "Script finalizado após $repeticoes execuções."
