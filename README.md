# install-ss

一个简单的 ss 安装脚本。



### 使用方式

```bash
git clone https://github.com/kamilic/install-ss.git install-ss
cd install-ss
chmod +x install-ss.sh
./install-ss.sh 169.32.53.22 mypassword # ./install-ss.sh <你的服务器 ip> <你的密码>

# 运行完毕后，启动服务
ssserver -c /home/ss/ss-config.json -d start 
```

然后可以通过  
```
ip: 169.32.53.22 
port: 8388  
password：mypassword  
加密: aes-256-cfb   
```
来访问你的 ss 服务器
