FROM ros:humble-ros-core

# --- Install unitree_sdk2_python --- #
# WORKDIR /home/${NB_USER}/
# RUN git clone https://github.com/eclipse-cyclonedds/cyclonedds -b releases/0.10.x  && \
#     cd cyclonedds && mkdir build install && cd build && \
#     cmake .. -DCMAKE_INSTALL_PREFIX=../install && \
#     cmake --build . --target install
# ENV CYCLONEDDS_HOME=/home/${NB_USER}/cyclonedds/install
# RUN git clone https://github.com/unitreerobotics/unitree_sdk2_python.git && \
#     cd unitree_sdk2_python && \
#     pip install -e .
# RUN pip install mujoco pygame

# # --- Copy notebooks --- #
# USER ${NB_USER}
# COPY --chown=${NB_USER}:users ./ /home/${NB_USER}/unitree_mujoco/
# WORKDIR /home/${NB_USER}/unitree_mujoco/

# COPY --chown=${NB_USER}:users ./display.xml /home/${NB_USER}/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN apt update && apt install -y \
    python3-pip \
    python3-dev \
    python3-setuptools \
    python3-wheel \
    python3-venv
RUN pip3 install jupyterlab