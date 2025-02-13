git init
git branch -m master main
gh repo create module_postgresql --public
git remote add origin https://github.com/yzpt/module_postgresql.git
git add .
git commit -m "Initial commit"
git push -u origin main



python3 -m venv venv_module_postgresql
source venv_module_postgresql/bin/activate
pip install ipykernel numpy pandas matplotlib psycopg2-binary sqlalchemy

touch .gitignore
echo "venv_*" > .gitignore
echo "key*" >> .gitignore
