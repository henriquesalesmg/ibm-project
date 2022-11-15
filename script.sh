CURRENTDIR=${pwd}

echo "What name do you want to give your remote repo?"
read REPO_NAME

echo "Enter a repo description: "
read DESCRIPTION


echo "what is the absolute path to your local project directory?"
read PROJECT_PATH

echo "What is your github username?"
read USERNAME

cd "$PROJECT_PATH"


git init
touch README.MD
git add README.MD
git commit -m 'initial commit -setup with .sh script'

curl -u ${USERNAME} https://api.github.com/user/repos -d "{\"name\": \"${REPO_NAME}\", \"description\": \"${DESCRIPTION}\"}"

git remote add origin https://github.com/${USERNAME}/${REPO_NAME}.git
git push --set-upstream origin master

cd "$PROJECT_PATH"
