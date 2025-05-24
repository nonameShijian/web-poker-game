export const USERNAME_TIP = "用户名只能由字母、数字、下划线、汉字组成，长度为4-20个字符";
export const USERNAME_REGEX = /^[a-zA-Z0-9_\u4e00-\u9fa5]{4,20}$/;

export const PASSWORD_TIP = "密码必须包含至少一个大写字母、小写字母、数字，长度为8-20";
export const PASSWORD_REGEX = /^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,20}$/;

export const EMAIL_TIP = "邮箱格式不正确";
export const EMAIL_REGEX = /^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$/;