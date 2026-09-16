#!/bin/bash

random_number=$((RANDOM % 99 + 1))

echo "1부터 99 사이의 숫자를 맞혀 보세요."

for ((attempt = 1; attempt <= 10; attempt++)); do
    read -r -p "${attempt}번째 숫자: " guess

    if ! [[ $guess =~ ^[0-9]+$ ]]; then
        echo "1부터 99 사이의 숫자를 입력하세요."
        ((attempt--))
        continue
    fi

    guess=$((10#$guess))

    if ((guess < 1 || guess > 99)); then
        echo "1부터 99 사이의 숫자를 입력하세요."
        ((attempt--))
        continue
    fi

    if ((guess == random_number)); then
        echo "정답입니다! ${attempt}번 만에 맞혔습니다."
        exit 0
    elif ((random_number > guess)); then
        echo "틀렸습니다. 랜덤 난수는 입력한 수보다 큽니다."
    else
        echo "틀렸습니다. 랜덤 난수는 입력한 수보다 작습니다."
    fi
done

echo "기회를 모두 사용했습니다. 정답은 ${random_number}였습니다."