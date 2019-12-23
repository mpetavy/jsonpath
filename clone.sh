curl --user "$GITHUB_USERNAME:$GITHUB_PASSWORD" https://api.github.com/users/mpetavy/repos?per_page=1000 > /tmp/repos.txt 
jsonpath -f /tmp/repos.txt -q "$..[?(@.language == 'Go')].name" | while read -r line; do git clone https://github.com/mpetavy/$line; done
