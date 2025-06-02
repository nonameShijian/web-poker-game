export default {
	/** 虚拟路径 */
	contextPath: '/',
	/**  后端接口地址 */
	baseUrl: `${location.protocol}//${location.hostname}:8080`,
	host: `${location.hostname}:8080`,
	/** 分页配置 */
	page: {
		/** 当前页码 */
		currentPage: 1,
		/** 每页默认显示条数 */
		size: 5,
	},
};
