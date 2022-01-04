#!/bin/bash
function PostKeke()
{
    sleep 1
    curl -s --location --request POST 'https://www.gamers.co.jp/special/harajuku_kanban/send.php' --header 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'mmname=keke' --data-urlencode 'submit=投票する' | grep -E "class=\"ok\"|class=\"ng\"" | gawk 'match($0, /">(.*)</, a) {print a[1]}'
}

echo "Start submit $1 times."
for((i=0;i < $1; ++i))
do
    PostKeke
done
echo 'Finished!'