import { useState } from "react";

const SubForm = ({ addSub }) => {
  const [sub, setSub] = useState({ title: "" });
  const handleSubmit = (e) => {
    e.preventDefault();
    console.log("when clicked");
  };

  return (
    <>
      <form onSubmit={handleSubmit}>
        <label>Title</label>
        <input
          name="title"
          value={sub.title}
          onChange={(e) => setSub({ ...sub, title: e.target.value })}
          required
        />
        <button type="submit">Submit</button>
      </form>
    </>
  );
};

export default SubForm;
