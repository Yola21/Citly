import React from "react";
import PropTypes from "prop-types";

const TableRow = ({ data, handleClickCounter }) => {
  return (
    <tbody className="bg-white divide-y divide-gray-200">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td></td>
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
            leading-5 text-bb-gray whitespace-no-wrap cursor-pointer"
            onClick={() => handleClickCounter(rowData.slug, rowData.url, rowData.number_of_clicks)}
          >
            {rowData.shortened_url}
          </td>
          <td>
            {rowData.number_of_clicks}
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