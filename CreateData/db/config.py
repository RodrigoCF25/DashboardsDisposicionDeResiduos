from dataclasses import dataclass

@dataclass
class Config:
    dbname : str
    user : str
    password : str
    host : str
    port : str