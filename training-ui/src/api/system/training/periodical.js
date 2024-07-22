import request from '@/utils/request'

// 查询培训介绍列表
export function listPeriodical(query) {
    return request({
        url: '/system/periodical/list',
        method: 'get',
        params: query
    })
}

// 查询培训介绍详细
export function getPeriodical(id) {
    return request({
        url: '/system/periodical/' + id,
        method: 'get'
    })
}

// 新增培训介绍
export function addPeriodical(data) {
    return request({
        url: '/system/periodical/add',
        method: 'post',
        data: data
    })
}

// 修改培训介绍
export function updatePeriodical(data) {
    return request({
        url: '/system/periodical/edit',
        method: 'post',
        data: data
    })
}

// 删除培训介绍
export function delPeriodical(id) {
    return request({
        url: '/system/periodical/' + id,
        method: 'delete'
    })
}

// 导出培训介绍
export function exportPeriodical(query) {
    return request({
        url: '/system/periodical/export',
        method: 'get',
        params: query
    })
}

// 上传培训介绍图片
export function uploadPeriodical(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询培训介绍
export function getPeriodicalMobile(type) {
    return request({
        url: '/system/periodical/query',
        method: 'get',
        params: {
            type
        }
    })
}

// 置顶培训介绍
export function topPeriodical(data) {
    return request({
        url: '/system/periodical/topPeriodical',
        method: 'post',
        data: data
    })
}
