import axios from 'axios';
import router from '@/router';
import { ElMessage } from 'element-plus';

//数据请求字符
// axios.defaults.baseURL = process.env.VUE_APP_API_URL;

// 如果请求话费了超过 `timeout` 的时间，请求将被中断
axios.defaults.timeout = 5000;
// 表示跨域请求时是否需要使用凭证
axios.defaults.withCredentials = true;
// axios.defaults.headers.common['token'] =  AUTH_TOKEN
axios.defaults.headers.post['Content-Type'] = 'application/json;charset=UTF-8';
// 允许跨域
axios.defaults.headers.post["Access-Control-Allow-Origin-Type"] = "*";

// 封装请求
console.log(import.meta.env);

const axiosInstance = axios.create({ baseURL: import.meta.env.VITE_VUE_APP_BASE_API, timeout: 8000 });

// 请求配置
axiosInstance.interceptors.request.use((config) => {
    const accessToken = localStorage.getItem('accessToken');
    if (accessToken) {
        config.headers['Authorization'] = 'Bearer ' + accessToken;
    }
    return config;
});

// 响应配置
axiosInstance.interceptors.response.use((res) => {
    if (res?.data?.code === 401) {
        ElMessage.error('登录状态已过期');
        if (window.top && window.top != window.self) {
            window.top.postMessage({ type: 'reload' }, '*');
        }
    }
    return res.data;
});

export default axiosInstance;