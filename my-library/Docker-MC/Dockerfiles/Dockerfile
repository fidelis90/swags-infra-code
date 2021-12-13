FROM Ubuntu 

RUN apt-get update -y 
RUN apt-get install install python -y 

RUN pip install flask 
RUN pip install flask-mysql 

COPY . /opt/source-code 

ENTRYPOINT FLASK_APP=//opt/source-code/app.py flask run 

