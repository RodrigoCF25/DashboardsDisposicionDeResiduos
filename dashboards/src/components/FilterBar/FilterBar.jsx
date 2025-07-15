import React from 'react'
import styles from './FilterBar.module.css'

const FilterBar = React.memo(function({
  data,
  client,
  setClient,
  month,
  setMonth
}) {
  const uniqueClients = [...new Set(data.map(d => d.cliente))]
  const uniqueMonths = [...new Set(data.map(d => d.mes))]

  return (
    <ul className={styles.filterbar}>
        {
            setClient &&
            <li className={styles.filterbar__item}>
            <select value={client} onChange={e => setClient(e.target.value)}>
            <option value="">Todos los clientes</option>
            {uniqueClients.map(c => (
                <option key={c} value={c}>{c}</option>
            ))}
            </select>
        </li>
        }
      {
        setMonth &&
        <li className={styles.filterbar__item}>
            <select value={month} onChange={e => setMonth(e.target.value)}>
            <option value="">Todos los meses</option>
            {uniqueMonths.map(m => (
                <option key={m} value={m}>{m}</option>
            ))}
            </select>
        </li>
        }
    </ul>
  )
})

export {FilterBar}
