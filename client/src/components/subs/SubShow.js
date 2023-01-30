const SubShow = ({ id, title, deleteSub }) => {
  // this will keep track of if we are editing

  // conditional rendering - display base off of a condition
  return (
    <>
      <h3>{title}</h3>
      <button onClick={console.log("editttt")}> Edit</button>
      <button onClick={() => deleteSub(id)}> Delete</button>
    </>
  );
};

export default SubShow;
