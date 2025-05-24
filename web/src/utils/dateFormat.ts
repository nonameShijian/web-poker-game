export const format = function (date: Date, fmt: string) {
	const o: { [key: string]: number } = {
		'M+': date.getMonth() + 1, // 月份
		'd+': date.getDate(), // 日
		'H+': date.getHours(), // 小时
		'm+': date.getMinutes(), // 分
		's+': date.getSeconds(), // 秒
		'q+': Math.floor((date.getMonth() + 3) / 3), // 季度
		S: date.getMilliseconds(), // 毫秒
	};

	// 添加对 YYYY 年份的支持
	if (/(y+)/.test(fmt)) {
		fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length));
	}

	// 修正 ss 秒部分的格式化逻辑
	for (const k in o) {
		if (new RegExp('(' + k + ')').test(fmt)) {
			fmt = fmt.replace(RegExp.$1, RegExp.$1.length == 1 ? String(o[k]) : ('00' + o[k]).slice(-2));
		}
	}

	return fmt;
};
