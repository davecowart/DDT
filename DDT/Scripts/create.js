function createUploader() {
	var uploader = new qq.FileUploader({
		element: document.getElementById('drop'),
		action: '/Character/CreateFromUpload',
		allowedExtensions: ['dnd4e'],
		debug: true
	});
}
