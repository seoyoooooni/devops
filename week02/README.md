# Week 02

## 학습 목표

- 서버와 베어메탈, 가상 머신, 컨테이너의 차이를 이해한다.
- Windows의 WSL2·Ubuntu 또는 macOS 터미널에서 실습 환경을 준비한다.
- Linux에서 파일, 디렉터리, 권한을 다루고 Git으로 변경 이력을 남긴다.
- GitHub 저장소를 만들고 로컬 작업을 공유한다.

## 배운 명령어

pwd
ls
ls -l
ls -a

-: 파일
d: 디렉터리
l: 심볼릭 링크
r: 읽기
w: 쓰기
x: 실행 execute

chmod 권한 파일이름

cd ~
cd ..
cd .
cd -: 직전 작업하던 디렉토리

mkdir <>
rmdir <>: 디렉터리 비어있을때만 가능

echo >: 기존내용 덮어쓰기
echo >>: 기존내용 끝에 추가

cp devops.txt hi.txt

cp <> <>
mv <> <>

whoami
uname -a
sw_vers
df -h
clear
history

!103:p
!!
!ls

cat
less
head
tail
tail -f

git config --list

git diff <> <>
git switch -c <>