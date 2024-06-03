import React, { useEffect, useRef, useState } from "react";
import styles from "./Home.module.css";
import Web3 from "web3";
import { useNavigate } from "react-router-dom";
import { useWallet } from "../../WalletContext";

const Home = () => {
  const { account, isConnected, setIsConnected, setAccount } = useWallet();
  const navigate = useNavigate();
  const nodeRef = useRef(null);
  const [isVisible, setIsVisible] = useState(true);

  const connectWallet = async () => {
    if (window.ethereum) {
      try {
        const web3 = new Web3(window.ethereum);
        await window.ethereum.enable();
        const accounts = await web3.eth.getAccounts();
        console.log("Account connected: ", accounts[0]);
        setIsConnected(true);
        setAccount(accounts[0]);
        setIsVisible(false);
        setTimeout(() => {
          navigate("/oracle");
        }, 0);
      } catch (err) {
        console.error("Failed to connect wallet: ", err);
      }
    } else {
      console.log("Ethereum object doesn't exist!");
    }
  };

  useEffect(() => {
    if (window.ethereum) {
      window.ethereum
        .request({ method: "eth_requestAccounts" })
        .then((accounts) => setAccount(accounts[0]))
        .catch((err) => console.error(err));
    }
  }, []);

  useEffect(() => {
    const node = nodeRef.current;
    setTimeout(() => {
      node.style.opacity = isVisible ? "1" : "0";
    }, 0);
  }, [isVisible]);

  useEffect(() => {
    setIsVisible(true);
  }, []);

  return (
    <div
      ref={nodeRef}
      style={{
        opacity: "0",
        transition: "opacity 0.3s ease-in-out",
      }}
    >
      <div className={styles.homeContainer}>
        <h1 className={styles.homeTitle}>Proracle</h1>
        <p className={styles.homeSubtitle}>
          Securely bridge off-chain data to blockchains via zero-knowledge
          proofs
        </p>
        <button className={styles.homeButton} onClick={connectWallet}>
          {isConnected
            ? `Connected to ${
                account
                  ? `${account.slice(0, 6)}...${account.slice(-4)}`
                  : "Loading..."
              }`
            : "Connect Wallet"}
        </button>
      </div>
    </div>
  );
};

export default Home;
