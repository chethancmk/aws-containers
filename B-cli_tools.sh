# JQ and text Utils
sudo yum -y install jq gettext bash-completion moreutils

# Check YQ for Yaml
echo 'yq() {
  docker run --rm -i -v "${PWD}":/workdir mikefarah/yq yq "$@"
}' | tee -a ~/.bashrc && source ~/.bashrc

# Check tools are installed
for command in jq envsubst aws
  do
    which $command &>/dev/null && echo "$command in path" || echo "$command NOT FOUND"
  done
  
