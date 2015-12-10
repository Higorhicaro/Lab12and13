# Set the base image
FROM python:2.7

# Update the sources list
RUN apt-get update

# Update the sources list
RUN apt-get -y upgrade

#install boto from pip
RUN pip install boto

# Copy the application folder inside the container
ADD /my_app /my_app

# Get pip to download and install requirements:
RUN pip install -r /my_app/requirements.txt

# Expose listener port
EXPOSE 5000

# Set the default directory where CMD will execute
WORKDIR /my_app

# Set the default command to execute    
# when creating a new container
CMD python server.py
