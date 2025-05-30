import request from '@/utils/request'

// 查询游戏房间信息列表
export function listRoomAdmin(query) {
  return request({
    url: '/room/roomAdmin/list',
    method: 'get',
    params: query
  })
}

// 查询游戏房间信息详细
export function getRoomAdmin(roomId) {
  return request({
    url: '/room/roomAdmin/' + roomId,
    method: 'get'
  })
}

// 新增游戏房间信息
export function addRoomAdmin(data) {
  return request({
    url: '/room/roomAdmin',
    method: 'post',
    data: data
  })
}

// 修改游戏房间信息
export function updateRoomAdmin(data) {
  return request({
    url: '/room/roomAdmin',
    method: 'put',
    data: data
  })
}

// 删除游戏房间信息
export function delRoomAdmin(roomId) {
  return request({
    url: '/room/roomAdmin/' + roomId,
    method: 'delete'
  })
}
