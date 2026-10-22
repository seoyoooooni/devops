cd "$(dirname "$0")" || exit 1          

DESIRED=${1:-3}                         
TOTAL=$((DESIRED + 2))                  
INTERVAL=5                              
PROJECT=$(basename "$PWD")           

if ! command -v docker >/dev/null 2>&1; then
    echo "docker 명령을 찾을 수 없습니다." >&2
    exit 1
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') 감시 시작: web ${DESIRED}개 유지 (PID $$)"

while true; do
    NOW=$(date '+%Y-%m-%d %H:%M:%S')

    if ! docker info >/dev/null 2>&1; then
        echo "$NOW 도커 엔진에 연결할 수 없음 (Docker Desktop 실행 확인)" >&2
        sleep "$INTERVAL"
        continue
    fi

    WEB=$(docker compose ps web -q | wc -l)
    ALL=$(docker compose ps -q | wc -l)

   
    if [ "$WEB" -ne "$DESIRED" ] || [ "$ALL" -ne "$TOTAL" ]; then
        echo "$NOW 차이 발견: web ${WEB}/${DESIRED}, 전체 ${ALL}/${TOTAL} → 복구"
        docker compose up -d --scale web="$DESIRED" --no-recreate
    fi

    REDIS_OK=$(docker ps -q \
        --filter "label=com.docker.compose.project=$PROJECT" \
        --filter "label=com.docker.compose.service=redis" \
        --filter "health=healthy" | wc -l)

    if [ "$REDIS_OK" -ge 1 ]; then
        SICK=$(docker ps -q \
            --filter "label=com.docker.compose.project=$PROJECT" \
            --filter "label=com.docker.compose.service=web" \
            --filter "health=unhealthy" | head -n 1)
        if [ -n "$SICK" ]; then
            echo "$NOW unhealthy web 재시작: $SICK"
            docker restart "$SICK" >/dev/null
        fi
    fi

    sleep "$INTERVAL"
done