## Usage

```sh
docker run --rm -ti -e AWS_PROFILE=vanilla -v ${HOME}/.aws:/root/.aws -v ${HOME}/.docker:/root/.docker gustavohenrique/awscli:alpine command
```

## Example

```sh
region="sa-east-1"                                                                                                                                   
account_id="403792981123"
echo "Auth on ECR..."
awscli="docker run --rm -ti -e AWS_PROFILE=vanilla -v ${HOME}/.aws:/root/.aws -v ${HOME}/.docker:/root/.docker gustavohenrique/awscli:alpine"
# get_login="${awscli} ecr get-login --region sa-east-1 --no-include-email"
get_login="${awscli} ecr get-login-password --region ${region}"
echo $($get_login) | docker login -u AWS --password-stdin https://${account_id}.dkr.ecr.${region}.amazonaws.com
ecr="${account_id}.dkr.ecr.sa-east-1.amazonaws.com/${app_name}-production"
image="${ecr}:latest"
echo "Building ${image}..."
docker build --build-arg VERSION=${version} . -t=${image}
echo "Sending ${image}..."
docker push ${image}
```
