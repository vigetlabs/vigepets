import { useEffect } from "react";

const Subscriber = ({ subscribeToNew, children }) => {
  useEffect(() => {
    console.log("Using effect: calling subscribeToNew");
    subscribeToNew();
  }, []); // eslint-disable-line react-hooks/exhaustive-deps

  return children;
};

export default Subscriber;
