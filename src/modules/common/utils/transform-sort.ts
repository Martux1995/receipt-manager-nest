import { ESortOrder } from '../enums';

export const transformSortQueryParams = ({ value }: { value: string }) => {
  const sort = {};

  for (const val of value.split(',')) {
    const isDesc = val.startsWith('-');

    const varName = isDesc ? val.slice(1) : val;
    sort[varName] = isDesc ? ESortOrder.DESC : ESortOrder.ASC;
  }

  return sort;
};
