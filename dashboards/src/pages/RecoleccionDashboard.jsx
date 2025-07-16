import { useMemo, useState } from "react";
import { Card } from "../components/Card/Card";
import { FilterBar } from "../components/FilterBar/FilterBar";
import { recoleccionData } from "../data/recoleccionData";
import { SimpleBarChart, BarChart } from "../components/Charts/BarChart/BarChart";
import styles from "./Dashboard.module.css"

/*
* Toneladas dispuestas 
* Toneladas por kilómetro o por hora 
* Rendimiento por hora 
* Kilómetros recorridos 
* Litros de combustible 
* Porcentaje de tiempo muerto 
* Horas muertas 
* Horas activas 

FILTROS: mes y cliente
*/


const processedRecoleccionData = recoleccionData.map(d => ({
    ...d,
    rendimiento: d.horas_activas > 0 ? d.litros / d.horas_activas : 0,
    porcentaje_muerto: (d.horas_muertas + d.horas_activas) > 0
      ? d.horas_muertas / (d.horas_muertas + d.horas_activas)
      : 0
}));


function RecoleccionDashboard(){
    const [client, setClient] = useState("");
    const [month, setMonth] = useState("");

    let filteredRecoleccionData = useMemo(() => {
        return processedRecoleccionData.filter((d) => {
        const matchClient = client === "" || d.cliente === client;
        const matchMonth = month === "" || d.mes === month;
        return matchClient && matchMonth;
        });
    }, [client, month])

    const {
        totalToneladas,
        kmTotales,
        litrosTotales,
        horasMuertasTotales,
        horasActivasTotales,
        toneladasPorKm,
        rendimientoPorHora,
        porcentajeDeTiempoMuerto
    } = useMemo(() => {
        let totalToneladas = 0;
        let totalKm = 0;
        let totalLitros = 0;
        let totalHorasMuertas = 0;
        let totalHorasActivas = 0;

        for (const d of filteredRecoleccionData) {
            totalToneladas += d.toneladas;
            totalKm += d.km;
            totalLitros += d.litros;
            totalHorasMuertas += d.horas_muertas;
            totalHorasActivas += d.horas_activas;
        }

        const horasTotales = totalHorasActivas + totalHorasMuertas

        return {
            totalToneladas: totalToneladas,
            kmTotales: totalKm,
            litrosTotales: totalLitros,
            horasMuertasTotales: totalHorasMuertas,
            horasActivasTotales: totalHorasActivas,
            toneladasPorKm: totalKm === 0 ? 0.0 : totalToneladas / totalKm,
            rendimientoPorHora: totalHorasActivas === 0 ? 0.0 : totalLitros / totalHorasActivas,
            porcentajeDeTiempoMuerto : horasTotales === 0 ? 0.0 : (totalHorasMuertas / horasTotales) * 100
        };
    }, [filteredRecoleccionData]);


    return (
        <>
          <main className={styles.dashboard}>
              <FilterBar data={recoleccionData} setClient={setClient} setMonth={setMonth} />
              <h1>
              {client && month ? `${client} - ${month}` : client || month}
              </h1>
              <div
              className={styles.cards}
              >
              {/*Toneladas dispuestas*/}
              <Card value={totalToneladas.toFixed(2)} description={"toneladas dispuestas"} />
              {/*Toneladas por kilometro*/}
              <Card value={toneladasPorKm.toFixed(2)} description={"toneladas por km"} />
              {/*Rendimiento pot hora*/}
              <Card value={rendimientoPorHora.toFixed(2)} description={"litros / horas activas"} />
              {/*Kilometros recorridos*/}
              <Card value={kmTotales.toFixed(2) + " km"} description={"recorridos"} />
              {/*Litros de combustible*/}
              <Card value={litrosTotales.toFixed(2) + " litros"} description={"de combustible"} />
              {/*Porcentaje de tiempo muerto*/}
              <Card value={porcentajeDeTiempoMuerto.toFixed(2) + "%"} description={"tiempo muerto"} />
              {/*Horas Activas*/}
              <Card value={horasActivasTotales.toFixed(2) + " h"} description={"activas"} />
              {/*Horas Muertas*/}
              <Card value={horasMuertasTotales.toFixed(2) + " h"} description={"muertas"} />
              </div>

              <div className={styles.charts}>
                  {!month && renderCharts(filteredRecoleccionData,"mes")}
                  {month && !client && renderCharts(filteredRecoleccionData,"cliente")}
              </div>


          </main>
        </>
    )
}

const renderCharts = (data, groupBy ) => {
  return (
    <>
      <BarChart 
        title="Toneladas dispuestas"
        data={data}
        xField={groupBy}
        yField="toneladas"
        aggregation="sum"
      />

      <BarChart
        title="Promedio Rendimiento por Hora"
        data={data}
        xField={groupBy}
        yField="rendimiento"
        aggregation="average"
      />

      <BarChart
        title="Promedio Porcentaje de Tiempo Muerto"
        data={data}
        xField={groupBy}
        yField="porcentaje_muerto"
        aggregation="average"
      />

      <BarChart
        title="Kilómetros Recorridos"
        data={data}
        xField={groupBy}
        yField="km"
        aggregation="sum"
      />
      
    </>
  );
};





export {RecoleccionDashboard}