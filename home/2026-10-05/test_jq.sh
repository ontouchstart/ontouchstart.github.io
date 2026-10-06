#!/usr/bin/env bash

echo "--- 1. Alternative Operator (//) ---"
echo '{"user": {"role": null}}' | jq '.user.role // "Guest"'

echo -e "\n--- 2. Optional Operator (?) ---"
echo '{"user": {"name": "Alice"}}' | jq '.user.profile.name?'
echo '{"data": {"items": [1, 2, 3]}}' | jq '.data.items[10]?'

echo -e "\n--- 3. Regex Capture (capture) ---"
echo 'ID: 12345; Name: John Doe' | jq -Rr 'capture("ID: (?<id>\\d+); Name: (?<name>.*)")'

echo -e "\n--- 4. Regex Scan (scan) ---"
echo "Contact us at support@example.com or sales@company.org for help." | jq -Rr 'scan("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")'

echo -e "\n--- 5. Reduce (reduce) ---"
echo '[1, 2, 3, 4, 5]' | jq 'reduce .[] as $v (0; . + $v)'

echo -e "\n--- 6. Update Assignment (|=) ---"
echo '{"prices": [{"item": "apple", "price": 10}, {"item": "orange", "price": 20}]}' | jq '.prices[].price |= . * 1.1'
echo '{"items": [{"id": 1, "tags": ["new", "sale"]}, {"id": 2, "tags": ["old"]}]}' | jq '.items[].tags |= map(ascii_downcase)'

echo -e "\n--- 7. Foreach (foreach) ---"
echo '[1, 2, 3]' | jq 'foreach .[] as $item (0; . + $item; [$item, . * 2])'

echo -e "\n--- 8. Map and Select ---"
echo '[{"id": 1, "active": true}, {"id": 2, "active": false}, {"id": 3, "active": true}]' | jq 'map(select(.active) | {id, status: "online"})'

echo -e "\n--- 9. Try/Catch ---"
echo '[1, "two", 3, "four"]' | jq '.[] | try tonumber catch "NaN"'
echo '{"data": [{"id": 1, "score": 10}, {"id": 2, "score": 20}, {"id": 3, "score": 10}]}' | jq '.data |= map(try tonumber catch 0)'

echo -e "\n--- 10. Complex Logic (map + if) ---"
echo '{"data": [{"id": 1, "val": 10}, {"id": 2, "val": 20}]}' | jq '.data |= map(if .id == 1 then .val += 5 else . end)'
echo '{"users": [{"name": "Alice", "role": "admin"}, {"name": "Bob", "role": "user"}]}' | jq '.users |= map(if .role == "admin" then .name |= ascii_upcase else . end)'

echo -e "\n--- 11. Grouping (group_by) ---"
echo '{"products": [{"id": 1, "cat": "fruit"}, {"id": 2, "cat": "veg"}, {"id": 3, "cat": "fruit"}]}' | jq '.products | group_by(.cat) | map({category: .[0].cat, items: map(.id)})'
echo '{"events": [{"id": 1, "type": "click"}, {"id": 2, "type": "view"}, {"id": 3, "type": "click"}]}' | jq '.events | group_by(.type) | map({type: .[0].type, count: length})'
