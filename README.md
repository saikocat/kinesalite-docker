# Introduction
Small docker container (Alpine based) with service user (`app`) and mountable volume (`/data/kinesalite`) using __[Kinesalite](https://github.com/mhart/kinesalite)__ - by [@mhart](http://www.github.com/mhart)

# Build Instruction
```
$ docker build -t saikocat/kinesalite-docker:1.11.4 .
```

# Run Instruction
```
$ docker run -d \
    -p 4567:4567 \
    --name kinesalite \
    saikocat/kinesalite-docker:1.11.4 --port 4567
```

## Runtime Configuration
More runtime flags can be found at __[Kinesalite](https://github.com/mhart/kinesalite)__

## Persistent volume
`-v host/kinesalite:/data/kinesalite` and `--path /data/kinesalite`
if you want persistency

# Hints for a smoother start if using aws-cli
## Create a separate profile with fake information
```
$ aws configure --profile kinesalite
AWS Access Key ID [None]: kinesalite
AWS Secret Access Key [None]: kinesalite
Default region name [None]: kinesalite
Default output format [None]: json
```

## Always specify the endpoint url override
```
$ aws --profile kinesalite kinesis create-stream --stream-name raw-good --shard-count 1 --endpoint-url http://localhost:4567
```
