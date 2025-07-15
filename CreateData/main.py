from models.client import Client
from models.service import Service
from db.postgres import Postgres
from db.config import Config
from dotenv import load_dotenv
import os
from generate.generate import ClientGenerator, ClientServicesGenerator

if __name__ == "__main__":

    def main(): 
        load_dotenv()
        dbname = os.getenv("DB_NAME")
        user = os.getenv("DB_USER")
        password = os.getenv("DB_PASSWORD")
        host = os.getenv("DB_HOST")
        port = os.getenv("DB_PORT")
        
        db_config = Config(dbname,user,password,host,port)

        clients = ClientGenerator().generate_clients(100)
        
        db = Postgres(db_config)
        db.insert_clients(clients)

        clients_services = ClientServicesGenerator().generate_client_services(clients)        
        db.insert_services(clients_services)
        db.close_connection()
    
    #main()