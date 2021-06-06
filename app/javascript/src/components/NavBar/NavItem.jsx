import React from "react";

const NavItem = ({ name }) => {
  return (
    <h1 
      className="flex items-center px-1 pt-1 mr-3
      font-bold text-lg leading-5
      text-gray-500"
    >
      {name}
    </h1>
  );
};

export default NavItem;