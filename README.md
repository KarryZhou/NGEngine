# Run Under Mac

## 环境要求

MAC/WINDOWS/LINUX 已经安装过以下组件：
Docker
Docker-Compose
Make
Git

## 启动NGEngine

创建根目录
切换到根目录,git克隆本项目
```
git git@github.com:KarryZhou/NGEngine.git
```

创建运行目录
- ~/opt/data   存放MySQL数据库
- ~/opt/htdocs 项目代码
- ~/opt/log    存放所有输出Log

下载镜像及构建(当前配置可以不下载构建)

```
make dl
make build
```

构建及运行环境

```
docker-compose build
docker-compose up
```

修改本机域名解析

```
sudo vi /etc/hosts
加入
127.0.0.1  local.app1.com
127.0.0.1  local.tutorial.com
```

现在可以通过访问`http://local.tutorial.com`或'local.app1.com'来查看Web项目

