#!/bin/bash

while IFS= read -r line || [[ -n "$line" ]]; do
    # 移除行尾的回车符（如果存在）
    line=$(echo "$line" | tr -d '\r')

    echo "$line"
    for i in {1..4}; do
        bash fake.sh add "$line" &
    done
done < proxy.txt
