# redis-cli-web
一个在线的redis命令行工具

### 必须确保容器在一个网络内！！！

## 使用步骤

1. 创建一个桥接网络
    ```
    docker network create -d bridge work
    ```

2. 拉取redis镜像
    ```
    docker pull redis
    ```

3. 创建一个redis容器，指定名称，网络，端口号
    ```
    docker run --name redis-master --network work -d -p 6379:6379/tcp redis
    ```

4. 再来拉取运行所需web环境镜像
    ```
    docker push flxxyz/redis-cli-web
    ```

5. web环境指定名称，网络，端口号，运行
    ```
    docker run --name redis-cli-web --network work -d -p 7070:7070/tcp flxxyz/redis-cli-web --welcome
    ```

6. 此时可以打开浏览器访问，会提示未连接，没有关系， 命令行敲`connect redis-master 6379`, 回车，提示链接成功
    > redis-master就是我们刚刚创建redis容器指定的名称

7. 命令行内的操作与原始redis-cli基本无误，唯一的变化就是没有提示23333
    > redis-cli的具体使用方法可以去看 https://github.com/holys/redis-cli

## 感谢
[yudai/gotty](https://github.com/yudai/gotty), [holys/redis-cli](https://github.com/holys/redis-cli), 以及[docker](https://docker.io/)
