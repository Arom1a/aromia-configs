#!/bin/zsh

pyPackUpdate()
{
    result="$(pip list --outdated)"
    if [ $result = $null ];then
        echo "All of your packages are up to date! "
    else
        pip install --upgrade $(echo $result | tail -n +3 | awk '{print $1}')
    fi
}

pyGetPackList()
{
    echo "$(pip list | tail -n +3 | awk '{print $1}')" > "packages_python$(python3 --version | awk '{print $2}').txt"
}

pyGetEnvList()
{
    pip freeze > requirements.txt
}
