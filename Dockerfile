FROM ros:noetic

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y \
      libeigen3-dev \
      libpcl-dev \
      cmake \
      ros-noetic-pcl-conversions \
      ros-noetic-pcl-ros

RUN mkdir -p catkin_ws/src/BALM

ADD . /catkin_ws/src/BALM

WORKDIR /catkin_ws

RUN rm -rfd /src/BALM/BALM-old && . /opt/ros/noetic/setup.sh && catkin_make

ENTRYPOINT ["bash", "/catkin_ws/src/BALM/run.sh"]
