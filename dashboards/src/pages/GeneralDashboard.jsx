/*
* Toneladas recibidas
* Ingreso por disposición
* Gasto de combustible
* Gasto de aditivos
* Utilidad operativa (ingreso - gastos)

FILTROS: mes
*/

import { useMemo, useState } from "react";
import { Card } from "../components/Card/Card";
import { FilterBar } from "../components/FilterBar/FilterBar";
import { generalData } from "../data/generalData";
import { BarChart, SimpleBarChart } from "../components/Charts/BarChart/BarChart";
import styles from "./Dashboard.module.css"

const processedGeneralData = generalData.map((d)=>({
    ...d,
    "gasto_total" : d.gasto_aditivos + d.gasto_combustible
}))

function GeneralDashboard(){
    const [month, setMonth] = useState("");

    let filteredGeneralData = useMemo(() => {
        return processedGeneralData.filter((d) => {
        return month === "" || d.mes === month;
        });
    }, [month]) 

    const {
        totalToneladasRecibidas,
        totalIngresoPorDisposicion,
        totalGastoCombustible,
        totalGastoAditivos,
        utilidadOperativa
    } = useMemo(()=>{
        const initialValue = {
            "totalToneladasRecibidas" : 0.0,
            "totalIngresoPorDisposicion" : 0.0,
            "totalGastoCombustible" : 0.0,
            "totalGastoAditivos" : 0.0,
        }
        const report = filteredGeneralData.reduce((acc,d)=>{
            acc["totalToneladasRecibidas"] += d.toneladas
            acc["totalIngresoPorDisposicion"] += d.ingreso_disposicion
            acc["totalGastoCombustible"] += d.gasto_combustible
            acc["totalGastoAditivos"] += d.gasto_aditivos
            return acc
        },initialValue)

        report["utilidadOperativa"] = report.totalIngresoPorDisposicion - (report.totalGastoCombustible + report.totalGastoAditivos)
        return report

    },[filteredGeneralData])


    return (
        <main className={styles.dashboard}>
            <FilterBar data={generalData} setMonth={setMonth} />
            <h1>
            {month || ""}
            </h1>
            <div
            className={styles.cards}
            >
               {/*Toneladas recibidas*/}
                <Card value={totalToneladasRecibidas.toFixed(2)} description={"Toneladas recibidas"} />
                {/*Ingreso por disposicion*/}
                <Card value={`$${totalIngresoPorDisposicion.toFixed(2)}`} description={"Ingreso por disposicion"} />
                {/*Gasto de combustible*/}
                <Card value={`$${totalGastoCombustible.toFixed(2)}`} description={"Gasto combustible"} />
                {/*Gasto de aditivos*/}
                <Card value={`$${totalGastoAditivos.toFixed(2)}`} description={"Gasto de aditivos"} />
                {/*Utilidad*/}
                <Card value={`$${utilidadOperativa.toFixed(2)}`} description={"Utilidad"} />
            </div>

            <div className={styles.charts}>
                {
                    !month &&
                    <BarChart
                    title="Toneladas recibidas"
                    data={filteredGeneralData}
                    xField="mes"
                    yField="toneladas"
                    />

                }
                <SimpleBarChart
                title="Ingresos vs Gastos"
                data={filteredGeneralData}
                xField="mes"
                yFields={["ingreso_disposicion","gasto_total"]}
                />

            </div>
        </main>
    )
}


export {GeneralDashboard}