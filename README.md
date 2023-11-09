# ros2_docker
1. 以下でrosのインストールはできた
```
ENV ROS_DISTRO humble
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list \
    && apt-get update \
    && apt-get install -y ros-${ROS_DISTRO}-desktop 

```
2. 実行起動したときにbashスクリプトが開いている状態にしたい
``` docker run -it [name]```でいける
最後にbashを追加していいがdockerfileでCMD["bash]を書いているからいらない

3. ファイルをマウントする方法