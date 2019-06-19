# Galaxy - Cambridge Metabolomics tools
# VERSION 1.0
# wl-24-04-2019, Wed: Initial
 
FROM bgruening/galaxy-stable:19.01

LABEL maintainer="Wanchang Lin, wl361@cam.ac.uk"

ENV GALAXY_CONFIG_BRAND="Cambridge Metabolomics Tools" \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True

# Add config files
ADD tool_conf.xml $GALAXY_ROOT/config/
# ADD dependency_resolvers_conf.xml $GALAXY_ROOT/config/

# Install Tools
RUN mkdir $GALAXY_HOME/tools_cam \
    && cd $GALAXY_HOME/tools_cam \
    && git clone https://github.com/wanchanglin/massPix.git \
    && git clone https://github.com/wanchanglin/dimsp.git \
    && git clone https://github.com/wanchanglin/isolab.git \
    && git clone https://github.com/wanchanglin/lcms.git \
    && cd ~

# Autostart script that is invoked during container start
CMD ["/usr/bin/startup"]
