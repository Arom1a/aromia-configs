#!/bin/zsh

py_pack_update()
{
    result="$(pip list --outdated)"
    if [ $result = $null ];then
        echo "All of your packages are up to date! "
    else
        pip install --upgrade $(echo $result | tail -n +3 | awk '{print $1}')
    fi
}

py_get_pack_list()
{
    echo "$(pip list | tail -n +3 | awk '{print $1}')" > "packages_python$(python3 --version | awk '{print $2}').txt"
}

py_get_env_list()
{
    pip freeze > requirements.txt
}
