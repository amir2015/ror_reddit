import { useState, useEffect } from "react";
import axios from "axios";
import SubList from "./SubList";
import SubForm from "./SubForm";

// this is where all the CRUD are in the front end
const Subs = () => {
  // where we are storing all the subs in the front end
  const [subs, setSubs] = useState([]);

  // this will run before we display to the page
  useEffect(() => {
    // http verb and url
    // subs index action
    // res -> all of your subs from your db
    axios
      .get("/api/subs")
      .then((res) => setSubs(res.data)) // storing all the subs from the db to the component state
      .catch((err) => console.log(err));
  }, []);
  const addSub = (sub) => {
    axios
      .post("/api/subs", { sub })
      // .then((res) => setSubs([...subs, res.data]))
      .then((res) => setSubs([...subs, res.data]))
      .catch((err) => console.log(err));
  };
  const deleteSub = (id) => {
    axios
      .delete(`/api/subs/${id}`)
      .then((res) => {
        setSubs(subs.filter((s) => s.id !== id));
      })
      .catch((err) => console.log(err));
  };
  return (
    <>
      <h1>All Sub Reddits</h1>
      <SubList subs={subs} deleteSub={deleteSub} />
      <SubForm addSub={addSub} />
    </>
  );
};

export default Subs;
