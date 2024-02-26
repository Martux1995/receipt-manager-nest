import { Transform } from 'class-transformer';
import { IsInt, IsOptional, Min } from 'class-validator';

import { ESortOrder } from '../enums';
import { transformSortQueryParams } from '../utils/transform-sort';

export class FindManyGenericDto<T> {
  @IsOptional()
  @Transform(transformSortQueryParams)
  sort?: Partial<Record<keyof T, ESortOrder>>;

  @IsOptional()
  @Transform(({ value }) => Number(value))
  @IsInt()
  @Min(1)
  page?: number = 1;

  @IsOptional()
  @Transform(({ value }) => Number(value))
  @IsInt()
  @Min(1)
  limit?: number = 10;
}
