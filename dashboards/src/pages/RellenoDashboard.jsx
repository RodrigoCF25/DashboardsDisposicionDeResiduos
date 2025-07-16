import { useMemo, useState } from "react";
import { Card } from "../components/Card/Card";
import { FilterBar } from "../components/FilterBar/FilterBar";
import { rellenoData } from "../data/rellenoData";
import { PieChart } from "../components/Charts/PieChart/PieChart";
import { BarChart } from "../components/Charts/BarChart/BarChart";
import styles from "./Dashboard.module.css"

/*
* Toneladas recibidas
* Ingreso por disposición
* Top 3 tipo de residuo
* Top 3 clientes
* Duración promedio de disposición
* Kg promedio por entrega
* Promedio de tiradas por cliente
*/


function RellenoDashboard() {
  const [client, setClient] = useState("");
  const [month, setMonth] = useState("");

  let filteredRellenoData = useMemo(() => {
    return rellenoData.filter((d) => {
      const matchClient = client === "" || d.cliente === client;
      const matchMonth = month === "" || d.mes === month;
      return matchClient && matchMonth;
    });
  }, [client, month]);

    const {
    totalToneladas,
    totalIngreso,
    duracionPromedio,
    kgPromedioPorEntrega,
    promedioTiradasPorCliente
    } = useMemo(() => {
    let sumaKg = 0;
    let sumaIngreso = 0;
    let sumaDuracion = 0;
    let sumaTiradas = 0;
    const clientesUnicos = new Set();

    for (const d of filteredRellenoData) {
        sumaKg += d.kg ?? 0;
        sumaIngreso += d.ingreso ?? 0;
        sumaDuracion += d.duracion_min ?? 0;
        sumaTiradas += d.tiradas ?? 0;
        if (d.cliente) clientesUnicos.add(d.cliente);
    }

    const totalToneladas = (sumaKg / 1000);
    const totalIngreso = sumaIngreso;
    const duracionPromedio = sumaTiradas === 0 ? 0.0 : (sumaDuracion / sumaTiradas);
    const kgPromedioPorEntrega = sumaTiradas === 0 ? 0.0 : (sumaKg / sumaTiradas);
    const promedioTiradasPorCliente = clientesUnicos.size === 0 ? 0.0 : (sumaTiradas / clientesUnicos.size);

    return {
        totalToneladas,
        totalIngreso,
        duracionPromedio,
        kgPromedioPorEntrega,
        promedioTiradasPorCliente
    };
    }, [filteredRellenoData]);

  return (
    <>
        <main className={styles.dashboard}>
            <FilterBar data={rellenoData} setClient={setClient} setMonth={setMonth} />
            <h1>
            {client && month ? `${client} - ${month}` : client || month}
            </h1>

                <div
                className={styles.cards}
                >
                {/* Toneladas recibidas */}
                <Card value={totalToneladas.toFixed(2)} description={"toneladas recibidas"} />
                {/* Ingreso por disposición */}
                <Card value={`$${totalIngreso.toFixed(2)}`} description={"ingreso por disposición"} />
                {/* Duración promedio de disposición */} 
                <Card value={`${duracionPromedio.toFixed(2)} min`} description={"duración promedio por disposición"} />
                {/* Kg promedio por entrega */}
                <Card value={`${kgPromedioPorEntrega.toFixed(2)} kg`} description={"promedio por entrega"} />
                {/* Promedio de tiradas por cliente */}
                <Card value={promedioTiradasPorCliente.toFixed(2)} description={"promedio de tiradas por cliente"} />
                </div>

                <div
                className={styles.charts}
                >

                {getChartsFor(filteredRellenoData, client, month)}
                </div>

        </main>

    </>
  );
}


