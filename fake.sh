#!/bin/bash

# 房主名
server_name=$(printf '\u0001')"FakeListRoom"
game_name="RELAY-CN (Github)"
game_version="176"
game_version_string="1.15"
game_version_beta="false"
# 卡排序 / 地图名
game_map=$(printf '\u0001')$(printf '\u0001')$(printf '\u0001')"FakeListRoom Project"
game_mode="skirmishMap"
# 战役室
game_status="battleroom"
# 人数
max_player_count=9999
private_ip="127.0.0.1"
master_server_url1="http://gs1.corrodinggames.com/masterserver/1.4/interface"
master_server_url2="http://gs4.corrodinggames.net/masterserver/1.4/interface"

server_token=$(openssl rand -hex 20)
user_id="u_$(uuidgen)"
current_time=$(date +%s)

function md5() {
  echo -n "$1" | md5sum | awk '{print $1}'
}

function reup() {
  echo -n "$1" | sha256sum | cut -c 1-4
}

proxy=$2
proxy_type=$(echo $proxy | awk -F '@' '{print $2}')
proxy_address=$(echo $proxy | awk -F '@' '{print $1}')
proxy_port=$(echo $proxy_address | awk -F ':' '{print $2}')

function curl_with_proxy() {
  local url=$1
  local data=$2
  curl -x "$proxy_type"://"$proxy_address" -X POST -d "$data" "$url"
}

function add_server() {
  local port_number=$proxy_port
  local data="action=add&user_id=$user_id&game_name=$game_name&_1=$current_time&tx2=$(reup "_$user_id"5)&tx3=$(reup "${user_id}_$(($current_time + 5))")&game_version=$game_version&game_version_string=$game_version_string&game_version_beta=$game_version_beta&private_token=$server_token&private_token_2=$(md5 $(md5 $server_token))&confirm=$(md5 "a$(md5 $server_token)")&password_required=false&created_by=$server_name&private_ip=$private_ip&port_number=$port_number&game_map=$game_map&game_mode=$game_mode&game_status=$game_status&player_count=0&max_player_count=$max_player_count"
  curl_with_proxy $master_server_url1 "$data"
  curl_with_proxy $master_server_url2 "$data"
  data="action=self_info&port=$port_number&id=$user_id&tx3=$(reup "${user_id}_54")"
  curl_with_proxy $master_server_url1 "$data"
  curl_with_proxy $master_server_url2 "$data"
  # 无限更新
  while true;
  do
    sleep 30;
    update_server;
  done
}
function update_server() {
  local data="action=update&id=$user_id&game_name=$game_name&private_token=$server_token&password_required=false&created_by=$server_name&private_ip=$private_ip&port_number=$proxy_port&game_map=$game_map&game_mode=$game_mode&game_status=$game_status&player_count=0&max_player_count=$max_player_count"
  curl_with_proxy $master_server_url1 "$data"
  curl_with_proxy $master_server_url2 "$data"
}
function remove_server() {
  local data="action=remove&id=$user_id&private_token=$server_token"
  curl_with_proxy $master_server_url1 "$data"
  curl_with_proxy $master_server_url2 "$data"
}

case "$1" in
  add)
    add_server
    ;;
  update)
    update_server
    ;;
  remove)
    remove_server
    ;;
  *)
    echo "Invalid action specified"
    exit 1
    ;;
esac
