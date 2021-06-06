import React from "react";
import PropTypes from "prop-types";
import classnames from 'classnames';

const TableRow = ({ data, handleClickCounter, handlePinned }) => {
  return (
    <tbody className="bg-white divide-y divide-gray-200">
      {data.map(rowData => (
        <tr key={rowData.id}>
          <td className="pl-6 py-4 text-center cursor-pointer whitespace-no-wrap bg-gray-100">
            <i
              className={classnames(
                "transition duration-300 ease-in-out text-2xl hover:text-bb-yellow p-1",
                {
                  "text-bb-border ri-pushpin-2-line":
                    rowData.status !== "pinned",
                },
                {
                  "text-white text-bb-yellow ri-pushpin-2-fill":
                    rowData.status === "pinned",
                }
              )}
              onClick={() => handlePinned(rowData.slug, rowData.status)}
            ></i>
          </td>
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