import request from '@/utils/request'

// 查询用护胜负情况列表
export function listUserGameInfo(query) {
  return request({
    url: '/userGameInfo/userGameInfo/list',
    method: 'get',
    params: query
  })
}

// 查询用护胜负情况详细
export function getUserGameInfo(id) {
  return request({
    url: '/userGameInfo/userGameInfo/' + id,
    method: 'get'
  })
}

// 新增用护胜负情况
export function addUserGameInfo(data) {
  return request({
    url: '/userGameInfo/userGameInfo',
    method: 'post',
    data: data
  })
}

// 修改用护胜负情况
export function updateUserGameInfo(data) {
  return request({
    url: '/userGameInfo/userGameInfo',
    method: 'put',
    data: data
  })
}

// 删除用护胜负情况
export function delUserGameInfo(id) {
  return request({
    url: '/userGameInfo/userGameInfo/' + id,
    method: 'delete'
  })
}
