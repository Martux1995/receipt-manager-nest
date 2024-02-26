import { ESortOrder } from '../enums';

export type SortParams<T> = {
  sort?: Partial<Record<keyof T, ESortOrder>>;
};
