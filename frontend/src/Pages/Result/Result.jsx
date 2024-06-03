import React, { useEffect, useRef, useState } from "react";
import styles from "./Result.module.css";
import TradingViewWidget from "../../Components/TradingView/TradingView";

const Result = () => {
  const nodeRef = useRef(null);
  const [isVisible, setIsVisible] = useState(false);

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
      <div className={styles.resultContainer}>
        <div className={styles.mainContent}>
          <div className={styles.addressText}>Oracle Pricefeed Address</div>
          <div className={styles.addressValue}>
            0x9Ed9f443BD1F4d4116579388B46B4e049104efdd
          </div>
          <button className={styles.copyButton}>Copy Address</button>
          <div className={styles.resultText}>AAPL stock | Fuji Chain</div>
        </div>
        <div className={styles.asideContent}>
          <TradingViewWidget />
        </div>
      </div>
    </div>
  );
};

export default Result;
