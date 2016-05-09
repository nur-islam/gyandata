<html>
<head>
<script src="js/jquery.js"></script>
<script type="text/javascript">
$("document").ready(function() {
	if(window.location.href.split('=')[1]){
		$('#editorId').val(window.location.href.split('=')[1]);
	} 
	
});
	function insertData() {
		var uploadContent = $('#uploadContent').html(),
			ckEditorId = $('#editorId').val();
		if(ckEditorId == 'register'){
			var img = $.parseHTML(uploadContent);
			window.opener.$('#uploadPreview').attr('src',img[0].attributes.src.value);
			window.opener.$('#uploadImageValue').val(img[0].attributes.src.value);
			
		} else {
			if (window.opener.CKEDITOR.instances[''+ckEditorId]) {
				uploadContent = window.opener.CKEDITOR.instances[''+ckEditorId].getData()
						+ uploadContent;
				window.opener.CKEDITOR.instances[''+ckEditorId]
						.setData(uploadContent);
			} else {
				window.opener.CKEDITOR.replace(''+ckEditorId);
				window.opener.CKEDITOR.instances[''+ckEditorId]
						.setData(uploadContent);
			}
		}

		window.close($('#download-link').html());
	}
</script>
</head>
<body>
	<%
		String uploadData = (String) request.getAttribute("uploadData");
	%>
	<%
		String editorId = (String) request.getAttribute("editorId");
	%>
	<%
		if (uploadData != null && uploadData.length() > 0) {
	%>
	<div id="uploadContent"><%=uploadData%></div>
	<br>
	<button id="uploadData" onclick="insertData()">Insert Data</button>
	<input type="hidden" id="editorId" name="editorId"
		value="<%=editorId%>">
	<%
		} else {
	%>
	<form action="uploaddownloadcontroller" method="post"
		enctype="multipart/form-data">
		Select File to Upload:<input type="file" name="fileName"> <br>
		<input type="hidden" name="action" value="uploadFile"> <input
			type="submit" value="Upload">
		<input type="hidden" id="editorId" name="editorId">
	</form>
	<%
		}
	%>	
</body>
</html>