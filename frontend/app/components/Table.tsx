import React from "react";

interface Column {
  key: string;
  header: string;
}

interface TableProps {
  columns: Column[];
  data: Record<string, any>[];
  actions?: (row: Record<string, any>) => React.ReactNode;
}

const Table: React.FC<TableProps> = ({ columns, data, actions }) => {
  return (
    <div className="overflow-x-auto">
      <table className="min-w-full border-collapse border border-background bg-white rounded-lg">
        <thead>
          <tr>
            {columns.map((col) => (
              <th
                key={col.key}
                className="p-3 border border-background text-center text-sideground"
              >
                {col.header}
              </th>
            ))}
            {actions && (
              <th className="p-3 border border-background text-center text-sideground">
                Actions
              </th>
            )}
          </tr>
        </thead>
        <tbody>
          {data.map((row, index) => (
            <tr key={index} className="bg-white text-center">
              {columns.map((col) => (
                <td
                  key={col.key}
                  className="p-3 border border-background text-colortext "
                >
                  {row[col.key]}
                </td>
              ))}
              {actions && (
                <td className="p-3 border border-background text-colortext text-center">
                  {actions(row)}
                </td>
              )}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Table;
