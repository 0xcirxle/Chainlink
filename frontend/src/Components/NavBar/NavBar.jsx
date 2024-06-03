import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import styles from "./NavBar.module.css";
import BlockiesSvg from "blockies-react-svg";
import { useWallet } from "../../WalletContext";
const NavBar = () => {
  const { account, setAccount } = useWallet();
  const navigate = useNavigate();

  useEffect(() => {
    if (window.ethereum) {
      window.ethereum
        .request({ method: "eth_requestAccounts" })
        .then((accounts) => setAccount(accounts[0]))
        .catch((err) => console.error(err));
    }
  }, []);

  return (
    <div
      style={{
        display: "flex",
        justifyContent: "center",
        alignContent: "center",
      }}
    >
      <nav className={styles.navbar}>
        <button onClick={() => navigate("/")} className={styles.navbarTitle}>
          PRORACLE
        </button>
        {/* <button
          onClick={() => window.open("https://www.example.com", "_blank")}
          className={styles.navbarLink}
        >
          T-rwa Demo
        </button> */}
        <div className={styles.walletStatus}>
          <div className={styles.navListRight}>
            <div className={styles.wallet}>
              <BlockiesSvg
                address={account || "0x000000"}
                style={{
                  width: 32,
                  height: 32,
                  borderRadius: 16,
                  marginRight: 8,
                }}
              />
              <div className={styles.details}>
                <div>
                  {account && `${account.slice(0, 6)}...${account.slice(-4)}`}
                </div>
              </div>
            </div>
          </div>
        </div>
      </nav>
    </div>
  );
};

export default NavBar;
