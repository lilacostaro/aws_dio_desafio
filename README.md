# Desafio - Contador de palavras utilizando computação na Nuvem da AWS
Projeto desenvolvido para a conclusão do Bootcamp de DataEnginner na Digital Innovation One.

## Objetivo do Desafio

Implementar um cluster para processamento distribuído de dados utilizando o serviço AWS EMR com o Hadoop MapReduce para contar palavras em um arquivo de texto armazenado no AWS S#, através de um algoritmo em Python.

## Serviços AWS utilizados para a Implementação do projeto

- EMR
- S3
- EC2

## Passo-a-Passo

- Criação do bucket S3 e das pastas que serão utilizada; \
    O bucket recebeu o nome de: **desafiodioaws** \
    As pastas criadas receberam os seguintes nomes **data, output, temp**.
- Criação de um par de chaves utilizando o serviço EC2; 
- Acessar o My Security Credentials e criar uma chave de acesso;
- Configurar um ambiente virtual python na máquina local, em um bash linux, utilizando os seguintes comandos: \
    virtualenv --python=python3.8 venv_desafio_dio_aws \
    source venv_desafio_dio_aws/bin/activate
- As bibliotecas *boto3, mrjob e fpdf*, foram instalados no ambiente virtual utilizando os seguintes comandos: \
    pip install boto3 \
    pip install mrjob \
    pip install fpdf
- Subir os arquivos no bucket S3, essa ingestão foi feita de forma manual através da plataforma de aws;
- O arquivo *mrjob.conf* foi modificado para a receber as informações pertinentes;
- O seguinte comando foi utilizado para rodar a aplicação: \
python3 dio-live-wordcount-test.py -r emr s3://{your_s3_bucket_name}/data/SherlockHolmes.txt --output-dir=s3://{your_s3_bucket_name}/output/logs1 --cloud-tmp-dir=s3://{your_s3_bucket_name}/temp/
- O seguinte comando apresentou erro, e embora eu tenha tentado resolver de varias formas, não foi a aplicação não rodou com êxito.

# Alternativa

Mediante o problema apresentado acima, busquei uma solução para conseguir entregar um resultado, e encontrei esse [tutorial](https://docs.aws.amazon.com/pt_br/emr/latest/ManagementGuide/emr-gs.html) da AWS e resolvi executa-lo.

## Informações 1

- O script [health_violations.py]() foi criado com o código fornecido pelo tutorial;
- O arquivo [food_establishment_data.zip](https://docs.aws.amazon.com/pt_br/emr/latest/ManagementGuide/samples/food_establishment_data.zip) foi baixado, extraído, e de forma manual foi carregado na pasta *data* do bucket *desafiodioaws* do S3;
- Utilizando o prompet de comando nativo da AWS foram executados os comandos presentes no arquivo [bash_comands.bash]();
- O arquivo gerado encontrasse na pasta [/respostas/food_establishment]().

## Informações 2

- Com o intuito de realizar o que foi pedido no desafio, utilizei o script [worrcount_pyspark.py]() para contar as palavras do livro disponibilizado;
- Os arquivos gerados estão na pasta [/respostas/sherlock]();
- Como uma forma de facilitar a visualização dos dados, foi plotado um [gráfico]() de barras vertical com as 20 palavras mais utilizadas no livro.