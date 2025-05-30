import request from '@/utils/request'

// 查询历史比赛信息列表
export function listRaceInfoAdmin(query) {
  return request({
    url: '/raceInfoAdmin/raceInfoAdmin/list',
    method: 'get',
    params: query
  })
}

// 查询历史比赛信息详细
export function getRaceInfoAdmin(id) {
  return request({
    url: '/raceInfoAdmin/raceInfoAdmin/' + id,
    method: 'get'
  })
}

// 新增历史比赛信息
export function addRaceInfoAdmin(data) {
  return request({
    url: '/raceInfoAdmin/raceInfoAdmin',
    method: 'post',
    data: data
  })
}

// 修改历史比赛信息
export function updateRaceInfoAdmin(data) {
  return request({
    url: '/raceInfoAdmin/raceInfoAdmin',
    method: 'put',
    data: data
  })
}

// 删除历史比赛信息
export function delRaceInfoAdmin(id) {
  return request({
    url: '/raceInfoAdmin/raceInfoAdmin/' + id,
    method: 'delete'
  })
}
