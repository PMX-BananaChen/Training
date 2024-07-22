import request from '@/utils/request'

// 查询培训介绍列表
export function listShare(query) {
    return request({
        url: '/system/share/list',
        method: 'get',
        params: query
    })
}

// 查询培训介绍详细
export function getShare(id) {
    return request({
        url: '/system/share/' + id,
        method: 'get'
    })
}

// 新增培训介绍
export function addShare(data) {
    return request({
        url: '/system/share/add',
        method: 'post',
        data: data
    })
}

// 修改培训介绍
export function updateShare(data) {
    return request({
        url: '/system/share/edit',
        method: 'post',
        data: data
    })
}

// 删除培训介绍
export function delShare(id) {
    return request({
        url: '/system/share/' + id,
        method: 'delete'
    })
}

// 导出培训介绍
export function exportShare(query) {
    return request({
        url: '/system/share/export',
        method: 'get',
        params: query
    })
}

// 上传培训介绍图片
export function uploadShare(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询培训介绍
export function getShareMobile(year) {
    return request({
        url: '/system/share/query',
        method: 'get',
        params: {
            year
        }
    })
}

// 置顶培训介绍
export function topShare(data) {
    return request({
        url: '/system/share/topShare',
        method: 'post',
        data: data
    })
}
