import request from '@/utils/request'

// 查询游戏房间聊天记录列表
export function listMessageAdmin(query) {
  return request({
    url: '/message/messageAdmin/list',
    method: 'get',
    params: query
  })
}

// 查询游戏房间聊天记录详细
export function getMessageAdmin(messageId) {
  return request({
    url: '/message/messageAdmin/' + messageId,
    method: 'get'
  })
}

// 新增游戏房间聊天记录
export function addMessageAdmin(data) {
  return request({
    url: '/message/messageAdmin',
    method: 'post',
    data: data
  })
}

// 修改游戏房间聊天记录
export function updateMessageAdmin(data) {
  return request({
    url: '/message/messageAdmin',
    method: 'put',
    data: data
  })
}

// 删除游戏房间聊天记录
export function delMessageAdmin(messageId) {
  return request({
    url: '/message/messageAdmin/' + messageId,
    method: 'delete'
  })
}
