# docker-aws-eb-ffmpeg

A Docker image derived from Amazon's Elastic Beanstalk Preconfigured Image.
It adds a freshly compiled FFMPEG tool as well as Postgres

### Instructions

See instructions for how to use Docker Preconfigured images with AWS's Elastic Beanstalk at http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/create_deploy_dockerpreconfig.html

If using Django, see https://github.com/dkarchmer/aws-eb-preconfigured-docker-django

In all examples, simply change your

~~~~
FROM amazon/aws-eb-python:3.4.2-onbuild-3.5.1
~~~~

to

~~~~
FROM dkarchmervue/aws-eb-ffmpeg
~~~~


### Example

Assuming a directory structure like

~~~~
./application.py
./requirements.txt
./manage.py
./yourproject/
~~~~

you should be able to simply do

~~~~
docker build -t myImage dkarchmervue/aws-eb-ffmpeg
docker run -ti myImage
~~~~

To debug, do

~~~~
docker run --entrypoint bash -ti myImage
~~~~


