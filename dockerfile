# Specify the instructions to build the Docker image

# Use an official Python runtime as a base image
FROM python:3.12-rc-bookworm

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# It's good practice to copy requirements.txt first and install dependencies
# to leverage Docker's layer caching.
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container (if your app uses it)
# EXPOSE 80

# Define environment variable (optional)
ENV FLASK_APP=app.py

# Run the command to start the Flask application
CMD ["flask", "run", "--host=0.0.0.0"]