
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8


WORKDIR /home/jovyan/work


COPY conda-linux-64.lock /tmp/conda-linux-64.lock


RUN mamba create --yes --quiet --name assignment2 --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"




EXPOSE 8888

# add a comment to test workflow2
CMD ["start-notebook.sh"]