function computePromedio(data, xField, yField, divisorField) {
  const grouped = {};

  data.forEach(item => {
    const key = item[xField];
    if (!grouped[key]) grouped[key] = { totalY: 0, totalDivisor: 0 };
    grouped[key].totalY += item[yField];
    grouped[key].totalDivisor += item[divisorField];
  });


   return Object.entries(grouped).map(([key, { totalY, totalDivisor }]) => ({
    [xField]: key,
    "promedio": totalDivisor ? totalY / totalDivisor : 0
  }));

}


function getChartsFor(filteredRellenoData, client, month) {
  const charts = [];

  const promedio = (groupBy, field) =>
    computePromedio(filteredRellenoData, groupBy, field, "tiradas");

  const Pie = (id, title, groupBy, field = "kg") => (
    <section key={id} aria-labelledby={id}>
      <PieChart
        id={id}
        title={title}
        data={filteredRellenoData}
        groupBy={groupBy}
        metricField={field}
      />
    </section>
  );


  
  const Bar = (id, title, xField, yField, yLabel, aggregation = "sum", data = filteredRellenoData) => (
    <section key={id} aria-labelledby={id}>
      <BarChart
        id={id}
        title={title}
        data={data}
        xField={xField}
        yField={yField}
        yLabel={yLabel}
        aggregation={aggregation}
      />
    </section>
  );

  if (!client) {
    charts.push(Pie("kg-distribucion-cliente", "Distribución de kg por cliente", "cliente"));
  }
  charts.push(Pie("kg-distribucion-residuo", "Distribución de kg por tipo de residuo", "tipo_residuo"));

  if (!client && !month) {
    charts.push(
      Bar("kg-recibidos-mes", "Kilogramos dispuestos por mes", "mes", "kg", "Kg recibidas"),
      Bar("kg-promedio-por-tirada", "Kg promedio por entrega", "mes", "promedio", "Kg promedio por entrega", "sum", promedio("mes", "kg")),
      Bar("duracion-promedio-mes", "Duración promedio (min) de disposición por mes", "mes", "promedio", "Duración promedio (min)", "sum", promedio("mes", "duracion_min")),
      Bar("numero-tiradas-mes", "Número de tiradas por mes", "mes", "tiradas", "Número de tiradas")
    );
  }

  if (client && !month) {
    charts.push(
      Bar("kg-recibidos-mes-cliente", "Kilogramos dispuestos por mes", "mes", "kg", "Kg recibidos"),
      Bar("kg-promedio-por-tirada", "Kg promedio por entrega", "mes", "promedio", "Kg promedio por entrega", "sum", promedio("mes", "kg")),
      Bar("duracion-promedio-mes-cliente", "Duración promedio (min) de disposición por mes", "mes", "promedio", "Duración promedio (min)", "sum", promedio("mes", "duracion_min")),
      Bar("numero-tiradas-mes-cliente", "Número de tiradas por mes", "mes", "tiradas", "Número de tiradas")
    );
  }

  if (!client && month) {
    charts.push(
      Bar("kg-recibidos-cliente-mes", "Kilogramos dispuestos", "cliente", "kg", "Kg recibidos"),
      Bar("duracion-promedio-cliente-mes", "Duración promedio (min) de disposición", "cliente", "promedio", "Duración promedio (min)", "sum", promedio("cliente", "duracion_min")),
      Bar("numero-tiradas-cliente-mes", "Número de tiradas", "cliente", "tiradas", "Número de tiradas")
    );
  }

  if (client && month) {
    charts.push(
      Bar("ingreso-tipo-residuo", "Ingreso por tipo de residuo", "tipo_residuo", "ingreso", "Ingreso ($)"),
      Bar("duracion-tipo-residuo", "Duración promedio (min) por tipo de residuo", "tipo_residuo", "promedio", "Duración promedio (min)", "sum", promedio("tipo_residuo", "duracion_min")),
      Bar("tiradas-tipo-residuo", "Tiradas por tipo de residuo", "tipo_residuo", "tiradas", "Tiradas por tipo de residuo")
    );
  }

  return charts;
}



export { RellenoDashboard };
