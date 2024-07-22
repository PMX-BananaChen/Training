import request from '@/utils/request'

// 查询领班课件列表
export function listNEWS(query) {
    return request({
        url: '/system/NEWS/list',
        method: 'get',
        params: query
    })
}

// 查询领班课件详细
export function getNEWS(newsid) {
    return request({
        url: '/system/NEWS/' + newsid,
        method: 'get'
    })
}

// 新增领班课件
export function addNEWS(data) {
    return request({
        url: '/system/NEWS/add',
        method: 'post',
        data: data
    })
}

// 修改领班课件
export function updateNEWS(data) {
    return request({
        url: '/system/NEWS/edit',
        method: 'post',
        data: data
    })
}

// 删除领班课件
export function delNEWS(newsid) {
    return request({
        url: '/system/NEWS/' + newsid,
        method: 'delete'
    })
}

// 导出领班课件
export function exportNEWS(query) {
    return request({
        url: '/system/NEWS/export',
        method: 'get',
        params: query
    })
}

// 上传领班课件图片
export function uploadNEWS(data) {
    return request({
        url: '/system/NEWS/upload',
        method: 'post',
        data: data
    })
}


// 移动端查询领班课件
export function getNEWSMobile( layoutType) {
    return request({
        url: '/system/NEWS/query',
        method: 'get',
        params: {
            layoutType
        }
    })
}

// 获取访问量和点赞量
export function getNum(key, type) {
    return request({
        url: '/system/NEWS/getNum',
        method: 'get',
        params: { key, type }
    })
}

// 置顶领班课件
export function topMPickingNews(data) {
    return request({
        url: '/system/NEWS/topMPickingNews',
        method: 'post',
        data: data
    })
}