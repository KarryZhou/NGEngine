# Run

## 环境要求

MAC/WINDOWS/LINUX 已经安装过以下组件：
```
Docker (https://store.docker.com/search?type=edition&offering=community)
Docker-Compose 
Make (MinGW for windows可不装：https://sourceforge.net/projects/mingw/)
Git (https://git-scm.com/)
```

## 获取NGEngine

创建根目录
切换到根目录，git克隆本项目
```
git git@github.com:KarryZhou/NGEngine.git
```

创建运行目录
- ~/opt/data   存放MySQL数据库
- ~/opt/application 项目代码
- ~/opt/log    存放所有输出Log
-- ~opt/log/nginx nginx日志
-- ~opt/log/php php日志

下载镜像及构建(当前配置可以不下载构建)
```
make dl
make build
```
## 启动NGEngine
构建及运行环境
```
docker-compose build
docker-compose up
```
停止
```
docker-compose down
```

修改本机域名解析

```
hosts
加入
127.0.0.1  local.app1.com
127.0.0.1  local.tutorial.com
```

现在可以通过访问`http://local.tutorial.com`或'local.app1.com'来查看Web项目

