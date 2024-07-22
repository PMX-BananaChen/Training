import request from '@/utils/request'

// 查询培训PDF文件列表
export function listPDFFile(query) {
    return request({
        url: '/system/pdfFile/list',
        method: 'get',
        params: query
    })
}

// 新增培训PDF文件
export function addPDFFile(data) {
    return request({
        url: '/system/pdfFile/add',
        method: 'post',
        data: data
    })
}

// 修改培训PDF文件
export function updatePDFFile(data) {
    return request({
        url: '/system/pdfFile/edit',
        method: 'post',
        data: data
    })
}

// 删除培训PDF文件
export function delPDFFile(id) {
    return request({
        url: '/system/pdfFile/' + id,
        method: 'delete'
    })
}

// 导出培训PDF文件
export function exportPDFFile(query) {
    return request({
        url: '/system/pdfFile/export',
        method: 'get',
        params: query
    })
}

// 上传培训PDF文件图片
export function uploadPDFFile(data) {
    return request({
        url: '/system/pdfFile/upload',
        method: 'post',
        data: data
    })
}



