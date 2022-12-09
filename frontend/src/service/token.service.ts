import type { UserItem } from "@/types/api/system/user";
type StorageItem = 'user' | 'admin'
class TokenService {
  getLocalRefreshToken(role: StorageItem = 'user') {
    const user = JSON.parse(localStorage.getItem(role)!);
    return user?.refreshToken;
  }

  getLocalAccessToken(role: StorageItem = 'user') {
    const user = JSON.parse(localStorage.getItem(role)!);
    return user?.accessToken;
  }

  getLocalTokenExpired(role: StorageItem = 'user') {
    const user = JSON.parse(localStorage.getItem(role)!);
    return user?.tokenExpired;
  }

  updateLocalAccessToken(token: string, tokenExpired: number, role: StorageItem = 'user') {
    let user = JSON.parse(localStorage.getItem(role)!);
    user.accessToken = token;
    user.tokenExpired = tokenExpired;
    localStorage.setItem(role, JSON.stringify(user));
  }

  getUser() {
    return JSON.parse(localStorage.getItem("user")!);
  }

  setUser(user: UserItem) {
    localStorage.setItem("user", JSON.stringify(user));
  }

  removeUser() {
    localStorage.removeItem("user");
  }

  getAdmin() {
    return JSON.parse(localStorage.getItem("admin")!);
  }

  setAdmin(user: UserItem) {
    localStorage.setItem("admin", JSON.stringify(user));
  }

  removeAdmin() {
    localStorage.removeItem("admin");
  }
}

export default new TokenService();