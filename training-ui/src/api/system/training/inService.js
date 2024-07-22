import request from '@/utils/request'

// 查询在职培训列表
export function listInService(query) {
    return request({
        url: '/system/inService/list',
        method: 'get',
        params: query
    })
}

// 查询在职培训详细
export function getInService(id) {
    return request({
        url: '/system/inService/' + id,
        method: 'get'
    })
}

// 新增在职培训
export function addInService(data) {
    return request({
        url: '/system/inService/add',
        method: 'post',
        data: data
    })
}

// 修改在职培训
export function updateInService(data) {
    return request({
        url: '/system/inService/edit',
        method: 'post',
        data: data
    })
}

// 删除在职培训
export function delInService(id) {
    return request({
        url: '/system/inService/' + id,
        method: 'delete'
    })
}

// 导出在职培训
export function exportInService(query) {
    return request({
        url: '/system/inService/export',
        method: 'get',
        params: query
    })
}

// 上传在职培训图片
export function uploadInService(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询在职培训
export function getInServiceMobile(type) {
    return request({
        url: '/system/inService/query',
        method: 'get',
        params: {
            type
        }
    })
}
// 置顶在职培训
export function topInService(data) {
    return request({
        url: '/system/inService/topInService',
        method: 'post',
        data: data
    })
}