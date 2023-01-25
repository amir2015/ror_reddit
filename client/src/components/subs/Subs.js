import React from "react";
import { useState, useEffect } from "react";
import axios from "axios";
const Subs = () => {
  const [subs, setSubs] = useState([]);
  useEffect(() => {
    axios
      .get("/api/subs")
      .then((res) => {
        console.log(res.data);
        setSubs(res.data)
      })
      .catch((err) => console.log(err));
  }, []);
  return <div>All the Subs</div>;
};

export default Subs;
