import {Message} from "element-ui";

export function handleBlobRenameFile(res, fileName) {
  console.log(res)
  var blob = new Blob([res], {type: res.type})
  if (res.type === "application/json") {
    blob.text().then(data => checkIsFile(data))
      .then(isFile => {
        if (isFile) {
          downloadBlob(blob, fileName)
        }
      })
  } else {
    downloadBlob(blob, fileName)
  }
}
function checkIsFile(data) {
  var json = JSON.parse(data);
  if (json.code !== undefined && json.code !== 200) {
    Message({
      message: json.msg,
      type: 'error',
      duration: 3 * 1000
    })
    return false;
  }
  return true;
}

function downloadBlob(blob, fileName) {
  const aLink = document.createElement('a')
  aLink.style.display = 'none'
  aLink.href = URL.createObjectURL(blob)
  aLink.setAttribute('download', fileName) // 设置下载文件名称
  document.body.appendChild(aLink)
  aLink.click()
  URL.revokeObjectURL(aLink.href);//清除引用
  document.body.removeChild(aLink);
}
