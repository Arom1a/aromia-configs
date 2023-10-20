#!/bin/zsh

# pyPackUpdate()
# {
# pip install --upgrade "$(pip list --oudated | tail -n +3 | awk '{print $1}')"
# }

pyGetPackList()
{
echo "$(pip list | tail -n +3 | awk '{print $1}')" > "packages_python$(python3 --version | awk '{print $2}').txt"
}

pyGetEnvList()
{
pip freeze > requirements.txt
}
