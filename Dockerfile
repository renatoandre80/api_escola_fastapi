# Usamos uma imagem oficial do Python
FROM python:3.10-slim

# Define o diretório de trabalho dentro do container.
WORKDIR /app

# Instalação de Dependências
# Copia o arquivo de dependências primeiro para aproveitar o cache de camadas do Docker.
# Esta etapa só será executada novamente se o arquivo requirements.txt for alterado.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copiar o Código da Aplicação
# Copia todos os outros arquivos do projeto para o diretório de trabalho no container.
COPY . .

# Etapa 6: Expor a Porta
# Informa ao Docker que o container escutará na porta 8000.
EXPOSE 8000

# Etapa 7: Comando para Executar a Aplicação
# Define o comando para iniciar o servidor Uvicorn quando o container for iniciado.
# O host 0.0.0.0 torna a API acessível de fora do container.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]