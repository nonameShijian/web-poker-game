import { ElMessageBox, ElMessage } from 'element-plus';

/**
 * 显示确认删除对话框，并在用户确认后执行后续操作。
 * @param id - 要删除的数据的ID。
 */
export const confirmDelete = async (id?: number) => {
	return ElMessageBox.confirm(id ? `确定删除id为${id}的数据吗？` : '确定删除这条数据吗？', {
		title: '删除提示',
		confirmButtonText: '确定',
		cancelButtonText: '取消',
		type: 'warning',
	});
};

/**
 * 显示确认删除多个数据的对话框，并在用户确认后执行删除操作。
 * @param ids - 要删除的数据的ID数组。
 */
export const confirmDeleteMultiple = async (ids: number[]) => {
	if (ids.length === 0) {
		ElMessage({
			type: 'error',
			message: '没有选择要删除的数据',
		});
		return Promise.reject('没有选择要删除的数据');
	}
	return ElMessageBox.confirm(`确定删除ID为${ids.join(', ')}的数据吗？`, {
		title: '删除提示',
		confirmButtonText: '确定',
		cancelButtonText: '取消',
		type: 'warning',
	});
};
