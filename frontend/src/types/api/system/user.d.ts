import { PageQueryParam, PageResult } from '../base';

export interface UserInfo {
  nickname: string;
  avatar: string;
  roles: string[];
  perms: string[];
}

export interface UserQueryParam extends PageQueryParam {
  keywords: string;
  status: number;
  deptId: number;
}

export interface UserItem {
  id: string;
  username: string;
  nickname: string;
  mobile: string;
  gender: number;
  avatar: string;
  email: string;
  status: number;
  name: string;
  lastname: string;
  roleNames: string;
  createTime: string;
  accessToken: string;
  refreshToken: string;
}

export interface UserFormData {
  id: number | undefined;
  deptId: number;
  username: string;
  nickname: string;
  password: string;
  mobile: string;
  email: string;
  gender: number;
  status: number;
  remark: string;
  roleIds: number[];
}

export interface UserImportFormData {
  deptId: number;
  roleIds: number[];
}
