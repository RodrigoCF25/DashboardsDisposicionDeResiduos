import { PieChart as RechartsPieChart, Pie, Cell, Legend, Tooltip, ResponsiveContainer } from "recharts";
import styles from "../Charts.module.css"


const COLORS = [
  "#5BC0FF", // blue light
  "#843ADD", // purple
  "#5300B8", // blue deep
  "#2A8AD9", // blue medium
  "#8840A7", // purple dark
  "#56A4DD", // blue soft
  "#3961A8", // blue dark
];


function PieChart({ title, data, groupBy, metricField = "kg", topN = 3 }) {
  const grouped = data.reduce((acc, item) => {
    const key = item[groupBy];
    const value = item[metricField];
    if (key && typeof value === "number") {
      acc[key] = (acc[key] || 0) + value;
    }
    return acc;
  }, {});

  const entries = Object.entries(grouped)
    .map(([name, value]) => ({ name, value }))
    .sort((a, b) => b.value - a.value);

  const top = entries.slice(0, topN);
  const others = entries.slice(topN);
  const othersTotal = others.reduce((sum, item) => sum + item.value, 0);

  const finalData = [...top];
  if (othersTotal > 0) {
    finalData.push({ name: "Otros", value: othersTotal });
  }

  return (
    <div className={styles.recharts_wrapper}>
        <h2 className={styles.title}>{title}</h2>
        <ResponsiveContainer width="100%" height={300}>
            <RechartsPieChart>
                <Pie
                data={finalData}
                dataKey="value"
                nameKey="name"
                outerRadius={80}
                label={({ name, percent }) =>
                    `${name}: ${(percent * 100).toFixed(1)}%`
                }
                >
                {finalData.map((entry, index) => (
                    <Cell key={`cell-${index}`} fill={COLORS[index % COLORS.length]} />
                ))}
                </Pie>
                <Tooltip />
                <Legend />
            </RechartsPieChart>
        </ResponsiveContainer>
    </div>
    
  );
}

export {PieChart}