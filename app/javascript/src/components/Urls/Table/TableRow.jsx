import React from "react";
import PropTypes from "prop-types";

const TableRow = ({ data, destroyTask, updateTask }) => {
  return (
    <tbody className="bg-white divide-y divide-gray-200">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td
            className="px-6 py-4 text-sm font-medium
            leading-5 text-bb-gray whitespace-no-wrap"
          >
            <a
              href={rowData.url}
              target="_blank"
              rel="noreferrer"
            >
              {rowData.url}
            </a>
          </td>
          <td
            className="px-6 py-4 text-sm font-medium
            leading-5 text-bb-gray whitespace-no-wrap"
          >
            <a
              href={rowData.shortened_url}
              target="_blank"
              rel="noreferrer"
            >
              {rowData.shortened_url}
            </a>
          </td>
        </tr>
      ))}
    </tbody>
  );
};

TableRow.propTypes = {
  data: PropTypes.array.isRequired,
  destroyTask: PropTypes.func,
  updateTask: PropTypes.func,
};

export default TableRow;