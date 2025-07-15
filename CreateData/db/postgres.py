import psycopg2
from psycopg2.extras import execute_batch
from dataclasses import dataclass
from db.config import Config
from typing import List
from models.client import Client
from models.service import Service

class Postgres:
    _instance = None
    config : Config

    def __new__(cls, config : Config):
        if not cls._instance:
            cls._instance = super().__new__(cls)
            cls._instance._init_connection(config)
        return cls._instance

    def _init_connection(self,config : Config):
        self.conn = psycopg2.connect(
            dbname = config.dbname,
            user = config.user,
            password = config.password,
            host = config.host,
            port = config.port
        )
        self.cur = self.conn.cursor()

    def insert_clients(self, clients : list[Client]):
        query = """
            INSERT INTO clientes (nombre, fecha_alta, activo)
            VALUES (%s, %s, %s)
            RETURNING id;
        """
        inserted_ids = []

        for client in clients:
            self.cur.execute(query, (client.name, client.fecha_alta, client.activo))
            new_id = self.cur.fetchone()[0]
            client.id = new_id
            inserted_ids.append(new_id)

        self.commit_changes



    def insert_services(self, services):
        service_query = """
            INSERT INTO servicios (
                id, cliente_id, fecha, tipo_servicio, tipo_residuo, kg_recolectados,
                relleno_sanitario, status, duracion_disposicion_min,
                litros_combustible, km_recorridos, horas_operacion,
                horas_muertas, ingreso_disposicion
            )
            VALUES (
                %s, %s, %s, %s, %s, %s,
                %s, %s, %s,
                %s, %s, %s,
                %s, %s
            )
        """
        service_data = [
            (
                s.id, s.client_id, s.fecha, s.tipo_servicio, s.tipo_residuo, s.kg_recolectados,
                s.relleno_sanitario, s.status, s.duracion_disposicion_min,
                s.litros_combustible, s.km_recorridos, s.horas_operacion,
                s.horas_muertas, s.ingreso_disposicion
            )
            for s in services
        ]
        execute_batch(self.cur, service_query, service_data)
        self.commit_changes()
        print("Servicios insertados correctamente.")

    def commit_changes(self):
        self.conn.commit()

    def close_connection(self):
        self.cur.close()
        self.conn.close()
        print("Conexión cerrada.")
