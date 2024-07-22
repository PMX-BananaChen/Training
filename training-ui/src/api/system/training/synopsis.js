import request from '@/utils/request'

// 查询培训封面列表
export function listSynopsis(query) {
    return request({
        url: '/system/synopsis/list',
        method: 'get',
        params: query
    })
}

// 查询培训封面详细
export function getSynopsis(query) {
    return request({
        url: '/system/synopsis/detail',
        method: 'get',
        params: query
    })
}

// 新增培训封面
export function addSynopsis(data) {
    return request({
        url: '/system/synopsis/add',
        method: 'post',
        data: data
    })
}

// 修改培训封面
export function updateSynopsis(data) {
    return request({
        url: '/system/synopsis/edit',
        method: 'post',
        data: data
    })
}

// 删除培训封面
export function delSynopsis(id) {
    return request({
        url: '/system/synopsis/' + id,
        method: 'delete'
    })
}

// 导出培训封面
export function exportSynopsis(query) {
    return request({
        url: '/system/synopsis/export',
        method: 'get',
        params: query
    })
}

// 上传培训封面图片
export function uploadSynopsis(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询培训封面
export function getSynopsisMobile(year) {
    return request({
        url: '/system/synopsis/query',
        method: 'get',
        params: {
            year
        }
    })
}
