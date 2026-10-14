## docker compose ps 결과
- ![compose ps](images/dockercomposeps.png)

## scale 후 각 웹 컨테이너 호스트명이 바뀐 결과 캡쳐
- ![01](images/01.png)
- ![02](images/02.png)
- ![03](images/03.png)

## down 후 up과 down -v 후 up 차이 비교
- ![compose down -v](images/dockercomposedown-v.png)
- ![compose down](images/dockercomposedown.png)
- -v 하면 volume까지 삭제돼서 데이터가 사라진다.

## .env를 깃에 올리지 않는 이유
- 비밀번호 등 공개하면 안되는 값이 들어있기 때문