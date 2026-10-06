## Week 03

start.sh

#!/bin/bash
cd "$(dirname "$0")" || exit 1
exec python3 chat.py

#!: 셔뱅
- 어떤 인터프리터로 실행할지 os에 알려주는 부분으로 파일의 첫 줄에 작성
- 이 파일을 실행할 때, 바로 뒤에 적힌 프로그램으로 이 파일을 해석하라