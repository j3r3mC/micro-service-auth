/* eslint-disable @typescript-eslint/no-unsafe-call */
import {
  IsString,
  MinLength,
  MaxLength,
  Matches,
  IsOptional,
  IsUUID,
} from 'class-validator';

export class CreateChildDto {
  @IsOptional()
  @IsString()
  @MinLength(4)
  @MaxLength(6)
  @Matches(/^[0-9]+$/)
  pin?: string;

  @IsOptional()
  @IsString()
  @MinLength(4)
  @MaxLength(12)
  pseudo?: string;

  @IsUUID()
  parentId: string;
}
