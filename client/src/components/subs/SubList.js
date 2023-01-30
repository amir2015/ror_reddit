import SubShow from "./SubShow";

const SubList = ({ subs }) => (
  <>
    {subs.map((sub) => (
      <SubShow key={sub.id} {...sub} />
    ))}
  </>
);

export default SubList;
