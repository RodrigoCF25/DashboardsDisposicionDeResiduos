# Dashboard de Métricas de Disposición de Residuos

Este proyecto presenta un dashboard interactivo construido con React y Vite para visualizar métricas clave sobre la disposición de residuos.

---

## Instrucciones para correr localmente

```bash
# Clona el repositorio
git clone <url-del-repositorio>

# Entra al directorio del proyecto
cd ./proyecto/dashboards

# Instala las dependencias
npm install

# Inicia el proyecto localmente
npm run dev
```

Esto abrirá la aplicación en tu navegador en la dirección [http://localhost:5173], a menos que hayas configurado otro puerto.

## ENDPOINTS A PROBAR

- /relleno-dashboard
- /recoleccion-dashboard
- /general-dashboard

---

## Dashboards y Cálculo de Métricas

### 1. RellenoDashboard

Filtrado por cliente y mes.

#### Métricas calculadas:

- **Toneladas Recibidas**  
  Se convierten de kilogramos a toneladas:  
  ```js
  totalToneladas = sumaKg / 1000;
  ```

- **Ingreso por Disposición**  
  Suma de ingresos por disposición:  
  ```js
  totalIngreso = sumaIngreso;
  ```

- **Top 3 tipo de residuo**  
  Creacion de un diccionario que tenga como llaves los tipos de residuo y su valor la suma de los kg recolectados de estos.
  ```js
    const grouped = data.reduce((acc, item) => {
    const key = item[groupBy];
    const value = item[metricField];
    if (key && typeof value === "number") {
      acc[key] = (acc[key] || 0) + value;
    }
    return acc
  }, {})
  ```
  Donde key seria el nombre del tipo de residuo y value el valor de los kg en ese registro.

- **Top 3 clientes**  
  Creacion de un diccionario que tenga como llaves los tipos de residuo y su valor la suma de los kg recolectados de estos.
    ```js
    const grouped = data.reduce((acc, item) => {
    const key = item[groupBy];
    const value = item[metricField];
    if (key && typeof value === "number") {
      acc[key] = (acc[key] || 0) + value;
    }
    return acc
  }, {})
  ```
  Donde key seria el nombre del cliente y value el valor de los kg en ese registro.

- **Duración Promedio de Disposición**  
  Calculado como:  
  ```js
  duracionPromedio = sumaTiradas === 0 ? 0 : sumaDuracion / sumaTiradas;
  ```

- **Kilogramos Promedio por Entrega**  
  ```js
  kgPromedioPorEntrega = sumaTiradas === 0 ? 0 : sumaKg / sumaTiradas;
  ```

- **Promedio de Tiradas por Cliente**  
  ```js
  promedioTiradasPorCliente = clientesUnicos.size === 0 ? 0 : sumaTiradas / clientesUnicos.size;
  ```

---

### 3. RecoleccionDashboard

Filtrado por cliente y mes.

#### Métricas calculadas:

- **Total de toneladas**  
  ```js
  totalToneladas += d.toneladas;
  ```

- **Total de kilómetros**  
  ```js
  totalKm += d.km;
  ```

- **Total de litros**  
  ```js
  totalLitros += d.litros;
  ```

- **Total de horas muertas**  
  ```js
  totalHorasMuertas += d.horas_muertas;
  ```

- **Total de horas activas**  
  ```js
  totalHorasActivas += d.horas_activas;
  ```

- **Rendimiento por hora**  
  ```js
  rendimientoPorHora = totalHorasActivas === 0 ? 0.0 : totalLitros / totalHorasActivas;
  ```

- **Porcentaje de tiempo muerto**  
  ```js
  horasTotales = totalHorasActivas + totalHorasMuertas;
  porcentajeDeTiempoMuerto = horasTotales === 0 ? 0.0 : (totalHorasMuertas / horasTotales) * 100;
  ```

- **Toneladas por kilómetro**  
  ```js
  toneladasPorKm = totalKm === 0 ? 0.0 : totalToneladas / totalKm;
  ```

### 3. GeneralDashboard

Muestra métricas generales filtradas por mes.

#### Métricas calculadas:

- **Toneladas Recibidas**  
  Suma total de `d.toneladas`  
  ```js
  acc["totalToneladasRecibidas"] += d.toneladas;
  ```

- **Ingreso por Disposición**  
  Suma total de `d.ingreso_disposicion`  
  ```js
  acc["totalIngresoPorDisposicion"] += d.ingreso_disposicion;
  ```

- **Gasto de Combustible**  
  Suma total de `d.gasto_combustible`  
  ```js
  acc["totalGastoCombustible"] += d.gasto_combustible;
  ```

- **Gasto de Aditivos**  
  Suma total de `d.gasto_aditivos`  
  ```js
  acc["totalGastoAditivos"] += d.gasto_aditivos;
  ```

- **Utilidad Operativa**  
  Se calcula restando los gastos al ingreso por disposición:  
  ```js
  report["utilidadOperativa"] = report.totalIngresoPorDisposicion - (report.totalGastoCombustible + report.totalGastoAditivos);
  ```