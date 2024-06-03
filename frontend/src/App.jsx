import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { WalletProvider } from "./WalletContext";
import Home from "./Pages/Home/Home";
import Oracle from "./Pages/Oracle/Oracle";
import Result from "./Pages/Result/Result";
import NavBar from "./Components/NavBar/NavBar";

const Layout = ({ children }) => (
  <>
    <NavBar />
    {children}
  </>
);

const App = () => {
  return (
    <WalletProvider>
      <Router>
        <>
          <Routes>
            <Route path="/" element={<Home />} />
            <Route
              path="/oracle"
              element={
                <Layout>
                  <Oracle />
                </Layout>
              }
            />
            <Route
              path="/result"
              element={
                <Layout>
                  <Result />
                </Layout>
              }
            />
          </Routes>
        </>
      </Router>
    </WalletProvider>
  );
};

export default App;
