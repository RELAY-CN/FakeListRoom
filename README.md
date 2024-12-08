## FakeListRoom
用于在 Rusted Warfare 的列表上通过 端口代理 等多种方式实现虚假的房间

默认方案
> 创建一直在的房间 (保活)  

我们致力于让游戏环境变得更好, 即使是被动行为.   
**不为此负责**  

## Tags
`红队` `攻击性`   

## 使用
### 单个房间
```text
bash fake.sh add ip:port@type
```
例子
```text
bash fake.sh add 1.1.1.1:1111@socks5
```
### 多个房间
```text
bash fakes.sh
```
> 需要提前准备端口代理 proxy.txt

## 其他
我们**不认为**长期置顶列表是**好事**, 我们应该释放出来给更有需要的  
建议遵循自带逻辑, 24*7 服务器不应该, 也不应当长期置顶恶心正常玩家  

### Licenses  
The Unlicense  

```text
This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org>
```
