from dataclasses import dataclass

@dataclass
class Client:
    id : int
    name : str
    fecha_alta : str
    activo : bool

    def __repr__(self):
        return(f"""Client(
    id:{self.id}
    name:{self.name}
    fecha_alta:{self.fecha_alta}
    activo:{self.activo}
)""")
