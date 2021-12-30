from airflow import DAG 
from airflow.operators.python import PythonOperator 
from datetime import datetime 

def _process():
    print("Process Done!!")

with DAG("my_first_dag",  start_date=datetime(2021, 1, 1), schedule_interval="@daily", catchup=False) as dag:
    task_A = PythonOperator (
        task_id="task_A",
        python_callable=_process
    )