#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 项目初始化
setup() {
    cd $DIR &&  cd ..
    cd flutter_dev
    flutter packages upgrade

    cd $DIR &&  cd ..
    cd flutter_module
    flutter packages upgrade

    cd $DIR &&  cd ..
    cd iOS/FlutterPrograms
    pod install --repo-update

    cd $DIR
}

main() {
    if [ $1 == "setup" ];  then
        setup
    fi
}

main $@

