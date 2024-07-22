import request from '@/utils/request'

// 查询培训介绍列表
export function listIntroduce(query) {
    return request({
        url: '/system/introduce/list',
        method: 'get',
        params: query
    })
}

// 查询培训介绍详细
export function getIntroduce(id) {
    return request({
        url: '/system/introduce/' + id,
        method: 'get'
    })
}

// 新增培训介绍
export function addIntroduce(data) {
    return request({
        url: '/system/introduce/add',
        method: 'post',
        data: data
    })
}

// 修改培训介绍
export function updateIntroduce(data) {
    return request({
        url: '/system/introduce/edit',
        method: 'post',
        data: data
    })
}

// 删除培训介绍
export function delIntroduce(id) {
    return request({
        url: '/system/introduce/' + id,
        method: 'delete'
    })
}

// 导出培训介绍
export function exportIntroduce(query) {
    return request({
        url: '/system/introduce/export',
        method: 'get',
        params: query
    })
}

// 上传培训介绍图片
export function uploadIntroduce(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询培训介绍
export function getIntroduceMobile(type) {
    return request({
        url: '/system/introduce/query',
        method: 'get',
        params: {
            type
        }
    })
}
// 置顶培训介绍
export function topIntroduce(data) {
    return request({
        url: '/system/introduce/topIntroduce',
        method: 'post',
        data: data
    })
}