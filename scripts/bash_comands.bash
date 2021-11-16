# criar o clurster

aws emr create-cluster \
--name "lilacluster2" \
--release-label emr-5.33.1 \
--applications Name=Spark \
--ec2-attributes KeyName=*************** \
--instance-type m5.xlarge \
--instance-count 3 \
--use-default-roles

# output

"ClusterId": "j-23HBJSOY0KLGJ",
    "ClusterArn": "arn:aws:elasticmapreduce:us-west-2:306951747918:cluster/j-23HBJSOY0KLGJ"	

# checar o status da criação do cluster

aws emr describe-cluster --cluster-id j-23HBJSOY0KLGJ

# Checar o cluster

aws emr list-clusters --cluster-states WAITING


# Criar um Passo do EMR para rodar a aplicação

aws emr add-steps \
--cluster-id j-23HBJSOY0KLGJ \
--steps Type=Spark,Name="wordcount-dio2",ActionOnFailure=CONTINUE,Args=[s3://desafiodioaws/data/health_violations.py,--data_source,s3://desafiodioaws/data/food_establishment_data.csv,--output_uri,s3://desafiodioaws/output/]

# output

"StepIds": [
        "s-284P9GK13LPE7"
    ]	

# Consultar o status da Etapa

aws emr describe-step --cluster-id j-23HBJSOY0KLGJ --step-id s-284P9GK13LPE7

# output

{
    "Step": {
        "Id": "s-284P9GK13LPE7",
        "Name": "wordcount-dio2",
        "Config": {
            "Jar": "command-runner.jar",
            "Properties": {},
            "Args": [
                "spark-submit",
                "s3://desafiodioaws/data/health_violations.py",
                "--data_source",
                "s3://desafiodioaws/data/food_establishment_data.csv",
                "--output_uri",
                "s3://desafiodioaws/output/"
            ]
        },
        "ActionOnFailure": "CONTINUE",
        "Status": {
            "State": "COMPLETED", 
            "Timeline": {
                "CreationDateTime": "2021-11-16T00:30:57.507000+00:00",
                "StartDateTime": "2021-11-16T00:31:11.886000+00:00",
                "EndDateTime": "2021-11-16T00:31:17.961000+00:00"
            }
        }
    }
}

# Encerrar o cluster

aws emr terminate-clusters --cluster-ids j-23HBJSOY0KLGJ

# Checar o status do cluster

aws emr describe-cluster --cluster-id j-23HBJSOY0KLGJ