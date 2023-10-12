curl --user "$GITHUB_USERNAME:$GITHUB_TOKEN" https://api.github.com/user/repos?per_page=1000 > /tmp/repos.txt 
jsonpath -nb -f /tmp/repos.txt -q "$..[?(@.owner.login=='mpetavy')].name" | while read -r line; do git clone https://github.com/mpetavy/$line; done
