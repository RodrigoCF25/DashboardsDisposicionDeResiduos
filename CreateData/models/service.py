from dataclasses import dataclass

@dataclass
class Service:
    id : int
    client_id : str
    fecha : str
    tipo_servicio : str
    tipo_residuo : str
    kg_recolectados : float
    relleno_sanitario : bool
    status : str
    duracion_disposicion_min : int
    litros_combustible : float
    km_recorridos : float
    horas_operacion : float
    horas_muertas : float
    ingreso_disposicion : float

    def __repr__(self):
        return f"""Service(
    id: {self.id},
    client_id: {self.client_id},
    fecha: {self.fecha},
    tipo_servicio: {self.tipo_servicio},
    tipo_residuo: {self.tipo_residuo},
    kg_recolectados: {self.kg_recolectados},
    relleno_sanitario: {self.relleno_sanitario},
    status: {self.status},
    duracion_disposicion_min: {self.duracion_disposicion_min},
    litros_combustible: {self.litros_combustible},
    km_recorridos: {self.km_recorridos},
    horas_operacion: {self.horas_operacion},
    horas_muertas: {self.horas_muertas},
    ingreso_disposicion: {self.ingreso_disposicion}
)"""
