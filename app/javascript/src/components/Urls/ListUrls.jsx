import React from "react";
import Table from "./Table";

const ListUrls = ({ data, handleClickCounter }) => {
  return <Table 
    data={data}
    handleClickCounter={handleClickCounter} 
  />;
};

export default ListUrls;