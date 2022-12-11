import { PageQueryParam, PageResult } from '../base';

export interface UserInfo {
}
export type Role = ['user'?, 'admin'?, 'moderator'?]

export interface UserItem {
  username: string;
  // nickname?: string;
  // gender?: string;
  avatar?: string;
  email: string;
  // status?: number;
  name: string;
  password?: string;
  lastname: string;
  address: string;
  city: string;
  phone: string;
  roles: Role;
  createTime?: string;
  accessToken?: string;
  refreshToken?: string;
}

export type UserPageResult = PageResult<UserItem[]>;

export interface UserQuery {
  "username"?: string;
  "email"?: string;
  "name"?: string;
  "lastname"?: string;
  "roles"?: string;
  "address"?: string;
  "city"?: string;
  "phone"?: string;
}

export type UserQueryParams = PageQueryParam<UserQuery>;

export interface UserFormData {
  username?: string;
  email?: string;
  name?: string;
  lastname?: string;
  password?: string;
  roles?: Role;
  address?: string;
  city?: string;
  phone?: string;
}

export interface UserUpdateForm {
  "email"?: string;
  "name"?: string;
  "lastname"?: string;
  "roles"?: string;
  "address"?: string;
  "city"?: string;
  "phone"?: string;
}