import { useEffect, useMemo, useState } from "react";
import { Card } from "../components/Card/Card";
import { FilterBar } from "../components/FilterBar/FilterBar";
import { rellenoData } from "../data/rellenoData";
import { PieChart } from "../components/Charts/PieChart/PieChart";
import { BarChart } from "../components/Charts/BarChart/BarChart";
import styles from "./Dashboard.module.css"


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

  const totalToneladas = useMemo(() => {
    return (filteredRellenoData.reduce((sum, d) => sum + d.kg, 0) / 1000).toFixed(2);
  }, [filteredRellenoData]);

  const totalIngreso = useMemo(() => {
    return filteredRellenoData.reduce((sum, d) => sum + d.ingreso, 0).toFixed(2);
  }, [filteredRellenoData]);

  const duracionPromedio = useMemo(() => {
    const totalDuracion = filteredRellenoData.reduce((sum, d) => sum + d.duracion_min, 0);
    const totalTiradas = filteredRellenoData.reduce((sum, d) => sum + d.tiradas, 0);
    if (totalTiradas === 0) return 0;
    return (totalDuracion / totalTiradas).toFixed(2);
  }, [filteredRellenoData]);

  const kgPromedioPorEntrega = useMemo(() => {
    const totalKg = filteredRellenoData.reduce((sum, d) => sum + d.kg, 0);
    const totalTiradas = filteredRellenoData.reduce((sum, d) => sum + d.tiradas, 0);
    if (totalTiradas === 0) return 0;
    return (totalKg / totalTiradas).toFixed(2);
  }, [filteredRellenoData]);

  const promedioTiradasPorCliente = useMemo(() => {
    const totalTiradas = filteredRellenoData.reduce((sum, d) => sum + d.tiradas, 0);
    const clientesUnicos = new Set(filteredRellenoData.map((d) => d.cliente)).size;
    return clientesUnicos === 0 ? 0 : (totalTiradas / clientesUnicos).toFixed(2);
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
                <Card value={totalToneladas } description={"toneladas de basura"} />
                {/* Ingreso por disposición */}
                <Card value={`$${totalIngreso}`} description={"ingreso por disposición"} />
                {/* Duración promedio de disposición */} 
                <Card value={`${duracionPromedio} min`} description={"duración promedio por disposición"} />
                {/* Kg promedio por entrega */}
                <Card value={`${kgPromedioPorEntrega} kg`} description={"promedio por entrega"} />
                {/* Promedio de tiradas por cliente */}
                <Card value={promedioTiradasPorCliente} description={"promedio de tiradas por cliente"} />
                </div>

                <div
                className={styles.charts}
                >
                {/* Distribución de kg por cliente */}
                {!client && (
                    <section aria-labelledby="kg-distribucion-cliente">
                    <PieChart
                        id="kg-distribucion-cliente"
                        title="Distribución de kg por cliente"
                        data={filteredRellenoData}
                        groupBy="cliente"
                        metricField="kg"
                    />
                    </section>
                )}

                <section aria-labelledby="kg-distribucion-residuo">
                    <PieChart
                    id="kg-distribucion-residuo"
                    title="Distribución de kg por tipo de residuo"
                    data={filteredRellenoData}
                    groupBy="tipo_residuo"
                    metricField="kg"
                    />
                </section>

                {/* Toneladas recibidas en el tiempo o por cliente */}
                {!client && !month && (
                    <section aria-labelledby="kg-recibidos-mes">
                    <BarChart
                        id="kg-recibidos-mes"
                        title="Kilogramos dispuestos por mes"
                        data={filteredRellenoData}
                        xField="mes"
                        yField="kg"
                        yLabel="Kg recibidas"
                    />
                    </section>
                )}
                {client && !month && (
                    <section aria-labelledby="kg-recibidos-mes-cliente">
                    <BarChart
                        id="kg-recibidos-mes-cliente"
                        title="Kilogramos dispuestos por mes"
                        data={filteredRellenoData}
                        xField="mes"
                        yField="kg"
                        yLabel="Kg recibidos"
                    />
                    </section>
                )}
                {!client && month && (
                    <section aria-labelledby="kg-recibidos-cliente-mes">
                    <BarChart
                        id="kg-recibidos-cliente-mes"
                        title={`Kilogramos dispuestos`}
                        data={filteredRellenoData}
                        xField="cliente"
                        yField="kg"
                        yLabel="Kg recibidos"
                    />
                    </section>
                )}

                {/* Duración promedio de disposición */}
                {!client && !month && (
                    <section aria-labelledby="duracion-promedio-mes">
                    <BarChart
                        id="duracion-promedio-mes"
                        title="Duración promedio (min) de disposición por mes"
                        data={filteredRellenoData}
                        xField="mes"
                        yField="duracion_min"
                        yLabel="Duración promedio (min)"
                        aggregation="average"
                    />
                    </section>
                )}
                {client && !month && (
                    <section aria-labelledby="duracion-promedio-mes-cliente">
                    <BarChart
                        id="duracion-promedio-mes-cliente"
                        title="Duración promedio (min) de disposición por mes"
                        data={filteredRellenoData}
                        xField="mes"
                        yField="duracion_min"
                        yLabel="Duración promedio (min)"
                    />
                    </section>
                )}
                {!client && month && (
                    <section aria-labelledby="duracion-promedio-cliente-mes">
                    <BarChart
                        id="duracion-promedio-cliente-mes"
                        title={`Duración promedio (min) de disposición`}
                        data={filteredRellenoData}
                        xField="cliente"
                        yField="duracion_min"
                        yLabel="Duración promedio (min)"
                    />
                    </section>
                )}

                {/* Número de tiradas en el tiempo o por cliente */}
                {!client && !month && (
                    <section aria-labelledby="numero-tiradas-mes">
                    <BarChart
                        id="numero-tiradas-mes"
                        title="Número de tiradas por mes"
                        data={filteredRellenoData}
                        xField="mes"
                        yField="tiradas"
                        yLabel="Número de tiradas"
                    />
                    </section>
                )}
                {client && !month && (
                    <section aria-labelledby="numero-tiradas-mes-cliente">
                    <BarChart
                        id="numero-tiradas-mes-cliente"
                        title="Número de tiradas por mes"
                        data={filteredRellenoData}
                        xField="mes"
                        yField="tiradas"
                        yLabel="Número de tiradas"
                    />
                    </section>
                )}
                {!client && month && (
                    <section aria-labelledby="numero-tiradas-cliente-mes">
                    <BarChart
                        id="numero-tiradas-cliente-mes"
                        title={`Número de tiradas`}
                        data={filteredRellenoData}
                        xField="cliente"
                        yField="tiradas"
                        yLabel="Número de tiradas"
                    />
                    </section>
                )}

                {client && month && (
                    <>
                    <section aria-labelledby="ingreso-tipo-residuo">
                        <BarChart
                        id="ingreso-tipo-residuo"
                        title={`Ingreso por tipo de residuo`}
                        data={filteredRellenoData}
                        xField="tipo_residuo"
                        yField="ingreso"
                        yLabel="Ingreso ($)"
                        />
                    </section>

                    <section aria-labelledby="duracion-tipo-residuo">
                        <BarChart
                        id="duracion-tipo-residuo"
                        title={`Duración promedio (min) por tipo de residuo`}
                        data={filteredRellenoData}
                        xField="tipo_residuo"
                        yField="duracion_min"
                        yLabel="Duración promedio (min)"
                        />
                    </section>

                    <section aria-labelledby="tiradas-tipo-residuo">
                        <BarChart
                        id="tiradas-tipo-residuo"
                        title={`Tiradas por tipo de residuo`}
                        data={filteredRellenoData}
                        xField="tipo_residuo"
                        yField="tiradas"
                        yLabel="Tiradas por tipo de residuo"
                        />
                    </section>
                    </>
                )}
                </div>

        </main>

    </>
  );
}

export { RellenoDashboard };
