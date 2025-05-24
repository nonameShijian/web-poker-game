import { Result } from './../interface/index';
import { User } from '@/interface';
import axios from '@/utils/axios';

function arrayBufferToHex(buffer: ArrayBuffer) {
    const hashArray = Array.from(new Uint8Array(buffer));
    return hashArray.map(byte => byte.toString(16).padStart(2, '0')).join('');
}

export const loginUser = async (data: User) => {
    const encoder = new TextEncoder();
    const pwd = encoder.encode(data.password);
    const hash = await window.crypto.subtle.digest("SHA-256", pwd);
    const hexHash = arrayBufferToHex(hash);
	return axios.post('/user/login', { ...data, password: hexHash }, {
        withCredentials: true,
    }) as Promise<Result<{ accessToken: string, refreshToken: string, role: string }>>;
};

export const registerUser = async (data: User) => {
    const encoder = new TextEncoder();
    const pwd = encoder.encode(data.password);
    const hash = await window.crypto.subtle.digest("SHA-256", pwd);
    const hexHash = arrayBufferToHex(hash);
	return axios.post('/user/register', { ...data, password: hexHash }) as Promise<Result<null>>;
};

export const unlockAccountUser = (username: string) => {
	return axios.post('/user/unlockAccount', { username }) as Promise<Result<boolean>>;
};

export const refreshToken = () => {
	return axios.post('/user/refreshToken', {
        refreshToken: localStorage.getItem('refreshToken'),
    }) as Promise<Result<{ accessToken: string }>>;
};

export const getUserInfoByToken = () => {
	return axios.get('/user/getUserInfoByToken', {
        params: {
            token: localStorage.getItem('accessToken'),
        }
    }) as Promise<Result<User>>;
};
export const getAllUsers = () => {
	return axios.get('/user/getAll') as Promise<Result<User[]>>;
};

export const updateUser = (user: User) => {
	return axios.post('/user/update', user) as Promise<Result<User>>;
};

export const deleteUser = (id: number) => {
	return axios.get('/user/delete', { params: { id } }) as Promise<Result<null>>;
};

export const getUserNameById = (id: number) => {
	return axios.get('/user/getNameById', { params: { id } }) as Promise<Result<string>>;
};