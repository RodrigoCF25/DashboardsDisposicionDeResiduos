import random
import datetime
import itertools
from typing import List
from models.client import Client
from models.service import Service


class ClientGenerator:
    client_names: List[str] = [
        "Robert", "Laura", "Carlos", "Andrea", "Sofía",
        "Miguel", "Daniela", "Luis", "Valeria", "Jorge"
    ]

    last_names: List[str] = [
        "García", "López", "Martínez", "Hernández", "Pérez",
        "Ramírez", "Torres", "Flores", "Sánchez", "Gómez"
    ]

    @classmethod
    def generate_clients(cls,clients_number : int = 50):
        if clients_number > 100:
            clients_number = 100
        clients = []
        combinations = list(itertools.product(cls.client_names, cls.last_names))
        random.shuffle(combinations) 
        combinations = random.sample(combinations,k=clients_number)

        for i, (first, last) in enumerate(combinations, 1):
            mes = random.choice([5, 6])
            dia = random.randint(1, 28)
            fecha_alta = datetime.date(2024, mes, dia)
            full_name = f"{first} {last}"
            clients.append(Client(
                id=i,
                name=full_name,
                fecha_alta=str(fecha_alta),
                activo=True
            ))
        return clients

class ClientServicesGenerator:
    tipos_servicio = ["Recolección", "Disposición"]
    tipos_residuo = ["Orgánico", "Plástico", "Metal", "Vidrio"]
    statuses = ["Completado", "Pendiente", "Cancelado"]

    @classmethod
    def generate_client_services(cls,clients : List[Client]):

        # Crear servicios aleatorios para mayo y junio de 2024
        services = []
        service_id = 1
        for client in clients:
            for _ in range(2):  # 2 servicios por cliente
                fecha = datetime.date(2024, random.choice([5, 6]), random.randint(1, 28))
                service = Service(
                    id=service_id,
                    client_id=str(client.id),
                    fecha=str(fecha),
                    tipo_servicio=random.choice(cls.tipos_servicio),
                    tipo_residuo=random.choice(cls.tipos_residuo),
                    kg_recolectados=round(random.uniform(500, 1500), 2),
                    relleno_sanitario = random.random() >= 0.5,
                    status = random.choice(cls.statuses),
                    duracion_disposicion_min=random.randint(30, 60),
                    litros_combustible=round(random.uniform(0, 40), 2),
                    km_recorridos=round(random.uniform(0, 25), 2),
                    horas_operacion=round(random.uniform(0.5, 4.0), 1),
                    horas_muertas=round(random.uniform(0.0, 1.0), 1),
                    ingreso_disposicion=random.randint(800, 1600)
                )
                services.append(service)
                service_id += 1

        return services