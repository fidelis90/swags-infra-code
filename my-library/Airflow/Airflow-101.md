## Apache Airflow 

- author, schedule and monitor workflows 
- uses a message queue to orchestrate an arbitrary number of workers 
- airflow pipelines are defined in python 
- Easily define your own operators and extend libraries to fit level of abstraction that suits your environment 
- uses jinja templating engine 

## DAG 

- This is a pipeline that defines the flow of tasks 
- T1 -> T2 -> T3 -> T4 
- T1: Executes a python function 
- T2: Executes a bash command 
- T3: Inserts data into a database 
- Dag is a graph with nodes. no cycles 
- when a Dag is triggered, a DAGRun is created.

## OPERATORS 

- the executor of each task in a dag 
- airflow has tons of operators 
- operators has some arguments.
  - task_id: unique identifier of the operator in the DAG 
- To know the argument your operator needs, refer to the documentation.

## Dependencies 

- a DAG has directed edges. Those directed edges are the dependencies 
task_a >> task_b : task b is a downstream task to task a 
# Or
task_b << task_a : task a is an upstream task to task b 

# Step 1 

## Make the Imports 
- import the classes you need 
- import the operators 
- import the datetime class as you need to specify a start date to your DAG 

from airflow import DAG
from airflow.operators.python import PythonOperator, BranchPythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime

# Step 2 

## Create the Airflow DAG Object 

- a dag object must have paramters 
  - dag_id : unique identifier 
  - start_date : date your dag starts being scheduled 
  - schedule_interval: defines the interval of time at which your DAG gets triggered 
  - catchup: prevent backfiling automatically the non triggered DAG run btw the start date of your DAG and the current date.

example code 

with DAG("my_dag", # Dag id
start_date=datetime(2021, 1 ,1), # start date, the 1st of January 2021 
schedule_interval='@daily',  # Cron expression, here it is a preset of Airflow, @daily means once every day.
catchup=False  # Catchup 
) as dag:

- to create an instance of a DAG, we use the with statement 
- "with" is a context-manager and allows you to better manage objects 


# step 3

## Add your tasks

- task is an operator 

SETUP 

- create a projejct folder

- https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqblM1a3RCdFB3RkRrYS1PRDdwS2ZuVWt5T19rZ3xBQ3Jtc0trMWxBSkkySGJxcVV3cktZVnhzOWN3TDA0VVEtS1JGVWdseElRbk0wbkxnaWgxWFRYam5sMDVFSEVYMVh6LUE1LWYxYUt2UGRpQjZfeG4yd3lKQlozdlJ5V2hKc3Q5UjVyWlFfeTdzZGp1QXlfQXJoYw&q=https%3A%2F%2Fairflow.apache.org%2Fdocs%2Fapache-airflow%2Fstable%2Fdocker-compose.yaml

- get the compose file in the directory 

- echo -e "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env 

- docker-compose up airflow-init

- 







































