import request from '@/utils/request'

// 查询培训介绍列表
export function listAdvocacy(query) {
    return request({
        url: '/system/advocacy/list',
        method: 'get',
        params: query
    })
}

// 查询培训介绍详细
export function getAdvocacy(id) {
    return request({
        url: '/system/advocacy/' + id,
        method: 'get'
    })
}

// 新增培训介绍
export function addAdvocacy(data) {
    return request({
        url: '/system/advocacy/add',
        method: 'post',
        data: data
    })
}

// 修改培训介绍
export function updateAdvocacy(data) {
    return request({
        url: '/system/advocacy/edit',
        method: 'post',
        data: data
    })
}

// 删除培训介绍
export function delAdvocacy(id) {
    return request({
        url: '/system/advocacy/' + id,
        method: 'delete'
    })
}

// 导出培训介绍
export function exportAdvocacy(query) {
    return request({
        url: '/system/advocacy/export',
        method: 'get',
        params: query
    })
}

// 上传培训介绍图片
export function uploadAdvocacy(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询培训介绍
export function getAdvocacyMobile(type) {
    return request({
        url: '/system/advocacy/query',
        method: 'get',
        params: {
            type
        }
    })
}

// 置顶培训介绍
export function topAdvocacy(data) {
    return request({
        url: '/system/advocacy/topAdvocacy',
        method: 'post',
        data: data
    })
}