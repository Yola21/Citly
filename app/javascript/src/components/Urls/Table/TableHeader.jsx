import React from "react";
import { compose, head, join, juxt, tail, toUpper } from "ramda";

const TableHeader = () => {
  return (
    <thead>
      <tr className="bg-purple-800 text-white">
        <th className="px-6 py-3"></th>
        <th
          className="px-6 py-3 text-lg font-bold leading-4 tracking-wider
        text-left text-opacity-50"
        >
          Original URL
        </th>
        <th
          className="px-6 py-3 text-lg font-bold leading-4 tracking-wider
        text-left text-opacity-50"
        >
          Shortened URL
        </th>
        <th className="px-6 py-3"></th>
      </tr>
    </thead>
  );
};

export default TableHeader;