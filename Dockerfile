FROM intel4coro/jupyter-ros2:humble-py3.10

# --- Install unitree_sdk2_python --- #
WORKDIR /home/${NB_USER}/
RUN git clone https://github.com/eclipse-cyclonedds/cyclonedds -b releases/0.10.x  && \
    cd cyclonedds && mkdir build install && cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=../install && \
    cmake --build . --target install
ENV CYCLONEDDS_HOME=/home/${NB_USER}/cyclonedds/install
RUN git clone https://github.com/unitreerobotics/unitree_sdk2_python.git && \
    cd unitree_sdk2_python && \
    pip install -e .
RUN pip install mujoco pygame

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118

# --- Copy notebooks --- #
USER ${NB_USER}
COPY --chown=${NB_USER}:users ./ /home/${NB_USER}/unitree_mujoco/
WORKDIR /home/${NB_USER}/unitree_mujoco/