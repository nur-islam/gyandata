$("document").ready(function() {
	
	loadContent();
	
	$( "#upload-dailog" ).dialog({
        autoOpen: false, 
        modal: true,
        buttons: {
           OK: function() {$(this).dialog("close");}
        },
     });
	
	$('body').on('click', '.edit-profile', function(){
		
	});
     	
	$('body').on('click', '.upload-comment-file', function(e) {
		e.preventDefault();
		
		var windowFeatures = "height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes",
		windowName = "imageUpload",
		editorId = $(this).parents('ul').next().attr('id');
		window.open("./imageEditorPopup.jsp?editorId="+editorId, windowName, windowFeatures);
	});
	
	$('body').on('click', '#postContent', function() {
		removeAllCkeditor();
		CKEDITOR.replace('postContent');
	});
	
	$('body').on('click', '[id^="commentArea"]', function() {
		removeAllCkeditor();
		CKEDITOR.replace(""+$(this).attr('id'));
	});
	$('body').on('click', '#postContentBtn', function() {
		var postData = {
				postContent : CKEDITOR.instances.postContent.getData(),
				userId: $(this).attr('userId')
			};
		$.post('./gyanpediacontroller?action=postContent', postData, function(data, status){
			loadContent();
		});
	});
	$('body').on('click', '[id^="commentBtn"]', function() {
		var ckEditorId = $(this).prev().children().eq(1).attr('id');
		var postData = {
				postContent : CKEDITOR.instances[""+ckEditorId].getData(),
				userId: $(this).attr('userId'),
				contentId: $(this).attr('contentId')
			};
		$.post('./gyanpediacontroller?action=contentReply', postData, function(data, status){
			loadContent();
		});
		
	});
});

function removeAllCkeditor() {
	for (name in CKEDITOR.instances) {
		CKEDITOR.instances[name].destroy(true);
	}
}


function loadContent(){
	removeAllCkeditor();
	$.ajax({
		url : './gyanpediacontroller?action=loadContent',
		dataType : 'json',
		type : 'post',
		contentType : 'application/json',
		data : '',
		processData : false,
		success : function(data, textStatus, jQxhr) {
			populateConetnt(data);
		},
		error : function(jqXhr, textStatus, errorThrown) {
			console.log(errorThrown);
		}
	});
}

function populateConetnt(resultData){
	var commentsData = '';
	$.each( resultData, function( index, comment ){
		commentsData = commentsData+'<div class="well comments-'+index+'">'+
					'<form class="form">'+
				'<div class="user-info">'+
					'<div style="float: left;" class="user-img">'+
						'<img width="50" height="50" src="'+comment.createdImage+'">'+
					'</div>'+
					'<div style="margin-left: 55px;" class="info">'+
						'<h4>'+comment.createdBy+'</h4>'+
						'<p>Posted on '+comment.createdOn+'. Total reply '+comment.contentReplies.length+'</p>'+
						'<p>'+comment.content+'</p>'+
					'</div>'+
				'</div>';
		var repyData = '';		
		//if(comment.contentReplies.length > 0){
			$.each( comment.contentReplies, function( replyIndex, contentReply ){
				repyData = repyData + '<hr><div style="float: left;" class="user-reply-img">'+
				'<img width="20" height="20" src="'+comment.createdImage+'">'+
				'<img width="20" height="20" src="'+contentReply.createdImage+'" alt="'+contentReply.createdBy+'">'+
				'</div>'+
				'&nbsp;<b>'+contentReply.createdBy+'</b> replyed on '+contentReply.createdOn+'<div class="comment-'+replyIndex+'-reply-'+replyIndex+'">'+contentReply.replyContent+'</div>'+
				'';
				/*'<div class="form-group">'+
					'<textarea placeholder="Enter your comment.." class="form-control" id="commentArea"'+replyIndex+'"></textarea>'+
				'</div>'+
				'<button userId="'+comment.userid+'"  contentId="'+replyIndex+'" type="button" class="btn btn-primary" id="commentBtn"'+replyIndex+'">Post</button>';*/
			});
		//} else {
			repyData = repyData + '<hr><div class="form-group">'+
			'<ul class="list-inline">'+
			'<li>Upload File: <a href="" class="upload-comment-file"><i class="glyphicon glyphicon-upload"></i></a></li>'+
		'</ul>'+
				'<textarea placeholder="Enter your comment..." class="form-control" id="commentArea'+index+'"></textarea>'+
			'</div>'+
			'<button  userId="'+$('#loggedInUserId').val()+'"  contentId="'+comment.contentId+'" type="button" class="btn btn-primary" id="commentBtn1">Post</button>';
		//}
		commentsData = commentsData+repyData+'</form>'+'</div><br>';
	});
	
	$('#content-details').html(commentsData);
}