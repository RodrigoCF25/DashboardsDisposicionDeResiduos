import {
  BarChart as RechartsBarChart,
  CartesianGrid,
  XAxis,
  YAxis,
  Bar,
  Tooltip,
  ResponsiveContainer
} from "recharts";
import React from "react";
import styles from "../Charts.module.css"
import { COLORS } from "../../../assets/colors";

const BarChart = React.memo(
  function ({ title, data, xField, yField, aggregation }) {
    let chartEntries;

    if (aggregation !== undefined) {
      // Agrupación por xField con agregación
      const groupedData = data.reduce((acc, item) => {
        const xValue = item[xField]
        const yValue = item[yField]

        if (!acc[xValue]) {
          acc[xValue] = { sum: 0, count: 0 }
        }

        acc[xValue].sum += yValue
        acc[xValue].count += 1

        return acc
      }, {})

      chartEntries = Object.entries(groupedData).map(([name, stats]) => ({
        name,
        value: aggregation === "average" ? stats.sum / stats.count : stats.sum,
      }))
    } else {

      chartEntries = data.map(item => ({
        name: item[xField],
        value: item[yField],
      }))
    }

    return (
      <div className={styles.recharts_wrapper} style={{ height: "360px" }}>
        <h2 className={styles.title}>{title}</h2>
        <ResponsiveContainer width="100%" height="100%">
          <RechartsBarChart data={chartEntries}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis
              dataKey="name"
              angle={-45}
              textAnchor="end"
              interval={0}
              height={120}
            />
            <YAxis />
            <Tooltip />
            <Bar dataKey="value" fill="#5BC0FF" />
          </RechartsBarChart>
        </ResponsiveContainer>
      </div>
    );
})

const SimpleBarChart = React.memo(function({ title, data, xField, yFields}){

  return (
    <div className={styles.recharts_wrapper} style={{ height: "360px" }}>
      <h2 className={styles.title}>{title}</h2>
      <ResponsiveContainer width="100%" height="100%">
        <RechartsBarChart data={data}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis
            dataKey={xField}
            angle={-45}
            textAnchor="end"
            interval={0}
            height={120}
          />
          <YAxis />
          <Tooltip />
          {yFields.map((field, index) => (
            <Bar
              key={field}
              dataKey={field}
              fill={COLORS[index % COLORS.length]}
              name={field}
            />
          ))}
          
        </RechartsBarChart>
      </ResponsiveContainer>
    </div>
  );
})


export { BarChart, SimpleBarChart};
