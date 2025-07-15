import {
  BarChart as RechartsBarChart,
  CartesianGrid,
  XAxis,
  YAxis,
  Bar,
  Tooltip,
  ResponsiveContainer
} from "recharts";

import styles from "../Charts.module.css"

function BarChart({ title, data, xField, yField, aggregation = "sum" }) {
  const chartData = data.reduce((acc, item) => {
    const xValue = item[xField];
    const yValue = item[yField];

    if (!acc[xValue]) {
      acc[xValue] = { sum: 0, count: 0 };
    }
    acc[xValue].sum += yValue;
    acc[xValue].count += 1;

    return acc;
  }, {});

  const chartEntries = Object.entries(chartData).map(([name, stats]) => ({
    name,
    value: aggregation === "average" ? stats.sum / stats.count : stats.sum,
  }));

  return (
    <div className={styles.recharts_wrapper}>
      <h2 className={styles.title}>{title}</h2>
      <ResponsiveContainer width="100%" height={300}>
        <RechartsBarChart data={chartEntries}>
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="name" />
          <YAxis />
          <Tooltip />
          <Bar dataKey="value" fill="#5BC0FF" />

        </RechartsBarChart>
      </ResponsiveContainer>
    </div>
  );
}

export { BarChart };
