import { createContext, useState, useContext } from "react";

const WalletContext = createContext();

export const WalletProvider = ({ children }) => {
  const [isConnected, setIsConnected] = useState(false);
  const [account, setAccount] = useState(null);

  return (
    <WalletContext.Provider
      value={{ isConnected, setIsConnected, account, setAccount }}
    >
      {children}
    </WalletContext.Provider>
  );
};

export const useWallet = () => useContext(WalletContext);
