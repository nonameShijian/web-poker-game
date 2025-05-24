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
const axiosInstance = axios.create({ baseURL: '/api', timeout: 8000 });

// 请求配置
axiosInstance.interceptors.request.use((config) => {
    const accessToken = localStorage.getItem('accessToken');
    if (accessToken) {
        config.headers['Authorization'] = accessToken;
    }
    return config;
});

// 响应配置
axiosInstance.interceptors.response.use((res) => {
    if (res?.data?.code === 500 && res.data.msg === '未登录') {
        ElMessage.error('请登录');
        router.push("/auth");
    }
    if (res?.data?.code === 200) {
        if (res.data.data?.accessToken) localStorage.setItem('accessToken', res.data.data.accessToken);
        if (res.data.data?.refreshToken) localStorage.setItem('refreshToken', res.data.data.refreshToken);
    }
    return res.data;
});

export default axiosInstance;