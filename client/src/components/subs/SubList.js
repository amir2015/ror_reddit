import SubShow from "./SubShow";

const SubList = ({ subs, deleteSub }) => (
  <>
    {subs.map((sub) => (
      <SubShow key={sub.id} {...sub} deleteSub={deleteSub} />
    ))}
  </>
);

export default SubList;
