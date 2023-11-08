FROM ubuntu:22.04

# Install ROS2
ENV ROS_DISTRO humble
RUN apt-get update && apt-get install -y \
    curl \
    gnupg2 \
    lsb-release \
    && curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2.list \
    && apt-get update \
    && apt-get install -y ros-${ROS_DISTRO}-desktop 

# 環境設定
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc \
    && source ~/.bashrc 
# 入っていいないものをインストール
# TODO余計なものがあるかもしれない
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    && python3-argcomplete \
    && ros-${ROS_DISTRO}-rqt-* \
    && ros-${ROS_DISTRO}-rviz2 \
    && gazebo ros-${ROS_DISTRO}-gazebo-ros-pkgs 

# nav2のインストール
RUN apt-get update && apt-get install -y \
    ros-${ROS_DISTRO}-navigation2 \
    ros-${ROS_DISTRO}-nav2-bringup
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ros2_ws
VOLUME ["/ros2_ws"]