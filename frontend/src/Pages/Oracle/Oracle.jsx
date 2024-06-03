import React, { useEffect, useRef, useState } from "react";
import axios from "axios";
import styles from "./Oracle.module.css";
import { useNavigate } from "react-router-dom";

const Oracle = () => {
  const nodeRef = useRef(null);
  const [isVisible, setIsVisible] = useState(false);
  const [stockSymbol, setStockSymbol] = useState("");
  const navigate = useNavigate();

  const handleStockChange = (event) => {
    setStockSymbol(event.target.value);
  };

  const handleGenerateClick = async () => {
    if (["AMZN", "AAPL", "META"].includes(stockSymbol)) {
      try {
        const response = await axios.get(
          `http://localhost:8000/stock/${stockSymbol}`
        );
        console.log(response.data);
      } catch (error) {
        console.error("Error fetching stock data:", error);
      }
      navigate("/result");
    }
  };

  useEffect(() => {
    setIsVisible(true);
  }, []);

  useEffect(() => {
    const node = nodeRef.current;
    setTimeout(() => {
      node.style.opacity = isVisible ? "1" : "0";
    }, 0);
  }, [isVisible]);

  return (
    <div
      ref={nodeRef}
      style={{
        opacity: "0",
        transition: "opacity 0.3s ease-in-out",
      }}
    >
      <div className={styles.oracleContainer}>
        <div className={styles.textContainer}>
          <div className={styles.innerText}>
            GENERATE CUSTOM,{" "}
            <span className={styles.gradientText}>SECURE AND VERIFIABLE </span>
            ORACLES EFFORTLESSLY
          </div>
        </div>
        <div className={styles.gridContainer}>
          <div className={styles.textElement}>Customize Oracle</div>
          <div className={styles.formContainer1}>
            <div className={styles.formText}> Type of Oracle </div>
            <form className={styles.dropdownForm}>
              <select className={styles.dropdown}>
                <option value="select">Select</option>
                <option value="stock">Stock</option>
                <option value="other">Other</option>
              </select>
            </form>
          </div>
          <div className={styles.formContainer2}>
            <div className={styles.formText}> Name of Stock </div>
            <form className={styles.dropdownForm}>
              <select className={styles.dropdown} onChange={handleStockChange}>
                <option value="Select">Select</option>
                <option value="AAPL">Apple</option>
                <option value="AMZN">Amazon</option>
                <option value="META">Meta</option>
                <option value="other">Other</option>
              </select>
            </form>
          </div>
          <div className={styles.formContainer3}>
            <div className={styles.formText}> Blockchain </div>
            <form className={styles.dropdownForm}>
              <select className={styles.dropdown}>
                <option value="select">Select</option>
                <option value="sep">Sepolia Ethereum</option>
                <option value="fuji">Avalanche Fuji</option>
                <option value="other">Other</option>
              </select>
            </form>
          </div>
          <div className={styles.buttonContainer}>
            <button
              className={styles.generateButton}
              onClick={handleGenerateClick}
            >
              Generate
            </button>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Oracle;
