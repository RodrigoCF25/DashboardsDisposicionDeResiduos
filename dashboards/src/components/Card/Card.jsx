import React from "react"
import styles from "./Card.module.css"

const Card = React.memo(function({value,description}){
    return(
        <div className={styles.card}>
            <p className={styles.title}>{value}</p>
            <p className={styles.description}>{description}</p>
        </div>
    )
})


export {Card}