# Conda Environment Builder

Build Conda environment files for multiple platforms

To build an environment file for Linux, on any platform with Docker: 

    make build; make linux-env
    
To build an environment file for the operating system you are running on: 

    
    make local-env
    
    
The resulting files are written into the ``build`` directory


# Updating the Environment

Add new conda packages to ``requirements/conda-minimal.yaml`` and new pip packages
to ``requirements/requirements.txt``