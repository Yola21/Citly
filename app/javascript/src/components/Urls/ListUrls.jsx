import React from "react";
import Table from "./Table";

const ListUrls = ({ data, handleClickCounter, handlePinned }) => {
  return <Table 
    data={data}
    handleClickCounter={handleClickCounter} 
    handlePinned={handlePinned}
  />;
};

export default ListUrls;