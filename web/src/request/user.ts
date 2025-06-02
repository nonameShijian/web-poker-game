import { Result } from './../interface/index';
import { User } from '@/interface';
import axios from '@/utils/axios';

export function getUserInfoByToken() {
    return axios.get('/getInfo') as Promise<Result<null> & {
        "permissions": string[],
        "roles": string[],
        "user": User
    }>;
}

export function logout() {
    return axios.post('/logout').finally(() => {
        if (window.top && window.top != window.self) {
            window.top.postMessage({ type: 'reload' }, '*');
        }
    })
}
